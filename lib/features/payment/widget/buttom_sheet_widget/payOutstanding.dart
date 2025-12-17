import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/dashbord_Model/payment_dashboard_data.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class PayOutstanding extends StatelessWidget {
  final String headertitle;
  final PaymentDashboardData? data;
  const PayOutstanding({
    super.key,
    required this.headertitle,
    required this.data,
  });
  String formatPrice(String price) {
    final number = double.tryParse(price) ?? 0.0;
    final formatter = NumberFormat('#,##0.00');
    return formatter.format(number);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        key: const ValueKey('userDetails'),
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header section
          Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                headertitle,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontWeight: FontFamilies.bold,
                  fontSize: 18,
                  color: AppColors.instance.black600,
                ),
              ),
              const SizedBox(height: 4),
            ],
          ),
          const SizedBox(height: 50),

          _buildPrimaryOptionTile(
            title: "Pay full amount",
            subtitle: "Pay the total ",
            second: "(₦${formatPrice("${data?.totalOutstanding ?? 0}")})",
            last: "  now",
            data: data,
            onTap: () {
              context.pop();
              context.pushNamed(
                AppRoutes.payallduePayment,
                extra: {
                  "totalDue": data?.totalOutstanding.toString(),
                  "walletBalance": data?.walletBalance ?? "",
                },
              );
              // Navigator.pop(context);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => DuePayment()),
              // );
            },
          ),
          const SizedBox(height: 5),
          _buildPrimaryOptionTile(
            onTap: () {
              context.pop();
              context.pushNamed(
                AppRoutes.selectedDueTopay,
                extra: {
                  "totalDue": data?.totalOutstanding.toString(),
                  "walletBalance": data?.walletBalance ?? "",
                },
              );
            },
            title: "Pay custom amount",
            subtitle: "Pay part now, part later",
          ),
        ],
      ),
    );
  }

  Widget _buildPrimaryOptionTile({
    required String title,
    required String subtitle,
    VoidCallback? onTap,
    PaymentDashboardData? data,
    String? second,
    last,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100,
        color: AppColors.instance.grey300,
        child: ListTile(
          contentPadding: const EdgeInsets.all(16),

          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontFamilies.bold,
                    color: AppColors.instance.black300,
                    fontSize: 13,
                  ),
                  children: [
                    TextSpan(text: subtitle),
                    TextSpan(
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.bold,
                        fontSize: 13,
                        color: AppColors.instance.black600,
                      ),
                      text: second,
                    ),
                    TextSpan(text: last),
                  ],
                ),
              ),
              if (second != null) ...[
                SizedBox(height: 5),
                if (data!.hasSufficientBalance!) ...[
                  Text(
                    "Wallet balance: ₦${formatPrice(data.walletBalance ?? "")}",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 11,
                      color: AppColors.instance.teal500,
                    ),
                  ),
                ] else ...[
                  Text(
                    "Low wallet balance: ₦${formatPrice(data.walletBalance ?? "")}",
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      fontSize: 11,
                      color: AppColors.instance.error500,
                    ),
                  ),
                ],
              ],
            ],
          ),
          title: Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontFamilies.bold,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
