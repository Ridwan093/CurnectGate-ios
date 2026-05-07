import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/provider/due_state_provider.dart';
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Pre-select all bills at full amount for the review screen
                      ref
                          .read(selectedBillsProvider.notifier)
                          .selectAll(listoutStanding);

                      // Navigate to next screen
                      context.pushNamed(
                        AppRoutes.paymentReview,
                        extra: {
                          "list": listoutStanding,
                          "wallet": walletBalance,
                          "isFull": true,
                        },
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
          ],
        ),
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
              "Pay Full Amount",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black600,
              ),
            ),
            SizedBox(height: 13),
            _buildNotifyerBox(wallet, due),
            SizedBox(height: 20),

            ...listoutStanding.map((e) {
              final categoryName = e.feeCategory?.name ?? "Fee";
              return _buildPaymentClick(
                amount: '₦${formatPrice(e.amount ?? "")}',
                title: categoryName,
                subtitle: formatDueDate(e.dueDate ?? ""),
                iconData: _getIconData(categoryName),
                onTap: () {},
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildNotifyerBox(String wallet, String due) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(
          style: BorderStyle.solid,
          color: AppColors.instance.grey300,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Left: Wallet
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Your Wallet",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 13,
                    color: AppColors.instance.black600,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "₦${formatPrice(wallet)}",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 15,
                    color: AppColors.instance.black300,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Center: Arrow Icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.instance.grey200,
              ),
              child: Icon(
                Icons.arrow_forward_rounded,
                size: 18,
                color: AppColors.instance.black600,
              ),
            ),
          ),

          // Right: Total Due
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Your Total due",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 13,
                    color: AppColors.instance.black600,
                    fontWeight: FontFamilies.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "₦${formatPrice(due)}",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 15,
                    color: AppColors.instance.black300,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentClick({
    required IconData iconData,
    required String title,
    required String amount,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,

      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.instance.grey300,

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.instance.teal300,
              child: Icon(iconData, color: Colors.white, size: 24),
            ),

            const SizedBox(width: 16),

            // Title + Subtitle — takes available space
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontWeight.bold,
                      color: AppColors.instance.black600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontWeight.w500,
                      color: AppColors.instance.black400,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 16),

            // Amount — aligned right
            Text(
              amount,
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontWeight.bold,
                color: AppColors.instance.black600,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconData(String? categoryName) {
    if (categoryName == null) return Icons.receipt_long;
    final name = categoryName.toLowerCase();

    if (name.contains("water")) return Icons.water_drop;
    if (name.contains("security") || name.contains("cctv"))
      return Icons.security;
    if (name.contains("light")) return Icons.lightbulb;
    if (name.contains("gate") || name.contains("card")) return Icons.badge;
    if (name.contains("event")) return Icons.event;
    if (name.contains("packing") || name.contains("parking"))
      return Icons.local_parking;
    if (name.contains("waste") || name.contains("trash"))
      return Icons.delete_outline;
    if (name.contains("recreation") ||
        name.contains("playground") ||
        name.contains("landscaping") ||
        name.contains("garden"))
      return Icons.park;
    if (name.contains("maintenance") ||
        name.contains("mentanace") ||
        name.contains("mentainace"))
      return Icons.build;
    if (name.contains("service") ||
        name.contains("charge") ||
        name.contains("assesment") ||
        name.contains("levy"))
      return Icons.account_balance_wallet;

    return Icons.receipt_long;
  }
}
