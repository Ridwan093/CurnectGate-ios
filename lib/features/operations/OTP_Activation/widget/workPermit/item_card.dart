import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onRemove;

  const ItemCard({super.key, required this.item, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            bottom: 10,
            top: 5,
          ),
          decoration: BoxDecoration(
            color: AppColors.instance.teal100,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      item['item_name'] ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,
                        fontWeight: FontFamilies.bold,
                        color: AppColors.instance.black500,
                      ),
                    ),
                    SizedBox(width: 12),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 20, right: 10),
                    //   child: InkWell(
                    //     onTap: onRemove,
                    //     child: Align(
                    //       alignment: Alignment.topRight,
                    //       child: CircleAvatar(
                    //         backgroundColor: AppColors.instance.grey200,
                    //         radius: 10,
                    //         child: Icon(
                    //           Icons.close,
                    //           size: 16,
                    //           color: AppColors.instance.error500,
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  "Qty: ${item['quantity']}",
                  style: TextStyle(
                    fontFamily: FontFamilies.interDisplay,
                    color: AppColors.instance.black300,
                    fontSize: 12,
                  ),
                ),
                Flexible(
                  child: Text(
                    item['item_category'] ?? '',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 11,
                      color: AppColors.instance.black300,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 5,
          child: InkWell(
            onTap: onRemove,
            child: CircleAvatar(
              backgroundColor: AppColors.instance.grey200,
              radius: 10,
              child: Icon(
                Icons.close,
                size: 16,
                color: AppColors.instance.error500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
