import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/payment/state_model/payment_model/history_model/transaction_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PaymentReceiptCard extends StatelessWidget {
  final TransactionItem tx; // 👈 your model item

  const PaymentReceiptCard({super.key, required this.tx});
  double _toDouble(dynamic value) {
    if (value == null) return 0;
    if (value is num) return value.toDouble();
    return double.tryParse(value.toString()) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    final receipt = tx.receipt;

    return Container(
      width: 340,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// ✅ SUCCESS ICON
            Container(
              height: 60,
              width: 60,
              decoration: const BoxDecoration(
                color: Color(0xFFE8F7EE),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 36,
              ),
            ),

            const SizedBox(height: 12),

            Text(
              "Payment Successful",
              style: TextStyle(
                fontSize: 18,
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black600,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              "₦${NumberFormat('#,##0.00').format(_toDouble(tx.amount))}",
              style: TextStyle(
                fontSize: 26,
                fontFamily: FontFamilies.interDisplay,
                fontWeight: FontFamilies.bold,
                color: AppColors.instance.black600,
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),

            _row("Reference", tx.transactionReference ?? "-"),
            _row("Payment Method", _methodLabel(tx)),
            _row("Gateway", tx.paymentGateway ?? "-"),
            _row("Date", _formatDate(tx.paidAt ?? tx.createdAt)),

            if (receipt != null) ...[
              const Divider(),
              _row("Receipt No.", receipt.receiptNumber ?? "-"),
            ],

            const SizedBox(height: 16),

            /// ✅ ITEMS PAID
            if (tx.metadata?.itemsPaid?.isNotEmpty ?? false) ...[
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Items Paid",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
              const SizedBox(height: 8),

              ...tx.metadata!.itemsPaid!.map(
                (e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          e.category ?? "-",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                      Text(
                        "₦${NumberFormat('#,##0.00').format(_toDouble(e.amount))}",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],

            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 6),

            const Text(
              "Powered by Curnect",
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _row(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 12)),
          Flexible(
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(dynamic iso) {
    if (iso == null) return "-";

    try {
      DateTime? date;

      if (iso is int) {
        date = DateTime.fromMillisecondsSinceEpoch(iso);
      } else if (iso is String && iso.trim().isNotEmpty) {
        date = DateTime.tryParse(iso);
      }

      if (date == null) return "-";

      return DateFormat('dd MMM yyyy, hh:mm a').format(date.toLocal());
    } catch (_) {
      return "-";
    }
  }

  String _methodLabel(TransactionItem? tx) {
    final method = tx?.paymentMethod?.toLowerCase();

    if (method == "card") return "Card";
    if (method == "wallet") return "Wallet";
    if (method == "opay") return "OPay";

    return method ?? "-";
  }
}
