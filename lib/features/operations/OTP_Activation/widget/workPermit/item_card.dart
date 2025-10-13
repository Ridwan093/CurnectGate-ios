import 'package:flutter/material.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';

class ItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onRemove;

  const ItemCard({
    super.key,
    required this.item,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.instance.teal100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: InkWell(
              onTap: onRemove,
              child: const Icon(Icons.close, size: 16, color: Colors.red),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item['item_name'] ?? '',
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontWeight: FontWeight.w700,
                    color: AppColors.instance.black500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  "Qty: ${item['quantity']}  ₦${item['estimated_value']}",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black300,
                    fontSize: 12,
                  ),
                ),
                Text(
                  item['item_category'] ?? '',
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    fontSize: 11,
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
}
