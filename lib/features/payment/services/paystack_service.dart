import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_paystack_plus/flutter_paystack_plus.dart';
import 'package:http/http.dart' as http;

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
    String? accessToken, // optional backend auth
  }) async {
    try {
      await FlutterPaystackPlus.openPaystackPopup(
        publicKey:
            'pk_test_073b8a8f310e7025d363bc95f3249f94ff289309', // ✅ replace with your test public key
        secretKey:
            "sk_test_97606777b939cd5e029c2ba3bc6c3209187209b9", // ✅ replace with your test secret key
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
          debugPrint('✅ Payment successful: $reference');
          await verifyPaymentOnServer(reference, accessToken);
        },
      );
    } catch (e) {
      debugPrint('💥 Paystack error: $e');
    }
  }

  /// Verify payment with your backend (important!)
  Future<void> verifyPaymentOnServer(
    String reference,
    String? accessToken,
  ) async {
    // 🔧 Replace this with your real backend endpoint when ready
    const String verifyUrl = 'https://yourapi.com/api/payment/verify';

    try {
      final url = Uri.parse(verifyUrl);
      final res = await http.post(
        url,
        headers: {
          'Authorization': 'Bearer ${accessToken ?? 'test_token'}',
          'Content-Type': 'application/json',
        },
        body: jsonEncode({'reference': reference}),
      );

      if (res.statusCode == 200) {
        debugPrint('✅ Server verified payment: ${res.body}');
      } else {
        debugPrint('⚠️ Server verification failed: ${res.body}');
      }
    } catch (e) {
      debugPrint('💥 Error verifying payment on server: $e');
    }
  }
}
