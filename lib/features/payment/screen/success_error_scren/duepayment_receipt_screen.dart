import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/provider/due_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class PaymentReceiptScreen extends ConsumerWidget {
  const PaymentReceiptScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedAmounts = ref.watch(selectedBillsProvider);
    final bills = ref.watch(billsProvider);

    final selectedBills =
        bills.where((bill) => selectedAmounts.containsKey(bill.id)).toList();
    final totalPaid = selectedAmounts.values.fold(0.0, (sum, val) => sum + val);
    const remainingBalance = 45.0;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Payment Receipt',
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black600,
            fontSize: 18,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 30),
              // Animated Success Icon
              TweenAnimationBuilder<double>(
                tween: Tween(begin: 0, end: 1),
                duration: const Duration(milliseconds: 600),
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: AppColors.instance.teal400.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_circle_rounded,
                        color: AppColors.instance.teal400,
                        size: 70,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 24),
              Text(
                'Payment Successful',
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.instance.black600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Your payment of ₦ ${totalPaid.toStringAsFixed(2)} has been processed successfully.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black400,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 40),
              // Receipt Card
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.instance.grey300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _DetailLabel(
                          label: 'Transaction Ref',
                          value:
                              'REF-${DateFormat('mmdd').format(DateTime.now())}${totalPaid.toInt()}',
                        ),
                        _DetailLabel(
                          label: 'Date',
                          value: DateFormat(
                            'MMM dd, yyyy',
                          ).format(DateTime.now()),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Divider(height: 1),
                    ),
                    ...selectedBills.map(
                      (bill) => _ReceiptItem(
                        title: bill.feeCategory?.name ?? "Fee",
                        amount:
                            '₦ ${selectedAmounts[bill.id]!.toStringAsFixed(2)}',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Divider(height: 1),
                    ),
                    _ReceiptTotalRow(
                      label: 'Total Amount',
                      value: '₦ ${totalPaid.toStringAsFixed(2)}',
                      isBold: true,
                    ),
                    const SizedBox(height: 12),
                    _ReceiptTotalRow(
                      label: 'Remaining Balance',
                      value: '₦ ${remainingBalance.toStringAsFixed(2)}',
                      color: Colors.orange[700],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: AppColors.instance.grey300),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Download',
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          color: AppColors.instance.black600,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.instance.teal400,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Done',
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class _DetailLabel extends StatelessWidget {
  final String label;
  final String value;

  const _DetailLabel({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.toUpperCase(),
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 10,
            letterSpacing: 1.1,
            color: AppColors.instance.black400,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontSize: 13,
            color: AppColors.instance.black600,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _ReceiptItem extends StatelessWidget {
  final String title;
  final String amount;

  const _ReceiptItem({required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontSize: 14,
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class _ReceiptTotalRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;
  final Color? color;

  const _ReceiptTotalRow({
    required this.label,
    required this.value,
    this.isBold = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color:
                isBold
                    ? AppColors.instance.black600
                    : AppColors.instance.black400,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            fontSize: isBold ? 16 : 14,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color:
                color ??
                (isBold
                    ? AppColors.instance.teal400
                    : AppColors.instance.black600),
            fontWeight: FontWeight.bold,
            fontSize: isBold ? 18 : 14,
          ),
        ),
      ],
    );
  }
}
