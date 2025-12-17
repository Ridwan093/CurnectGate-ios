import 'dart:developer';

import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
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

    try {
      await FlutterPaystackPlus.openPaystackPopup(
        publicKey: publiceKey, // ✅ replace with your test public key
        secretKey: privateKey, // ✅ replace with your test secret key
        customerEmail: email,

        currency: "",
        amount: (amount * 100).toString(), // amount in kobo
        reference: reference,
        plan: '', // optional — leave empty unless using Paystack Plans
        callBackUrl: "https://standard.paystack.co/close", // test callback
        context: context,
        onClosed: () {
          debugPrint('❌ Payment closed before completion');
        },
        onSuccess: () async {
          log('✅ Payment successful: $reference');

          // context.pop();
          await form.initialisWalletFunding(
            context: context,
            paymentMethod: method,
            refrence: reference,
            totalAmout: amount,
            ref: ref,
          );

          log('✅ Payment successful: End of the Api');
        },
      );
    } catch (e) {
      debugPrint('💥 Paystack error: $e');
    }
  }

  /// Verify payment with your backend (important!)
}
