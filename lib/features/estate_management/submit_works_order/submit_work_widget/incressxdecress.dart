

import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Incressxdecress extends ConsumerWidget {
  final int value;
    final VoidCallback onIncrement;
    final VoidCallback onDecrement;
    final bool isIncrementActive;
    final bool isDecrementActive;
  const Incressxdecress({super.key,required this. value,
    required  this.onIncrement,
    required  this.onDecrement,
    required  this.isIncrementActive,
    required  this.isDecrementActive,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Decrement Button (-)
        GestureDetector(
          onTapDown: (_) => onDecrement(),
          child: _buildCircleButton(
            icon: Icons.remove,
            isActive: isDecrementActive,
          ),
        ),

        // Middle Number
        Container(
          width: 40,
          alignment: Alignment.center,
          child: Text(
            '$value',
            style: TextStyle(fontSize: 16,fontFamily:  FontFamilies.interDisplay, fontWeight: FontFamilies.bold),
          ),
        ),

        // Increment Button (+)
        GestureDetector(
          onTapDown: (_) => onIncrement(),
          child: _buildCircleButton(
            icon: Icons.add,
            isActive: isIncrementActive,
          ),
        ),
      ],
    );
  }

Widget _buildCircleButton({required IconData icon, required bool isActive}) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 200),
    width: 36,
    height: 36,
    decoration: BoxDecoration(
      color: isActive ? AppColors.instance.grey300:AppColors.instance.grey200,
      border: Border.all(
        color: isActive ? Colors.transparent : AppColors.instance.grey400,
        width: 1,
      ),
      shape: BoxShape.circle,
    ),
    child: Icon(icon, size: 20, color: isActive ? AppColors.instance.black600 :AppColors.instance.black600),
  );
}

  }

