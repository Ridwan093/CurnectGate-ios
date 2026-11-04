import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onRemove;

  const ItemCard({super.key, required this.item, required this.onRemove});

  @override
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Dismissible(
      key: ValueKey(item.hashCode),

      direction: DismissDirection.endToStart,
      confirmDismiss: (_) async {
        return await showDialog<bool>(
              context: context,
              builder:
                  (_) => AlertDialog(
                    title: Text(
                      'Remove item?',
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,

                        color: AppColors.instance.black600,
                      ),
                    ),
                    content: Text(
                      'This action cannot be undone.',
                      style: TextStyle(
                        fontFamily: FontFamilies.interDisplay,

                        color: AppColors.instance.black400,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 12,
                            color: AppColors.instance.black300,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: Text(
                          'Remove',
                          style: TextStyle(
                            fontFamily: FontFamilies.interDisplay,
                            fontSize: 12,
                            color: AppColors.instance.error500,
                          ),
                        ),
                      ),
                    ],
                  ),
            ) ??
            false;
      },
      onDismissed: (_) => onRemove(),

      background: _buildDeleteBackground(),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Material(
          borderRadius: BorderRadius.circular(10),
          elevation: .7,
          color: Colors.white,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: size.width,
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
              bottom: 5,
              top: 5,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 23),
                const SizedBox(width: 5),
                Flexible(
                  child: Text(
                    " ${item['quantity']} X ${item['item_name'] ?? ''}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontWeight: FontFamilies.bold,
                      color: AppColors.instance.black400,
                      fontSize: 11,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDeleteBackground() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
        color: AppColors.instance.error500,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(Icons.delete_outline, color: Colors.white),
          SizedBox(width: 6),
          Text(
            "Remove",
            style: TextStyle(
              color: Colors.white,
              fontFamily: FontFamilies.interDisplay,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
