import 'package:flutter/material.dart';
import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValidatedFormField extends ConsumerWidget {
  final String label;
  final String hintText;
  final String? errorText;
  final Function(String) onChanged;
  final TextInputType? keyboardType;
  final int? maxLength;
  final int? maxLines;
  final bool obscureText;

  const ValidatedFormField({
    super.key,
    required this.label,
    required this.hintText,
    required this.onChanged,
    this.errorText,
    this.keyboardType,
    this.maxLength,
    this.maxLines = 1,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppColors colors = AppColors.instance;

    return TextField(
      onChanged: onChanged,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: maxLines,
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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
        hintText: hintText,
        labelText: label,
        suffixIcon: errorText?.isNotEmpty == true
            ? Icon(Icons.error, color: colors.error600)
            : null,
        errorText: errorText,
        labelStyle: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: colors.black300,
          fontSize: 13,
        ),
        errorStyle: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: colors.error600,
          fontSize: 12,
        ),
        hintStyle: TextStyle(
          fontFamily: FontFamilies.interDisplay,
          color: colors.black300,
          fontSize: 13,
        ),
      ),
    );
  }
}