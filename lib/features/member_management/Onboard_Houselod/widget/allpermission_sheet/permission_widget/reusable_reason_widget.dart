import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReusableReasonWidget extends ConsumerWidget {
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final bool isEnable;
  const ReusableReasonWidget({
    super.key,
    required this.onChanged,
    required this.isEnable,
    this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      controller: controller,
      readOnly: isEnable,
      keyboardType: TextInputType.name,

      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.instance.black500),

          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),

          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(style: BorderStyle.none),

          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        fillColor: Colors.white,
        filled: true,
        hintText: "add reason",
        hintStyle: TextStyle(
          color: AppColors.instance.black300,
          fontFamily: FontFamilies.interDisplay,
          fontWeight: FontFamilies.medium,
          fontSize: 14,
        ),
        prefixIcon: Icon(Icons.note, color: AppColors.instance.grey400),
      ),
      onChanged: onChanged,
    );
  }
}
