import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/due_model/outstanding_dues_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class DuePayment extends ConsumerWidget {
  final OutstandingDuesData? data;

  final String walletBalance;
  final String totalDue;
  const DuePayment({
    super.key,
    required this.data,
    required this.walletBalance,
    required this.totalDue,
  });

  String formatPrice(String price) {
    final number = double.tryParse(price) ?? 0.0;
    final formatter = NumberFormat('#,##0.00');
    return formatter.format(number);
  }

  String formatDueDate(String isoDate) {
    DateTime date = DateTime.parse(isoDate);
    return DateFormat('dd MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: _buildBottonsheet(ref, context, data),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.instance.black600),
        ),
      ),
      body: _buildbody(size, ref, data, walletBalance, totalDue),
    );
  }

  Widget _buildBottonsheet(
    WidgetRef ref,
    BuildContext context,
    OutstandingDuesData? data,
  ) {
    final listoutStanding = data?.dues ?? [];
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                // Navigate to next screen
                context.pop();
                context.pushNamed(
                  AppRoutes.paymentReview,
                  extra: {"list": listoutStanding, "wallet": walletBalance},
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
                    "Next",
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
          SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                "2:Review",
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

  Widget _buildbody(
    Size size,
    WidgetRef ref,
    OutstandingDuesData? data,
    String wallet,
    String due,
  ) {
    final listoutStanding = data?.dues ?? [];
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
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Due Payment",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black600,
              ),
            ),
            SizedBox(height: 13),
            _buildNotifyerBox(wallet, due),
            SizedBox(height: 20),

            ...listoutStanding.map(
              (e) => _buildPaymentClick(
                amount: '₦${formatPrice(e.amount ?? "")}',
                title: e.feeCategory?.icon ?? "",
                subtitle: formatDueDate(e.dueDate ?? ""),
                iconPath: _iconLogo(e.feeCategory?.icon ?? ""),

                onTap: () {},
              ),
            ),

            // SizedBox(height: 10),
            // _buildPaymentClick(
            //   amount: "₦10,000",
            //   title: "Service Fee",
            //   subtitle: "April 2, 2024",
            //   iconPath: AssetPaths.serviceFee,

            //   onTap: () {},
            // ),
            // SizedBox(height: 10),
            // _buildPaymentClick(
            //   amount: "₦10,000",
            //   title: "Maintenance Fee",
            //   subtitle: "April 2, 2024",
            //   iconPath: AssetPaths.maintenance,

            //   onTap: () {},
            // ),
            // SizedBox(height: 10),
            // _buildPaymentClick(
            //   amount: "₦32,587",
            //   title: "Light Fee",
            //   subtitle: "April 2, 2024",
            //   iconPath: AssetPaths.navCreditCardFilled,

            //   onTap: () {},
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotifyerBox(String wallet, String due) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: AppColors.instance.grey300,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Wallet",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  wordSpacing: 2,
                  color: AppColors.instance.black600,
                ),
              ),
              Text(
                " ₦${formatPrice(wallet)}",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  wordSpacing: 2,
                  color: AppColors.instance.black300,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                style: BorderStyle.solid,
                color: AppColors.instance.grey300,
              ),
            ),

            child: Icon(
              Icons.arrow_forward,
              color: AppColors.instance.black600,
              size: 12,
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Your Total due",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  wordSpacing: 2,
                  color: AppColors.instance.black600,
                ),
              ),
              Text(
                " ₦${formatPrice(due)}",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 12,
                  wordSpacing: 2,
                  color: AppColors.instance.black300,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentClick({
    required String iconPath,
    required String title,
    required String amount,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 70,

        decoration: BoxDecoration(
          color: AppColors.instance.grey300,

          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: AppColors.instance.teal300,
            child: Center(child: Image.asset(iconPath, width: 15)),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              color: AppColors.instance.black600,
              fontSize: 14,
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
          subtitle: Text(
            subtitle,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.light,
              color: AppColors.instance.black400,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }

  String _iconLogo(String icon) {
    switch (icon.toLowerCase()) {
      case "water":
        return AssetPaths.waterDrop;
      case "service":
        return AssetPaths.serviceFee;

      case "maintenace":
        return AssetPaths.maintenance;
      case "light":
        return AssetPaths.navCreditCardFilled;

      default:
        return AssetPaths.maintenance;
    }
  }
}
