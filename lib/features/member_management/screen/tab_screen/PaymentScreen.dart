import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Payment Screen!",
          style: TextStyle(
            fontFamily: FontFamilies.lato,
            fontSize: 25,
            color: AppColors.instance.error600,
          ),
        ),
      ),
    );
  }
}
