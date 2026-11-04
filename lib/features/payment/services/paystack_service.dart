import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/widget/customtoast.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/payment/widget/payment_data/payment_not_available.dart';
import 'package:flutter/material.dart';
import 'package:flutter_paystack_plus/flutter_paystack_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:http/http.dart' as http;

class PaystackService {
  static final PaystackService _instance = PaystackService._internal();
  factory PaystackService() => _instance;
  PaystackService._internal();

  /// Start a Paystack payment using the new flutter_paystack_plus API
  Future<void> checkout({
    required BuildContext context,
    required String email,
    required double amount, // amount in Naira
    required String reference,
    required String privateKey,
    required String publiceKey,
    required String method,
    required WidgetRef ref,
    String? accessToken, // optional backend auth
    String currency = "NGN",
  }) async {
    final form = ref.read(formProvider.notifier);

    // 1. SANITIZE: Strip surrounding quotes, whitespace, and copy-paste artifacts
    String _sanitizeKey(String key) {
      return key
          .trim()
          .replaceAll(String.fromCharCode(34), '') // remove double quotes
          .replaceAll(String.fromCharCode(39), '') // remove single quotes
          .replaceAll(RegExp(r'\s+'), ''); // remove whitespace
    }

    // 2. Quick validation – only checks that the key has a valid Paystack shape
    bool _isKeyValid(String key) {
      if (key.isEmpty || key.length < 20) return false;
      if (key.contains('sample') || key.contains('placeholder')) return false;
      if (key.contains('****') || key.contains('***')) return false;
      final validPrefixes = ['pk_test_', 'pk_live_', 'sk_test_', 'sk_live_'];
      return validPrefixes.any((prefix) => key.startsWith(prefix));
    }

    final cleanPublicKey = _sanitizeKey(publiceKey);
    final cleanPrivateKey = _sanitizeKey(privateKey);

    if (!_isKeyValid(cleanPublicKey) || !_isKeyValid(cleanPrivateKey)) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => const PaymentMisconfiguredDialog(),
      );
      return;
    }

    try {
      await FlutterPaystackPlus.openPaystackPopup(
        publicKey: cleanPublicKey,
        secretKey: cleanPrivateKey,
        customerEmail: email,
        currency: currency,
        amount: (amount * 100).toInt().toString(),
        reference: reference,
        plan: '',
        callBackUrl: "https://standard.paystack.co/close",
        context: context,
        onClosed: () {
          debugPrint('Payment closed before completion');
        },
        onSuccess: () async {
          await form.initialisWalletFunding(
            context: context,
            paymentMethod: method,
            refrence: reference,
            totalAmout: amount,
            ref: ref,
          );
        },
      );
    } catch (e) {
      debugPrint('Paystack error: $e');

      // 2. CUSTOM ERROR HANDLING: Handle specific key errors differently
      String userMessage = "Unable to initialize payment.";

      if (e.toString().contains("Invalid Key") ||
          e.toString().contains("401")) {
        // If the key was "correct format" but "wrong account"
        showDialog(
          context: context,
          builder: (_) => const PaymentMisconfiguredDialog(),
        );
        return;
      }

      showCustomSuccessToast(
        context: context,
        message: userMessage,
        color: AppColors.instance.error600,
        icon: Icons.error_outline,
        iconColors: Colors.white,
        positionNumber: 60,
      );
    }
  }

  /// Verify payment with your backend (important!)
}
