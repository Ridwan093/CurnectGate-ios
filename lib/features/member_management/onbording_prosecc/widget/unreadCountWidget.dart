import 'package:curnectgate/core/style/colors.dart';
import 'package:flutter/material.dart';

class Unreadcountwidget extends StatelessWidget {
  final int unreadCount;
  const Unreadcountwidget({super.key, required this.unreadCount});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -6,
      right: -6,
      child: Container(
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.instance.teal400,
          shape: BoxShape.circle,
        ),
        constraints: const BoxConstraints(
          minWidth: 16,
          minHeight: 16, // Ensure it's perfectly round
        ),
        child: Center(
          child: Text(
            unreadCount > 99 ? '99+' : unreadCount.toString(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
    ;
  }
}
