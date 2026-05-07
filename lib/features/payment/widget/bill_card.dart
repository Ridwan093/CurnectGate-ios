import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/provider/due_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../state_model/payment_model/due_model/outstanding_due.dart';

class BillCard extends ConsumerStatefulWidget {
  final OutstandingDue bill;

  const BillCard({super.key, required this.bill});

  @override
  ConsumerState<BillCard> createState() => _BillCardState();
}

class _BillCardState extends ConsumerState<BillCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isExpanded = false;
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);
    _textController = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _textController.dispose();
    super.dispose();
  }

  void _updateExpansion(bool expand) {
    if (expand == _isExpanded) return;
    setState(() => _isExpanded = expand);
    if (_isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
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

  String _formatDueDate(String? isoDate) {
    if (isoDate == null || isoDate.isEmpty) return "N/A";
    try {
      DateTime date = DateTime.parse(isoDate);
      return DateFormat('MMM dd, yyyy').format(date);
    } catch (e) {
      return isoDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedAmounts = ref.watch(selectedBillsProvider);
    final billId = widget.bill.id ?? 0;

    final totalAmount = double.tryParse(widget.bill.balance ?? '0') ?? 0.0;
    final isSelected = selectedAmounts.containsKey(billId);
    final paidAmount = selectedAmounts[billId] ?? 0.0;

    final remaining = totalAmount - paidAmount;
    final isFullPaymentOnly = !(widget.bill.allowPartialPayment ?? true);

    final percent =
        totalAmount > 0
            ? ((paidAmount / totalAmount) * 100).clamp(0, 100).toInt()
            : 0;

    final billMinimum =
        double.tryParse(widget.bill.minimumPayableAmount ?? '0') ?? 0.0;
    final minimumAmount =
        billMinimum > 0
            ? billMinimum
            : ref.watch(selectedBillsProvider.notifier).minimumAmount;

    final isBelowMinimum =
        !isFullPaymentOnly &&
        paidAmount > 0 &&
        minimumAmount > 0 &&
        paidAmount < minimumAmount &&
        paidAmount < totalAmount;

    if (_textController.text.isEmpty) {
      _textController.text =
          paidAmount > 0
              ? paidAmount.toStringAsFixed(2)
              : totalAmount.toStringAsFixed(2);
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color:
              isSelected
                  ? AppColors.instance.teal400
                  : AppColors.instance.grey300,
          width: isSelected ? 1.5 : 1,
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: AppColors.instance.teal300,
                  child: Icon(
                    _getIconData(widget.bill.feeCategory?.name),
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.bill.feeCategory?.name ?? "Unknown Fee",
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          fontWeight: FontWeight.bold,
                          color: AppColors.instance.black600,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Due: ${_formatDueDate(widget.bill.dueDate)}",
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          color: AppColors.instance.black400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '₦ ${totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontWeight.bold,
                        color: AppColors.instance.black600,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Transform.scale(
                      scale: 1.1,
                      child: Checkbox(
                        value: isSelected,
                        activeColor: AppColors.instance.teal400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        onChanged: (val) {
                          ref
                              .read(selectedBillsProvider.notifier)
                              .toggleBill(
                                billId,
                                totalAmount,
                                forceValue: true,
                                targetValue: val ?? false,
                              );

                          _updateExpansion(val ?? false);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizeTransition(
            sizeFactor: _animation,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(color: AppColors.instance.grey300),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Amount to Pay',
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          color: AppColors.instance.black500,
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                      if (!isFullPaymentOnly)
                        Text(
                          remaining > 0
                              ? 'Remaining: ₦ ${remaining.toStringAsFixed(2)} ($percent%)'
                              : 'Fully Paid ($percent%)',
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            color:
                                remaining > 0
                                    ? AppColors.instance.error600
                                    : Colors.green,
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    enabled: !isFullPaymentOnly,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      color: AppColors.instance.black600,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: InputDecoration(
                      prefixText: '₦ ',
                      prefixStyle: TextStyle(
                        color: AppColors.instance.black600,
                        fontWeight: FontWeight.bold,
                      ),
                      hintText: '0.00',
                      errorText: isBelowMinimum ? '' : null,
                      errorStyle: const TextStyle(height: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppColors.instance.grey300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                          color: AppColors.instance.teal400,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.redAccent,
                          width: 1.5,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                          color: Colors.redAccent,
                          width: 2,
                        ),
                      ),
                      filled: true,
                      fillColor: AppColors.instance.grey200,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 14,
                      ),
                    ),
                    controller: _textController,
                    onChanged: (val) {
                      final newAmount = double.tryParse(val) ?? 0.0;
                      if (newAmount > 0) {
                        ref
                            .read(selectedBillsProvider.notifier)
                            .updateAmount(billId, newAmount);
                      }
                    },
                  ),
                  if (isBelowMinimum)
                    Padding(
                      padding: const EdgeInsets.only(top: 8, left: 4),
                      child: Text(
                        'Amount is below minimum: ₦ ${minimumAmount.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.redAccent,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  if (!isFullPaymentOnly)
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Row(
                        children:
                            [25, 50, 75, 100].map((percentVal) {
                              return Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      double newAmount =
                                          (totalAmount * percentVal) / 100;

                                      // Snap to minimum if below and not a full payment
                                      if (minimumAmount > 0 &&
                                          newAmount < minimumAmount &&
                                          newAmount < totalAmount) {
                                        newAmount = minimumAmount;
                                      }

                                      _textController.text = newAmount
                                          .toStringAsFixed(2);
                                      ref
                                          .read(selectedBillsProvider.notifier)
                                          .updateAmount(billId, newAmount);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            percent == percentVal
                                                ? AppColors.instance.teal400
                                                : AppColors.instance.teal100
                                                    .withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: AppColors.instance.teal400,
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '$percentVal%',
                                        style: TextStyle(
                                          fontFamily: FontFamilies.interDisplay,
                                          color:
                                              percent == percentVal
                                                  ? Colors.white
                                                  : AppColors.instance.teal400,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  if (isFullPaymentOnly)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'This bill requires full payment.',
                        style: TextStyle(
                          color: AppColors.instance.black400,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  if (!isFullPaymentOnly && minimumAmount > 0)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        'Minimum partial payment allowed: ₦ ${minimumAmount.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: AppColors.instance.teal400,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
