import 'dart:developer';

import 'package:curnectgate/core/navigation/route_path.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/provider/due_payment_provider.dart';
import 'package:curnectgate/features/payment/provider/due_state_provider.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/due_model/outstanding_dues_data.dart';
import 'package:curnectgate/features/payment/widget/bill_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// ================== MAIN SCREEN ==================

// ================== MAIN SCREEN ==================
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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bills = data?.dues ?? [];
    final selectedAmounts = ref.watch(selectedBillsProvider);
    final totalPayable = selectedAmounts.values.fold(0.0, (a, b) => a + b);

    final totalDueAmount = double.tryParse(totalDue) ?? 0.0;
    final hasPartial = bills.any((b) => b.allowPartialPayment == true);
    final allSelected =
        bills.isNotEmpty && selectedAmounts.length == bills.length;

    final response = ref.watch(paymentDueProvider).value;
    final minimumAmountGlobal =
        double.tryParse(
          response?.minimumPayableAmount ??
              data?.minimumPayableAmount ??
              data?.summary?.minimumPayableAmount ??
              '0',
        ) ??
        0.0;

    log(
      "MINIMUM PAYABLE: $minimumAmountGlobal (Response: ${response?.minimumPayableAmount}, Data: ${data?.minimumPayableAmount}, Summary: ${data?.summary?.minimumPayableAmount})",
    );

    final anyBelowMinimum = selectedAmounts.entries.any((entry) {
      final bill = bills.firstWhere((b) => b.id == entry.key);
      final totalAmount = double.tryParse(bill.amount ?? '0') ?? 0.0;
      final isFullPayment = (entry.value - totalAmount).abs() < 0.01;
      final billMinimum =
          double.tryParse(bill.minimumPayableAmount ?? '0') ?? 0.0;
      final effectiveMinimum =
          billMinimum > 0 ? billMinimum : minimumAmountGlobal;

      return !isFullPayment &&
          effectiveMinimum > 0 &&
          entry.value < effectiveMinimum;
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.instance.black600,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Text(
          'Outstanding Bills',
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black600,
            fontSize: 18,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            // Total Outstanding Card
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(24),
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.instance.teal400,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.instance.teal400.withOpacity(0.3),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'TOTAL DUE AMOUNT',
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (hasPartial)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'PARTIAL',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '₦ ${totalDueAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${bills.length} bills pending',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 13,
                    ),
                  ),
                  if (data?.minimumPayableAmount != null &&
                      (double.tryParse(data!.minimumPayableAmount!) ?? 0) > 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Minimum partial payment: ₦ ${data!.minimumPayableAmount}',
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          color: Colors.white.withOpacity(0.9),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pending Bills',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      color: AppColors.instance.black600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (allSelected) {
                        ref
                            .read(selectedBillsProvider.notifier)
                            .clearSelection();
                      } else {
                        ref
                            .read(selectedBillsProvider.notifier)
                            .selectAll(bills);
                      }
                    },
                    child: Text(
                      allSelected ? 'Unselect All' : 'Select All',
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.teal400,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Bills List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: bills.length,
                itemBuilder: (context, index) {
                  return BillCard(bill: bills[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${selectedAmounts.length} items selected',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black400,
                    ),
                  ),
                  Text(
                    '₦ ${totalPayable.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.instance.black600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed:
                      totalPayable > 0 && !anyBelowMinimum
                          ? () {
                            final selectedPaymentsList =
                                bills
                                    .where(
                                      (b) => selectedAmounts.containsKey(b.id),
                                    )
                                    .toList();

                            context.pushNamed(
                              AppRoutes.paymentReview,
                              extra: {
                                "list": selectedPaymentsList,
                                "wallet": walletBalance,
                                "isFull": false,
                              },
                            );
                          }
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.instance.teal400,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Proceed to Checkout',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 16,
                      fontWeight: FontFamilies.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
