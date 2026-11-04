import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/services/recipt_service.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/history_model/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionCard extends StatelessWidget {
  final TransactionItem transaction;

  const TransactionCard({super.key, required this.transaction});

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'success':
      case 'successful':
      case 'paid':
        return AppColors.instance.teal500;
      case 'failed':
      case 'cancelled':
        return AppColors.instance.error600;
      case 'pending':
        return AppColors.instance.yellow600;
      default:
        return AppColors.instance.black400;
    }
  }

  IconData _getTransactionIcon(String type) {
    if (type.toLowerCase().contains('wallet')) return Icons.wallet;
    if (type.toLowerCase().contains('bill')) return Icons.receipt_long;
    return Icons.payment;
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(transaction.status ?? '');
    final amount = double.tryParse(transaction.amount ?? '0') ?? 0.0;
    final formatter = NumberFormat('#,##0.00');

    // Parse date
    DateTime? date;
    try {
      date = DateTime.parse(transaction.createdAt ?? '');
    } catch (_) {}
    final dateString =
        date != null
            ? DateFormat('MMM dd, yyyy • hh:mm a').format(date)
            : transaction.createdAt ?? '';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.instance.grey300),
      ),
      child: InkWell(
        onTap: () async {
          await showPaymentReceipt(context, transaction);
          // Open detail view or receipt
        },
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getTransactionIcon(transaction.transactionType ?? ''),
                  color: statusColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.description ?? 'Transaction',
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
                      dateString,
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
                    '₦ ${formatter.format(amount)}',
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontWeight.bold,
                      color: AppColors.instance.black600,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      (transaction.status ?? 'Pending').toUpperCase(),
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        color: statusColor,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
