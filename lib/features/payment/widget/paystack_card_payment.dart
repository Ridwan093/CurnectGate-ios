import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class PaystackCardPayment extends StatefulWidget {
  const PaystackCardPayment({super.key});

  @override
  State<PaystackCardPayment> createState() => _PaystackCardPaymentState();
}

class _PaystackCardPaymentState extends State<PaystackCardPayment> {
  bool _loading = false;

  // Backend base URL

  final String backendBaseUrl = 'http://192.168.43.148:3000';

  Future<void> _startPayment() async {
    setState(() => _loading = true);

    try {
      // 1️⃣ Initialize payment
      final initUri = Uri.parse('$backendBaseUrl/api/paystack/initialize');

      final res = await http.post(
        initUri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': 'test@example.com', // replace with real user email
          'amount': 5000, // in Naira
        }),
      );

      if (res.statusCode != 200) {
        throw Exception('Init failed: ${res.body}');
      }

      final body = jsonDecode(res.body);
      final authUrl = body['data']?['authorization_url'] as String?;
      final reference = body['data']?['reference'] as String?;

      if (authUrl == null || reference == null) {
        throw Exception('Missing authorization URL or reference');
      }

      // 2️⃣ Open Paystack in-app WebView
      final uriAuth = Uri.parse(authUrl);

      if (!await launchUrl(
        uriAuth,
        mode: LaunchMode.inAppWebView,
        webViewConfiguration: const WebViewConfiguration(
          enableJavaScript: true,
        ),
      )) {
        throw Exception('Could not launch $authUrl');
      }

      // 3️⃣ Poll backend to verify payment
      await _pollForPaymentCompletion(reference);
    } catch (e) {
      debugPrint('Payment start failed: $e');
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Payment failed: $e')));
      }
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _pollForPaymentCompletion(String reference) async {
    try {
      bool completed = false;

      while (!completed) {
        await Future.delayed(const Duration(seconds: 3));

        final verifyUri = Uri.parse(
          '$backendBaseUrl/api/paystack/verify/$reference',
        );
        final res = await http.get(verifyUri);

        if (res.statusCode == 200) {
          final body = jsonDecode(res.body);
          final status = body['data']?['status'];

          if (status == 'success') {
            completed = true;
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('✅ Payment successful!')),
              );
            }
            debugPrint('Payment verified: $body');
          } else if (status == 'failed') {
            completed = true;
            if (mounted) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('❌ Payment failed')));
            }
            debugPrint('Payment failed: $body');
          }
        }
      }
    } catch (e) {
      debugPrint('Verification polling error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: _loading ? null : _startPayment,
        child: Text(_loading ? 'Processing...' : 'Pay ₦5,000'),
      ),
    );
  }
}
