import 'package:curnectgate/core/constants/asset_paths.dart';
import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/due_model/outstanding_due.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/due_model/outstanding_dues_data.dart';
import 'package:curnectgate/features/payment/state_model/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class DuePaymentSelection extends ConsumerWidget {
  final OutstandingDuesData? data;

  final String walletBalance;
  final String totalDue;
  const DuePaymentSelection({
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final duePayments = data?.dues ?? [];
    final hasSelection = ref.watch(selectedDueIdsProvider).isNotEmpty;

    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 70,
        child: _buildBottonsheet(
          ref,
          context,
          hasSelection,
          duePayments,
          walletBalance,
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: AppColors.instance.black600),
        ),
      ),
      body: _buildbody(size, ref, duePayments),
    );
  }

  Widget _buildBottonsheet(
    WidgetRef ref,
    BuildContext context,
    bool hasSelection,
    List<OutstandingDue> listData,
    String walletBalance,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap:
                        hasSelection
                            ? () {
                              final selectedIds = ref.read(
                                selectedDueIdsProvider,
                              );
                              final selectedPayments =
                                  listData
                                      .where((p) => selectedIds.contains(p.id))
                                      .toList();
                              context.pop();
                              context.pushNamed(
                                AppRoutes.paymentReview,
                                extra: {
                                  "list": selectedPayments,
                                  "wallet": walletBalance,
                                },
                              );
                            }
                            : null,
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color:
                            hasSelection
                                ? AppColors.instance.black600
                                : AppColors.instance.grey400,
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

  Widget _buildbody(Size size, WidgetRef ref, List<OutstandingDue> listData) {
    final duePayments = listData;
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
              "Select Due to Payment",
              style: TextStyle(
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black600,
              ),
            ),
            SizedBox(height: 13),
            _buildNotifyerBox(),
            ...duePayments.map(
              (payment) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: _buildPaymentItem(payment, ref),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotifyerBox() {
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
          Expanded(
            child: Column(
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
                  "₦${formatPrice(walletBalance)}",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 12,
                    wordSpacing: 2,
                    color: AppColors.instance.black300,
                  ),
                ),
              ],
            ),
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

          Expanded(
            child: Column(
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
                  "₦${formatPrice(totalDue)}",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 12,
                    wordSpacing: 2,
                    color: AppColors.instance.black300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentItem(OutstandingDue payment, WidgetRef ref) {
    final isSelected = ref
        .watch(selectedDueIdsProvider)
        .contains(payment.id ?? 0);

    return InkWell(
      onTap:
          () => ref
              .read(selectedDueIdsProvider.notifier)
              .toggleSelection(payment.id ?? 0),

      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.instance.grey300,

          border:
              isSelected
                  ? Border.all(color: AppColors.instance.black600, width: 2)
                  : Border.all(color: Colors.transparent),
          boxShadow:
              isSelected
                  ? [
                    BoxShadow(
                      color: AppColors.instance.black600.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ]
                  : null,
        ),
        child: Row(
          children: [
            // Leading Icon
            CircleAvatar(
              radius: 22,
              backgroundColor: AppColors.instance.teal300,
              child: Image.asset(
                _iconLogo(payment.feeCategory?.icon ?? ""),
                width: 28,
                height: 28,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(width: 16),

            // Title + Subtitle — takes available space
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    payment.feeCategory?.name ?? "Unknown Fee",
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
                    formatDueDate(payment.dueDate ?? ""),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontWeight.w500,
                      color: AppColors.instance.black400,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 16),

            // Trailing Radio Button
            Icon(
              isSelected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_unchecked,
              color:
                  isSelected
                      ? AppColors.instance.black600
                      : AppColors.instance.black300,
              size: 26,
            ),
          ],
        ),
      ),
    );
  }
}
