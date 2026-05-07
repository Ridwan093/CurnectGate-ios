import 'dart:developer';

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
  }) async {
    final form = ref.read(formProvider.notifier);

    // 1. PRO VALIDATION: Detect 'Wrong', 'Masked', or 'Default' keys
    bool _isKeyBroken(String key) {
      if (key.isEmpty) return true;
      if (key.contains("sample") || key.contains("placeholder")) return true;
      if (key.contains("****") || key.contains("***"))
        return true; // Detect masked keys
      if (key.length < 20)
        return true; // Real keys are significantly longer (~40 chars)
      if (!key.startsWith("pk_") && !key.startsWith("sk_")) return true;
      return false;
    }

    if (_isKeyBroken(publiceKey) || _isKeyBroken(privateKey)) {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (_) => const PaymentNotConfiguredDialog(),
      );
      return;
    }

    try {
      await FlutterPaystackPlus.openPaystackPopup(
        publicKey: publiceKey,
        secretKey: privateKey,
        customerEmail: email,
        currency: "",
        amount: (amount * 100).toString(),
        reference: reference,
        plan: '',
        callBackUrl: "https://standard.paystack.co/close",
        context: context,
        onClosed: () {
          debugPrint('Payment closed before completion');
        },
        onSuccess: () async {
          log(' Payment successful: $reference');

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
      debugPrint('💥 Paystack error: $e');

      // 2. CUSTOM ERROR HANDLING: Handle specific key errors differently
      String userMessage = "Unable to initialize payment.";

      if (e.toString().contains("Invalid Key") ||
          e.toString().contains("401")) {
        // If the key was "correct format" but "wrong account"
        showDialog(
          context: context,
          builder: (_) => const PaymentNotConfiguredDialog(),
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
