import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceInfoHelper {
  static final _deviceInfo = DeviceInfoPlugin();
  static final _localAuth = LocalAuthentication();

  static Future<String?> getDeviceToken() async {
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch (e) {
      return null;
    }
  }

  static Future<String> getBiometricType() async {
    try {
      final canCheck = await _localAuth.canCheckBiometrics;
      final isSupported = await _localAuth.isDeviceSupported();

      if (!canCheck && !isSupported) {
        return "none";
      }

      final availableBiometrics = await _localAuth.getAvailableBiometrics();

      if (availableBiometrics.contains(BiometricType.face)) {
        return "faceId";
      }

      if (availableBiometrics.contains(BiometricType.fingerprint)) {
        return "fingerprint";
      }

      if (availableBiometrics.contains(BiometricType.strong) ||
          availableBiometrics.contains(BiometricType.weak)) {
        if (Platform.isAndroid) {
          return "fingerprint";
        } else if (Platform.isIOS) {
          return "faceId";
        } else {
          return "fingerprint";
        }
      }

      if (Platform.isAndroid &&
          availableBiometrics.isEmpty &&
          (canCheck || isSupported)) {
        return "fingerprint";
      }
    } catch (e) {
      // Error detecting biometric type
    }
    return "none";
  }

  static Future<Map<String, dynamic>> getDeviceInfo() async {
    String deviceName = "Unknown";
    String osVersion = "Unknown";
    String appVersion = "Unknown";

    try {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        deviceName = "${androidInfo.manufacturer} ${androidInfo.model}";
        osVersion = "Android ${androidInfo.version.release}";
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        deviceName = iosInfo.name;
        osVersion = "iOS ${iosInfo.systemVersion}";
      }

      final packageInfo = await PackageInfo.fromPlatform();
      appVersion = packageInfo.version;
    } catch (e) {
      // Error gathering device info
    }

    return {
      "device_name": deviceName,
      "os_version": osVersion,
      "app_version": appVersion,
    };
  }

  static Future<bool> isBiometricAvailable() async {
    try {
      final canCheck = await _localAuth.canCheckBiometrics;
      final isSupported = await _localAuth.isDeviceSupported();
      final available = await _localAuth.getAvailableBiometrics();

      final hasAny = available.isNotEmpty || (canCheck && isSupported);

      return hasAny;
    } catch (e) {
      return false;
    }
  }

  static Future<bool> authenticateUser(WidgetRef ref) async {
    try {
      final isSupported =
          await _localAuth.canCheckBiometrics ||
          await _localAuth.isDeviceSupported();

      if (!isSupported) {
        return false;
      }

      final available = await _localAuth.getAvailableBiometrics();

      if (available.isEmpty) {
        return false;
      }

      final didAuthenticate = await _localAuth.authenticate(
        localizedReason: 'Please authenticate to log in securely',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      return didAuthenticate;
    } catch (e) {
      return false;
    }
  }

  static Future<Map<String, dynamic>> collectFullDeviceData() async {
    final token = await getDeviceToken();
    final biometricType = await getBiometricType();
    final deviceInfo = await getDeviceInfo();

    return {
      "device_token": token,
      "biometric_type": biometricType,
      "device_info": deviceInfo,
    };
  }

  static Future<Map<String, dynamic>> deviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    final packageInfo = await PackageInfo.fromPlatform();
    final token = await getDeviceToken();
    String deviceId = '';
    String deviceType = '';
    String platform = '';
    String osVersion = '';
    String appVersion = packageInfo.version;

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
      deviceType = 'android';
      platform = androidInfo.model;
      osVersion = androidInfo.version.release;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor ?? '';
      deviceType = 'ios';
      platform = iosInfo.utsname.machine;
      osVersion = iosInfo.systemVersion;
    }

    return {
      "token": token,
      'device_id': deviceId,
      'device_type': platform,
      'platform': deviceType,
      'os_version': osVersion,
      'app_version': appVersion,
    };
  }

  static Future<void> saveFirstTimeCheck(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("first_time", value);
  }

  static Future<bool> getFirstTimeCheck() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("first_time") ?? true;
  }

  static Future<void> saveUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("user_email", email);
  }
}
