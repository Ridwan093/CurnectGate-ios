import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 20,
                  color: AppColors.instance.black600,
                ),
              ),
              SizedBox(height: 20),
              _buildbalanceCard(size),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: Icon(Icons.arrow_back_ios, color: AppColors.instance.black600),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(Icons.settings),
        ),
      ],
    );
  }

  Widget _buildbalanceCard(Size size) {
    return Container(
      height: 150,
      width: size.width,

      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: AppColors.instance.grey200.withOpacity(.9),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            spreadRadius: .9,
            color: AppColors.instance.grey300,
          ),
        ],
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Your balance",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black400,
              ),
            ),

            Text(
              "#0.00",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                color: AppColors.instance.black600,
                fontWeight: FontFamilies.bold,
                fontSize: 27,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  height: 3,
                  width: size.width / 2 - 100,
                  color: AppColors.instance.teal300,
                ),
                Expanded(
                  child: Container(
                    height: 3,
                    width: size.width / 2,
                    color: AppColors.instance.teal200,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
            SizedBox(height: 12),
            Row(
              children: [
                _buildWalletbutton("Fund wallet"),
                SizedBox(width: 10),
                _buildWalletbutton("Setup Autopay"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWalletbutton(String data) {
    return Container(
      padding: EdgeInsets.all(5),
      height: 35,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          style: BorderStyle.solid,
          color: AppColors.instance.black600,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          data,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color: AppColors.instance.black600,
          ),
        ),
      ),
    );
  }
}
