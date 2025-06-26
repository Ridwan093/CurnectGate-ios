import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/tabState/permission_tab_state.dart';
import 'package:curnectgate/features/member_management/widget/app_bottom_sheet.dart';
import 'package:curnectgate/features/payment/screen/Activites.dart';
import 'package:curnectgate/features/payment/screen/payment_method_screen.dart';
import 'package:curnectgate/features/payment/widget/custom_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PaymentScreen extends ConsumerWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: SizedBox(
        width: size.width,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(14, 14, 14, 0),
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
              _buildbalanceCard(size, context),
              SizedBox(height: 20),
              _buildDueCard("700,000", false, size, ref, context),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Activities",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 20,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Activites()),
                      );
                    },
                    child: Text(
                      "See all",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.bold,
                        fontSize: 10,
                        color: AppColors.instance.teal300,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: BoxConstraints(
                  // Fallback for small devices
                  maxHeight: MediaQuery.of(context).size.height * 0.3,
                ),
                child: CustomTabView(), // Must handle internal scrolling
              ),
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

  Widget _buildbalanceCard(Size size, BuildContext context) {
    return Container(
      height: 150,
      width: size.width,

      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.white,
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
                _buildWalletbutton(
                  data: "Fund wallet",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentMethodScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(width: 10),
                _buildWalletbutton(data: "Setup Autopay", onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDueCard(
    String amount,
    bool isDue,
    Size size,
    WidgetRef ref,
    BuildContext context,
  ) {
    return Container(
      padding: EdgeInsets.all(12),
      height: isDue ? 50 : 60,
      width: size.width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.instance.grey300,
            spreadRadius: .9,
            blurRadius: 1,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child:
          isDue
              ? Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "No upcoming dues",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black400,
                    fontWeight: FontFamilies.medium,
                    fontSize: 13,
                  ),
                ),
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total dua amount is #$amount",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black400,
                      fontWeight: FontFamilies.medium,
                      fontSize: 13,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showUserBottomSheet(
                        context: context,
                        headertitle: "Pay Outstanding Due",
                        headersubtitle: "",
                        ref: ref,
                        bottom: BottomSheetView.payOustanding,
                      );
                    },
                    child: Container(
                      height: 35,
                      width: 70,
                      decoration: BoxDecoration(
                        color: AppColors.instance.black600,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "Pay due",
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            color: AppColors.instance.grey200,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
    );
  }

  Widget _buildWalletbutton({
    required String data,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
              fontWeight: FontFamilies.bold,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
