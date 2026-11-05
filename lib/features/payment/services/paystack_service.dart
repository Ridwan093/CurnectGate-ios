import 'package:curnectgate/core/config/estate_currency.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/member_management/profile_form/provider/form_provider.dart';
import 'package:curnectgate/features/payment/widget/payment_data/payment_not_available.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack_plus/flutter_paystack_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Card wallet top-up through Paystack.
///
/// The server starts every payment: it works out the fee and total in the
/// estate's currency, creates the reference and initializes the payment with
/// the gateway's secret key. The app only receives the checkout link, opens
/// it, then asks the server to confirm and credit the wallet. No Paystack key
/// is ever stored on, or sent to, the phone.
class PaystackService {
  static final PaystackService _instance = PaystackService._internal();
  factory PaystackService() => _instance;
  PaystackService._internal();

  bool _starting = false;

  /// Starts a top-up of [amount] (what the resident wants added to the
  /// wallet, before the estate's fee) in the estate's currency.
  ///
  /// [privateKey], [publiceKey], [reference] and [currency] are no longer
  /// used: the server provides everything. They are kept so older callers
  /// still compile.
  Future<void> checkout({
    required BuildContext context,
    required String email,
    required double amount,
    required String method,
    required WidgetRef ref,
    String? reference,
    String? privateKey,
    String? publiceKey,
    String? accessToken,
    String? currency,
  }) async {
    if (_starting) return;
    _starting = true;

    final form = ref.read(formProvider.notifier);

    try {
      final response = await ref
          .read(profileRepositoryProvider)
          .startWalletFundingCheckout(amount: amount);

      if (!context.mounted) return;

      final data = response['data'];
      if (response['status'] != true || data is! Map) {
        final message = (response['message'] ?? '').toString();
        if (message.toLowerCase().contains('not available') ||
            message.toLowerCase().contains('not set up')) {
          showDialog(
            context: context,
            barrierDismissible: true,
            builder: (_) => const PaymentNotAvailableDialog(),
          );
        } else {
          _toast(context, message.isNotEmpty ? message : 'Unable to start the payment.');
        }
        return;
      }

      final authorizationUrl = (data['authorization_url'] ?? '').toString();
      final serverReference = (data['reference'] ?? '').toString();
      final total = double.tryParse('${data['total_amount']}') ?? amount;
      final chargeCurrency = (data['currency'] ?? EstateCurrency.code).toString();
      final callbackUrl = (data['callback_url'] ?? '').toString();

      if (authorizationUrl.isEmpty || serverReference.isEmpty) {
        showDialog(
          context: context,
          barrierDismissible: true,
          builder: (_) => const PaymentMisconfiguredDialog(),
        );
        return;
      }

      await FlutterPaystackPlus.openPaystackPopup(
        authorizationUrl: authorizationUrl,
        customerEmail: email,
        currency: chargeCurrency,
        amount: (total * 100).round().toString(),
        reference: serverReference,
        callBackUrl: callbackUrl,
        context: context,
        onClosed: () {
          debugPrint('Payment closed before completion');
        },
        // Fires when the checkout screen closes; the server decides whether
        // the payment went through and credits the wallet if so.
        onSuccess: () async {
          await form.initialisWalletFunding(
            context: context,
            paymentMethod: method,
            refrence: serverReference,
            totalAmout: total,
            ref: ref,
          );
        },
      );
    } on DioException catch (e) {
      debugPrint('Paystack checkout error: $e');
      if (context.mounted) {
        _toast(context, 'Network unavailable. Please check your internet connection.');
      }
    } catch (e) {
      debugPrint('Paystack error: $e');
      if (context.mounted) _toast(context, 'Unable to start the payment.');
    } finally {
      _starting = false;
    }
  }

  void _toast(BuildContext context, String message) {
    showCustomSuccessToast(
      context: context,
      message: message,
      color: AppColors.instance.error600,
      icon: Icons.error_outline,
      iconColors: Colors.white,
      positionNumber: 60,
    );
  }
}
