import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddReminderForms extends ConsumerWidget {
  final FocusNode? focusNode;
  final String label;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final TextInputType textInputType;
  final List<TextInputFormatter>? textInputFormatter;
  
  const AddReminderForms(
    this.controller, {
    super.key,
    required this.label,
    this.onChanged,
    this.focusNode,
    required this.textInputType,
    this.textInputFormatter
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = AppColors.instance;
    return TextField(
      keyboardType: textInputType,
      inputFormatters: textInputFormatter,
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: label,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.black400),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.black400),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.error600),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors.error600),
        ),
        hintStyle: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: colors.black300,
          fontSize: 13,
        ),
        labelStyle: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: colors.black300,
          fontSize: 13,
        ),
      ),
      onChanged: onChanged,
    );
  }
}
