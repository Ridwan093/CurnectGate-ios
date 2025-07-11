import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UpdateInput extends ConsumerWidget {
  final String hintText;
  final String label;
  final bool obscureText;
  final bool isRequired;
  final String? errorText;
  final ValueChanged<String>? onChanged;

  const UpdateInput({
    super.key,
    required this.hintText,
    required this.label,
    this.obscureText = false,
    this.isRequired = true,
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      obscureText: obscureText,
      decoration: _buildInputDecoration(
        hintText,
        label,
        AppColors.instance,
        errorText,
      ),
      validator:
          isRequired
              ? (value) =>
                  value == null || value.isEmpty ? 'Required $label' : ""
              : null,
      onChanged: onChanged,
    );
  }

  InputDecoration _buildInputDecoration(
    String hintText,
    String label,
    AppColors colors,
    String? errorText,
  ) {
    return InputDecoration(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors.black400),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors.black400),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: colors.error600,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color:  colors.error600,
        ),
      ),
      hintText: hintText,
      labelText: label,
      errorText: errorText == "" ? null : errorText,
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
    );
  }
}
