import 'package:flutter_dotenv/flutter_dotenv.dart';

/// Typed access to the values in `.env` (see `.env.example`).
///
/// Every value has a fallback equal to what the app used before `.env`
/// existed, so a missing or partial `.env` never breaks the app.
///
/// `.env` is bundled inside the app, so anyone can read it from the APK.
/// Never put server-side secrets (Paystack secret keys, DB passwords) here.
class AppEnv {
  AppEnv._();

  static Future<void> load() async {
    try {
      await dotenv.load(fileName: '.env', isOptional: true);
    } catch (_) {
      // A missing or broken .env must not stop the app; defaults below apply.
      dotenv.loadFromString(envString: '', isOptional: true);
    }
  }

  static String _str(String key, String fallback) {
    final value = dotenv.isInitialized ? dotenv.maybeGet(key)?.trim() : null;
    return (value == null || value.isEmpty) ? fallback : value;
  }

  static int _int(String key, int fallback) =>
      int.tryParse(_str(key, '$fallback')) ?? fallback;

  static String _noTrailingSlash(String url) => url.replaceAll(RegExp(r'/+$'), '');

  /// development | staging | production
  static String get appEnv => _str('APP_ENV', 'production');
  static bool get isProduction => appEnv == 'production';

  /// API root including `/api/v1`. Always ends with `/` because the
  /// endpoint constants are relative paths (e.g. `auth/login`).
  static String get apiBaseUrl =>
      '${_noTrailingSlash(_str('API_BASE_URL', 'https://api.curnectgate.com/api/v1'))}/';

  static Duration get apiTimeout =>
      Duration(seconds: _int('API_TIMEOUT_SECONDS', 30));

  /// Public website (estate admin sign-up link).
  static String get websiteUrl => _str('WEBSITE_URL', 'http://www.curnectgate.com');

  static String get privacyPolicyUrl =>
      _str('PRIVACY_POLICY_URL', 'https://curnectgate.com/privacy');

  /// Backend used by the standalone Paystack card payment widget.
  static String get paystackBackendUrl =>
      _noTrailingSlash(_str('PAYSTACK_BACKEND_URL', 'http://192.168.43.148:3000'));

  static String get paystackCallbackUrl =>
      _str('PAYSTACK_CALLBACK_URL', 'https://standard.paystack.co/close');
}
