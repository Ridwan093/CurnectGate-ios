import 'dart:convert';
import 'dart:developer';
import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 🔐 BiometricSignatureHelper
/// Handles secure generation and persistence of unique signatures per user/device.
class BiometricSignatureHelper {
  // 🔑 Storage keys
  static const _signatureKey = "biometric_signature";
  static const _biometricIdKey = "unique_biometric_id";
  static const _sharedPrefsEmailKey = "user_email";

  // ⚙️ Secret key (keep consistent across versions)
  static const _secretAppKey = "my_super_secret_app_key_v1";

  /// ✅ Get existing signature or generate a new one if needed
  static Future<String> getOrCreateSignature({
    required String uniqueBiometricId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString(_sharedPrefsEmailKey);

    if (email == null || email.isEmpty) {
      log("❌ No user email found in SharedPreferences");
      throw Exception("No user email found in SharedPreferences");
    }

    final existingSignature = prefs.getString(_signatureKey);
    final savedEmail = prefs.getString(_sharedPrefsEmailKey);
    final savedId = prefs.getString(_biometricIdKey);

    log("🔍 Email from prefs: $savedEmail");
    log("🔍 Saved Biometric ID: $savedId");
    log("🔍 Current Biometric ID: $uniqueBiometricId");
    log("🔍 Existing Signature: $existingSignature");

    // ✅ Check if all identifiers match
    if (existingSignature != null &&
        savedEmail == email &&
        savedId == uniqueBiometricId) {
      log("✅ Using existing signature for user: $email");
      return existingSignature;
    }

    // ⚙️ Generate new one when not found or mismatched
    log("⚙️ Regenerating signature for user: $email");
    return await _refreshForUser(
      email: email,
      uniqueBiometricId: uniqueBiometricId,
    );
  }

  /// 🔄 Generate and persist a new HMAC-SHA256 signature
  static Future<String> _refreshForUser({
    required String email,
    required String uniqueBiometricId,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    final rawData = "$email|$uniqueBiometricId|$_secretAppKey";
    final bytes = utf8.encode(rawData);
    final key = utf8.encode(_secretAppKey);

    final hmac = Hmac(sha256, key);
    final digest = hmac.convert(bytes);
    final signature = base64UrlEncode(digest.bytes);

    await prefs.setString(_signatureKey, signature);
    await prefs.setString(_biometricIdKey, uniqueBiometricId);
    await prefs.setString(_sharedPrefsEmailKey, email);

    log("✅ New signature generated and stored for $email");
    log("🔐 Signature: $signature");

    return signature;
  }

  /// 🧠 Retrieve current stored signature (if any)
  static Future<String?> getStoredSignature() async {
    final prefs = await SharedPreferences.getInstance();
    final signature = prefs.getString(_signatureKey);
    log("📄 Retrieved stored signature: $signature");
    return signature;
  }

  /// 📧 Retrieve stored email
  static Future<String?> getStoredEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_sharedPrefsEmailKey);
  }

  /// 🆔 Retrieve stored biometric ID
  static Future<String?> getStoredBiometricId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_biometricIdKey);
  }

  /// 🚫 Clear biometric data (for logout or disable)
  static Future<void> clearIfUserDisables() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_signatureKey);
    await prefs.remove(_biometricIdKey);
    await prefs.remove(_sharedPrefsEmailKey);
    log("🧹 Cleared all biometric signature data");
  }

  /// 🧩 Debug helper: inspect stored values
  static Future<Map<String, String?>> debugData() async {
    final prefs = await SharedPreferences.getInstance();
    final data = {
      "signature": prefs.getString(_signatureKey),
      "email": prefs.getString(_sharedPrefsEmailKey),
      "biometric_id": prefs.getString(_biometricIdKey),
    };
    log("🧠 Debug Data: $data");
    return data;
  }
}
