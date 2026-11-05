import 'dart:developer';

import 'package:curnectgate/core/config/app_env.dart';
import 'package:curnectgate/core/config/estate_time.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// The resident's estate currency (symbol, code and minimum wallet top-up).
///
/// Dues, wallet balances and payments are recorded in the estate's own
/// currency (for example GH₵ for a Ghana estate), so every amount in the app
/// is shown with this symbol. It is loaded from the API with the payment
/// dashboard and kept on the device, so it is also right when offline.
class EstateCurrency {
  EstateCurrency._();

  static const _kSymbol = 'estate_currency_symbol';
  static const _kCode = 'estate_currency_code';
  static const _kMinimum = 'estate_currency_wallet_minimum';

  /// Naira until the estate's currency has been loaded.
  static String symbol = '₦';
  static String code = 'NGN';

  /// Smallest wallet top-up in the estate's currency.
  static double walletMinimum = 1000;

  static bool _restored = false;

  /// Restores the last known currency from the device (no network).
  static Future<void> restore() async {
    await EstateTime.restore();
    if (_restored) return;
    _restored = true;
    try {
      final prefs = await SharedPreferences.getInstance();
      symbol = prefs.getString(_kSymbol) ?? symbol;
      code = prefs.getString(_kCode) ?? code;
      walletMinimum = prefs.getDouble(_kMinimum) ?? walletMinimum;
    } catch (_) {
      // Keep the defaults.
    }
  }

  /// Loads the estate's currency from the API and keeps it on the device.
  static Future<void> load(String? bearerToken) async {
    await restore();
    if (bearerToken == null || bearerToken.isEmpty) return;

    try {
      final dio = Dio(
        BaseOptions(
          baseUrl: AppEnv.apiBaseUrl,
          connectTimeout: AppEnv.apiTimeout,
          receiveTimeout: AppEnv.apiTimeout,
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearerToken',
          },
          validateStatus: (status) => status != null && status < 500,
        ),
      );

      final response = await dio.get('estates/subscriptions/billing-currency');
      final data = (response.data is Map) ? response.data['data'] : null;
      if (data is! Map) return;

      // The estate's timezone comes with its currency.
      await EstateTime.apply(data['timezone']?.toString());

      final estate = data['estate_currency'];
      if (estate is Map) {
        symbol = (estate['symbol'] ?? symbol).toString();
        code = (estate['code'] ?? code).toString();
      }
      final minimum = double.tryParse('${data['wallet_minimum_top_up'] ?? ''}');
      if (minimum != null && minimum > 0) walletMinimum = minimum;

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_kSymbol, symbol);
      await prefs.setString(_kCode, code);
      await prefs.setDouble(_kMinimum, walletMinimum);
    } catch (e) {
      log('EstateCurrency: could not load estate currency: $e');
    }
  }

  /// Forgets the estate currency on sign out, so the next account on this
  /// device never sees the previous estate's symbol or minimum.
  static Future<void> clear() async {
    await EstateTime.clear();
    symbol = '₦';
    code = 'NGN';
    walletMinimum = 1000;
    _restored = false;
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_kSymbol);
      await prefs.remove(_kCode);
      await prefs.remove(_kMinimum);
    } catch (_) {
      // Nothing stored.
    }
  }

  /// `GH₵1,250.00` style amount in the estate's currency.
  static String format(num? amount, {int decimals = 2}) {
    final pattern = decimals > 0 ? '#,##0.${'0' * decimals}' : '#,##0';
    return '$symbol${NumberFormat(pattern).format(amount ?? 0)}';
  }

  /// Minimum top-up, formatted (e.g. `GH₵8`).
  static String get walletMinimumLabel =>
      format(walletMinimum, decimals: walletMinimum % 1 == 0 ? 0 : 2);
}
