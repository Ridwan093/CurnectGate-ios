import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BiometricSignatureHelper {
  static const _storage = FlutterSecureStorage();

  // 🔑 Secure keys for encrypted storage
  static const _signatureKey = "biometric_signature";
  static const _biometricIdKey = "unique_biometric_id";
  static const _emailKey = "biometric_email";

  // 🔐 Your fixed app-level secret (must stay constant for all app versions)
  static const _secretAppKey = "my_super_secret_app_key_v1";

  // 🧩 SharedPreferences key where YOU save the user’s email
  static const _sharedPrefsEmailKey = "user_email";

  /// ✅ Creates or returns an existing secure signature for the current user
  static Future<String?> getOrCreateSignature({
    required String uniqueBiometricId,
  }) async {
    final email = await _getUserEmailFromPrefs();
    if (email == null || email.isEmpty) {
      throw Exception("No user email found in SharedPreferences");
    }

    final existingSignature = await _storage.read(key: _signatureKey);
    final savedEmail = await _storage.read(key: _emailKey);
    final savedId = await _storage.read(key: _biometricIdKey);

    // 🧩 If we already generated a signature for this user + device, reuse it
    if (existingSignature != null &&
        savedEmail == email &&
        savedId == uniqueBiometricId) {
      return existingSignature;
    }

    // Otherwise generate a fresh one
    return await _refreshForUser(email: email, uniqueBiometricId: uniqueBiometricId);
  }

  /// 🔄 Generate and securely store a new HMAC-SHA256 signature
  static Future<String> _refreshForUser({
    required String email,
    required String uniqueBiometricId,
  }) async {
    final rawData = "$email|$uniqueBiometricId|$_secretAppKey";
    final bytes = utf8.encode(rawData);
    final key = utf8.encode(_secretAppKey);

    final hmac = Hmac(sha256, key);
    final digest = hmac.convert(bytes);

    final signature = base64UrlEncode(digest.bytes);

    await _storage.write(key: _signatureKey, value: signature);
    await _storage.write(key: _biometricIdKey, value: uniqueBiometricId);
    await _storage.write(key: _emailKey, value: email);

    return signature;
  }

  /// 📧 Reads the user email that you saved in SharedPreferences
  static Future<String?> _getUserEmailFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_sharedPrefsEmailKey);
  }

  /// 🧩 Retrieve stored signature (for login validation)
  static Future<String?> getStoredSignature() async =>
      await _storage.read(key: _signatureKey);

  /// 📧 Retrieve stored email (secure copy)
  static Future<String?> getStoredEmail() async =>
      await _storage.read(key: _emailKey);

  /// 🆔 Retrieve stored biometric ID
  static Future<String?> getStoredBiometricId() async =>
      await _storage.read(key: _biometricIdKey);

  /// 🚫 Clear biometric data (only if user **manually disables** biometrics)
  static Future<void> clearIfUserDisables() async {
    await _storage.delete(key: _signatureKey);
    await _storage.delete(key: _biometricIdKey);
    await _storage.delete(key: _emailKey);
  }

  /// 🧠 Debug: view stored biometric data
  static Future<Map<String, String?>> debugData() async => {
        "signature": await _storage.read(key: _signatureKey),
        "email": await _storage.read(key: _emailKey),
        "biometric_id": await _storage.read(key: _biometricIdKey),
      };
}
