import 'dart:developer';

import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:curnectgate/features/payment/provider/due_state_provider.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/due_model/outstanding_due.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ReviewPayment extends ConsumerStatefulWidget {
  final List<OutstandingDue> list;
  final String wallet;
  final bool isFull;
  const ReviewPayment({
    super.key,
    required this.list,
    required this.wallet,
    this.isFull = false,
  });

  @override
  ConsumerState<ReviewPayment> createState() => _ReviewPaymentState();
}

class _ReviewPaymentState extends ConsumerState<ReviewPayment>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String formatPrice(String price) {
    final number = double.tryParse(price) ?? 0.0;
    final formatter = NumberFormat('#,##0.00');
    return formatter.format(number);
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(formProvider).generateMemberIdLoading;
    final selectedAmounts = ref.watch(selectedBillsProvider);

    // Calculate subtotal from the selectedAmounts we passed over
    double subtotal = 0.0;
    for (var bill in widget.list) {
      if (selectedAmounts.containsKey(bill.id)) {
        subtotal += selectedAmounts[bill.id]!;
      }
    }

    // If we're coming from DuePayment (Pay Full), the provider might be empty.
    // In that case, we can recalculate from the list argument.
    if (subtotal == 0.0 && widget.list.isNotEmpty) {
      for (var bill in widget.list) {
        subtotal += double.tryParse(bill.amount ?? '0') ?? 0.0;
      }
    }

    const processingFee = 0.0;
    final totalDueNow = subtotal + processingFee;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Confirm Payment',
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            fontWeight: FontFamilies.bold,
            color: AppColors.instance.black600,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.instance.black600,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideAnimation,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "SUMMARY",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                        color: AppColors.instance.black400,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: AppColors.instance.grey300),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          ...widget.list.map((bill) {
                            final amount =
                                selectedAmounts[bill.id] ??
                                double.tryParse(bill.amount ?? '0') ??
                                0.0;
                            final isPartial = bill.allowPartialPayment ?? true;
                            return _ItemRow(
                              label: bill.feeCategory?.name ?? "Fee",
                              value: '₦ ${formatPrice(amount.toString())}',
                              isPartial: isPartial,
                            );
                          }),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 12),
                            child: Divider(height: 1),
                          ),
                          _SummaryRow(
                            label: 'Subtotal',
                            value: '₦ ${formatPrice(subtotal.toString())}',
                          ),
                          const SizedBox(height: 8),
                          _SummaryRow(
                            label: 'Processing Fee',
                            value: '₦ ${formatPrice(processingFee.toString())}',
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppColors.instance.teal400.withOpacity(
                                0.05,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Total Amount',
                                  style: TextStyle(
                                    fontFamily: FontFamilies.interDisplay,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '₦ ${formatPrice(totalDueNow.toString())}',
                                  style: TextStyle(
                                    fontFamily: FontFamilies.interDisplay,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: AppColors.instance.teal400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      "PAYMENT METHOD",
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                        color: AppColors.instance.black400,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _PaymentMethodTile(
                      icon: Icons.account_balance_wallet,
                      title: 'Estate Wallet',
                      subtitle: 'Pay from your balance',
                      walletBalance: widget.wallet,
                      isSelected: true,
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed:
                            isLoading
                                ? null
                                : () {
                                  final paymentsPayload =
                                      widget.list.map((bill) {
                                        final amount =
                                            selectedAmounts[bill.id] ??
                                            double.tryParse(
                                              bill.amount ?? '0',
                                            ) ??
                                            0.0;
                                        return {
                                          "due_id": bill.id,
                                          "amount": amount,
                                        };
                                      }).toList();

                                  if (widget.isFull) {
                                    log("full payment");
                                    ref
                                        .read(formProvider.notifier)
                                        .payFullOutstanding(
                                          context: context,
                                          ref: ref,
                                        );
                                  } else {
                                    log(paymentsPayload.toString());
                                    ref
                                        .read(formProvider.notifier)
                                        .payDueOutstanding(
                                          context: context,
                                          payments: paymentsPayload,
                                          ref: ref,
                                        );
                                  }
                                },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.instance.black600,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Text(
                          'Checkout',
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontWeight: FontWeight.w500,
                            color: AppColors.instance.black400,
                            fontSize: 11,
                          ),
                          children: [
                            TextSpan(
                              text: 'By checking out, you agree to our ',
                            ),
                            TextSpan(
                              style: TextStyle(
                                fontFamily: FontFamilies.interDisplay,
                                fontWeight: FontWeight.bold,
                                color: AppColors.instance.teal400,
                                fontSize: 11,
                              ),
                              text: 'payment policy',
                            ),
                            TextSpan(
                              text:
                                  '.\nYour selected amounts will be immediately deducted.',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (isLoading)
            Positioned.fill(
              child: Container(
                color: AppColors.instance.grey300.withOpacity(.9),
                child: Loadingstates(),
              ),
            ),
        ],
      ),
    );
  }
}

class _ItemRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isPartial;

  const _ItemRow({
    required this.label,
    required this.value,
    this.isPartial = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Flexible(
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black600,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (isPartial) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.instance.black200,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      'PARTIAL',
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        color: AppColors.instance.black600,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(width: 10),

          Text(
            value,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black400,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              color: AppColors.instance.black600,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _PaymentMethodTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String walletBalance;
  final bool isSelected;

  const _PaymentMethodTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.walletBalance,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.instance.teal100 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color:
              isSelected
                  ? AppColors.instance.teal400
                  : AppColors.instance.grey300,
          width: isSelected ? 1.5 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color:
                  isSelected
                      ? AppColors.instance.teal400
                      : AppColors.instance.grey200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: isSelected ? Colors.white : AppColors.instance.black400,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontWeight.bold,
                    color: AppColors.instance.black600,
                    fontSize: 15,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black400,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Balance: ₦$walletBalance",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.teal400,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          if (isSelected)
            Icon(
              Icons.check_circle,
              color: AppColors.instance.teal400,
              size: 24,
            )
          else
            Icon(
              Icons.radio_button_unchecked,
              color: AppColors.instance.grey300,
              size: 24,
            ),
        ],
      ),
    );
  }
}
