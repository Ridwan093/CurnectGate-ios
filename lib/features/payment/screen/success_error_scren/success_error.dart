import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/onbording_prosecc/estate_onboarding/widget/button/estate_button.dart';
import 'package:flutter/material.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final bool isFaile;
  const PaymentSuccessScreen({super.key, required this.isFaile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildsuccessContainer(isFaile),
            ActionButton(label: isFaile? "Retry payment":"Ok, Got it!", onPressed: () {}),
          ],
        ),
      ),
    );
  }

  _buildsuccessContainer(bool isFaile) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          SizedBox(height: 100),
          Center(
            child: Icon(
              isFaile ? Icons.cancel_rounded : Icons.check_circle,
              size: 80,
              color:
                  isFaile
                      ? AppColors.instance.error600
                      : AppColors.instance.teal500,
            ),
          ),
          const SizedBox(height: 25),
          Text(
            isFaile
                ? "We're sorry, we couldn't process your payment, please try later"
                : "Payment Successful",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontWeight: FontFamilies.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: isFaile ? 35 : 20),
          Text(
            isFaile
                ? "We cound'nt process your payment, please check back later"
                : "All your due has paid completed, you'll get \nan email confirmation with required details and invoice",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black300,
              fontWeight: FontFamilies.medium,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
