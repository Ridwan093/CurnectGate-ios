import 'package:flutter/material.dart';

class ReceiptStatusStyle {
  final Color color;
  final IconData icon;
  final String label;

  const ReceiptStatusStyle(this.color, this.icon, this.label);

  static ReceiptStatusStyle from(String? status) {
    final s = (status ?? "").toLowerCase();

    if (s.contains("success") || s.contains("paid")) {
      return const ReceiptStatusStyle(
        Color(0xFF12B76A),
        Icons.check_circle,
        "Successful",
      );
    }

    if (s.contains("pending")) {
      return const ReceiptStatusStyle(
        Color(0xFFF79009),
        Icons.schedule,
        "Pending",
      );
    }

    return const ReceiptStatusStyle(Color(0xFFD92D20), Icons.cancel, "Failed");
  }
}
