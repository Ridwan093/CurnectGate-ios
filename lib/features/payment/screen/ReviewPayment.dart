import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/screen/success_error_scren/success_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReviewPayment extends ConsumerWidget {
  const ReviewPayment({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: _buildBottonsheet(ref, context),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.instance.black600),
        ),
      ),
      body: _buildbody(size, ref),
    );
  }

  Widget _buildBottonsheet(WidgetRef ref, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Navigate to next screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentSuccessScreen(isFaile: true,),
                  ),
                );
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
                "2:Confirmation",
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

  Widget _buildbody(Size size, WidgetRef ref) {
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
            child: SingleChildScrollView(
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
                  _buildPaymentClick(
                    amount: "₦32,587",
                    title: "Water bill",

                    iconPath: AssetPaths.waterDrop,
                  ),
                  SizedBox(height: 2),
                  _buildPaymentClick(
                    amount: "₦10,000",
                    title: "Service Fee",

                    iconPath: AssetPaths.serviceFee,
                  ),
                  SizedBox(height: 2),
                  _buildPaymentClick(
                    amount: "₦10,000",
                    title: "Maintenance Fee",

                    iconPath: AssetPaths.maintenance,
                  ),
                  SizedBox(height: 2),
                  _buildPaymentClick(
                    amount: "₦32,587",
                    title: "Light Fee",

                    iconPath: AssetPaths.navCreditCardFilled,
                  ),
                  SizedBox(height: 25),
                  _buildTotalDue(),
                ],
              ),
            ),
          ),
          _buildPaymentMethodReview(size),
          SizedBox(height: 20),
          _buildPaymentPolicy(),
        ],
      ),
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
            "Payment method ",
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
      child: Center(
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
      ),
    );
  }

  Widget _buildPaymentPolicy() {
    return Align(
      alignment: Alignment.bottomCenter,
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
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.teal300,
                fontSize: 10,
              ),
              text: 'payment policy,',
            ),
            TextSpan(text: '\nyou will be charged the stipulated amount due'),
          ],
        ),
      ),
    );
  }

  Widget _buildTotalDue() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total Due Payment",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 12,
            wordSpacing: 2,
            color: AppColors.instance.black600,
            fontWeight: FontFamilies.bold,
          ),
        ),
        Text(
          "₦85,174",
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 20,
            wordSpacing: 2,
            color: AppColors.instance.teal300,
            fontWeight: FontFamilies.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentClick({
    required String iconPath,
    required String title,
    required String amount,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.instance.grey300,

        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: ListTile(
          title: Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black300,
              fontSize: 13,
            ),
          ),
          trailing: Text(
            amount,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
