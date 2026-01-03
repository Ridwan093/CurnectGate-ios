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
    String? last,
  }) {
    final bool hasBalanceInfo = second != null && data != null;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        // No fixed height → adapts to content
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.instance.grey300,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main content — takes available space
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Subtitle with highlighted part
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontWeight.w600,
                        color: AppColors.instance.black300,
                        fontSize: 13,
                      ),
                      children: [
                        TextSpan(text: subtitle),
                        if (second != null)
                          TextSpan(
                            text: second,
                            style: TextStyle(
                              color: AppColors.instance.black600,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        if (last != null) TextSpan(text: last),
                      ],
                    ),
                  ),

                  // Balance info — conditional
                  if (hasBalanceInfo) ...[
                    const SizedBox(height: 10),
                    Text(
                      data.hasSufficientBalance!
                          ? "Wallet balance: ₦${formatPrice(data.walletBalance ?? "")}"
                          : "Low wallet balance: ₦${formatPrice(data.walletBalance ?? "")}",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color:
                            data.hasSufficientBalance!
                                ? AppColors.instance.teal500
                                : AppColors.instance.error500,
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // Optional arrow indicator
            if (onTap != null)
              Padding(
                padding: EdgeInsets.only(left: 8),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: AppColors.instance.black400,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
