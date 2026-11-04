import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/screen/success_error_scren/duepayment_receipt_screen.dart';
import 'package:flutter/material.dart';

class PaymentProcessingDialog extends StatefulWidget {
  const PaymentProcessingDialog({super.key});

  @override
  State<PaymentProcessingDialog> createState() =>
      _PaymentProcessingDialogState();
}

class _PaymentProcessingDialogState extends State<PaymentProcessingDialog> {
  String _status = 'Connecting to gateway...';

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) setState(() => _status = 'Verifying funds...');
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted) setState(() => _status = 'Finalizing payment...');
        Future.delayed(const Duration(seconds: 1), () {
          if (mounted) Navigator.pop(context);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const PaymentReceiptScreen(),
            ),
          );
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Processing Payment',
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.instance.black600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              _status,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black400,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
