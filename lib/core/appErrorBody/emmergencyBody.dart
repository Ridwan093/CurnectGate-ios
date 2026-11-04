import 'package:curnectgate/core/style/colors.dart';
import 'package:flutter/material.dart';

class Emmergencybody extends StatelessWidget {
  final String error;
  const Emmergencybody({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: AppColors.instance.error600,
      child: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: Colors.orange),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "Connection issue: ${error.split(':').first}",
              style: const TextStyle(color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
