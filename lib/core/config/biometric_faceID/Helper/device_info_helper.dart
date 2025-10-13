import 'dart:developer';
import 'dart:io';

import 'package:curnectgate/features/userProfile/Login_setting/state/biometric_provider.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DeviceInfoHelper {
  static final _deviceInfo = DeviceInfoPlugin();
  static final _localAuth = LocalAuthentication();

  /// ✅ Get FCM Device Token
  static Future<String?> getDeviceToken() async {
    try {
      return await FirebaseMessaging.instance.getToken();
    } catch (e) {
      log("❌ Error getting FCM token: $e");
      return null;
    }
  }

  /// Detect Biometric Type (Face ID / Fingerprint)
  static Future<String> getBiometricType() async {
    try {
      final canCheck = await _localAuth.canCheckBiometrics;
      final isSupported = await _localAuth.isDeviceSupported();

      if (!canCheck && !isSupported) {
        log("⚠️ Biometric not supported on this device");
        return "none";
      }

      final availableBiometrics = await _localAuth.getAvailableBiometrics();
      log("🧩 Available biometrics: $availableBiometrics");

      // If the platform reports explicit types, prefer face first
      if (availableBiometrics.contains(BiometricType.face)) {
        return "face_id";
      }

      if (availableBiometrics.contains(BiometricType.fingerprint)) {
        return "fingerprint";
      }

      // Some devices (OEMs) report generic types instead of explicit ones:
      // BiometricType.strong / BiometricType.weak.
      // These often indicate a biometric sensor exists but the vendor hid specifics.
      // Map them to fingerprint as the pragmatic default on Android.
      if (availableBiometrics.contains(BiometricType.strong) ||
          availableBiometrics.contains(BiometricType.weak)) {
        if (Platform.isAndroid) {
          log(
            "⚙️ Detected strong/weak biometric on Android — assuming fingerprint fallback",
          );
          return "fingerprint";
        } else if (Platform.isIOS) {
          // On iOS this is unlikely, but keep a conservative fallback:
          log(
            "⚙️ Detected strong/weak biometric on iOS — assuming face_id fallback",
          );
          return "face_id";
        } else {
          return "fingerprint";
        }
      }

      // Fallback: if platform supports biometrics but list is empty, assume fingerprint on Android
      if (Platform.isAndroid &&
          availableBiometrics.isEmpty &&
          (canCheck || isSupported)) {
        log("⚙️ Android fallback: fingerprint assumed");
        return "fingerprint";
      }
    } catch (e) {
      log("❌ Error detecting biometric type: $e");
    }
    return "none";
  }

  /// ✅ Get device name, OS version, and app version
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
      log("❌ Error getting device info: $e");
    }

    return {
      "device_name": deviceName,
      "os_version": osVersion,
      "app_version": appVersion,
    };
  }

  /// ✅ Check if biometric is supported & available (enrolled)
  static Future<bool> isBiometricAvailable() async {
    try {
      final canCheck = await _localAuth.canCheckBiometrics;
      final isSupported = await _localAuth.isDeviceSupported();
      final available = await _localAuth.getAvailableBiometrics();

      final hasAny = available.isNotEmpty || (canCheck && isSupported);

      log(
        "🧠 Biometric Available: $hasAny | canCheck=$canCheck | supported=$isSupported | available=$available",
      );

      return hasAny;
    } catch (e) {
      log("❌ Biometric check failed: $e");
      return false;
    }
  }

  /// ✅ Authenticate with fingerprint / face
  static Future<bool> authenticateUser(WidgetRef ref) async {
    try {
      final isBiometricEnabled = ref.watch(biometricPrefProvider);
      final isSupported =
          await _localAuth.canCheckBiometrics ||
          await _localAuth.isDeviceSupported();
      log("isSupported: $isSupported");

      if (!isSupported) {
        log("Biometric not supported on this device");
        return false;
      }

      final available = await _localAuth.getAvailableBiometrics();
      log("Available biometrics: $available");

      if (available.isEmpty) {
        log("⚠️ No biometrics enrolled. Ask user to set up fingerprint/face.");
        return false;
      }

      final didAuthenticate = await _localAuth.authenticate(
        localizedReason:
            isBiometricEnabled
                ? 'Authenticate to  disable biometric login'
                : 'Authenticate to  enable biometric login',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      log("Biometric auth result: $didAuthenticate");
      return didAuthenticate;
    } catch (e) {
      log("Authentication error: $e");
      return false;
    }
  }

  // /// ✅ Trigger biometric authentication dialog
  // static Future<bool> authenticateUser({String reason = "Please authenticate"}) async {
  //   try {
  //     final didAuthenticate = await _localAuth.authenticate(
  //       localizedReason: reason,
  //       options: const AuthenticationOptions(
  //         biometricOnly: true,
  //         stickyAuth: false,
  //         useErrorDialogs: true,
  //       ),
  //     );
  //     log("✅ Authentication success: $didAuthenticate");
  //     return didAuthenticate;
  //   } catch (e) {
  //     log("❌ Authentication failed: $e");
  //     return false;
  //   }
  // }

  /// ✅ Collect all device + biometric info
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

  /// ✅ Save biometric enabled state locally

  /// ✅ Save first-time setup flag
  static Future<void> saveFirstTimeCheck(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("first_time", value);
  }

  /// ✅ Load first-time setup flag
  static Future<bool> getFirstTimeCheck() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("first_time") ?? true; // default true on first launch
  }

  static Future<void> saveUserEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("user_email", email);
  }
}
