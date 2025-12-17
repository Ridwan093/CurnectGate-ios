import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';

import 'package:curnectgate/features/payment/state_model/state_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectedReview extends ConsumerWidget {
  final List<DuePaymentModel> selectedPayments;

  const SelectedReview({super.key, required this.selectedPayments});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final totalAmount = selectedPayments
        .fold<double>(0, (sum, payment) => sum + _parseAmount(payment.amount))
        .toStringAsFixed(2);

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: _buildBottonsheet(context),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: AppColors.instance.black600),
        ),
      ),
      body: _buildbody(size, totalAmount),
    );
  }

  double _parseAmount(String amount) {
    final numericString = amount.replaceAll(RegExp(r'[^0-9.]'), '');
    return double.tryParse(numericString) ?? 0;
  }

  Widget _buildBottonsheet(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {


                
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => PaymentSuccessScreen(isFaile: false),
                //   ),
                // );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.instance.black600,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: Text(
                    "Pay",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Next step:",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "Confirmation",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black300,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildbody(Size size, String totalAmount) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: size.width,
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 4,
                  color: AppColors.instance.grey300,
                ),
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Review and confirm",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                    color: AppColors.instance.black600,
                  ),
                ),
                SizedBox(height: 30),
                ...selectedPayments.map(
                  (payment) => Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: _buildPaymentItem(payment),
                  ),
                ),
                SizedBox(height: 25),
                _buildTotalDue(totalAmount),
              ],
            ),
          ),
          _buildPaymentMethodReview(size),
          SizedBox(height: 20),
          _buildPaymentPolicy(),
        ],
      ),
    );
  }

  Widget _buildPaymentItem(DuePaymentModel payment) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.instance.grey300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.instance.teal300,
          child: Center(child: Image.asset(payment.iconPath, width: 15)),
        ),
        title: Text(
          payment.title,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black300,
            fontSize: 13,
          ),
        ),
        trailing: Text(
          payment.amount,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildTotalDue(String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total Due Payment",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 12,
            color: AppColors.instance.black600,
            fontWeight: FontFamilies.bold,
          ),
        ),
        Text(
          "₦$amount",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 20,
            color: AppColors.instance.teal300,
            fontWeight: FontFamilies.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentMethodReview(Size size) {
    return Container(
      width: size.width,
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 4,
            color: AppColors.instance.grey300,
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment method",
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
            ),
          ),
          SizedBox(height: 10),
          _buildwalletSelect(),
        ],
      ),
    );
  }

  Widget _buildwalletSelect() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.instance.grey300,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        title: Text(
          "Your Wallet (Benjamin Ageh)",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black300,
            fontSize: 12,
          ),
        ),
        subtitle: Text(
          "₦97,987",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_ios, size: 14),
      ),
    );
  }

  Widget _buildPaymentPolicy() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black600,
            fontSize: 10,
          ),
          children: [
            TextSpan(text: 'By clicking the "Pay" you agree to our '),
            TextSpan(
              style: TextStyle(color: AppColors.instance.teal300),
              text: 'payment policy,',
            ),
            TextSpan(text: '\nyou will be charged the stipulated amount due'),
          ],
        ),
      ),
    );
  }
}
