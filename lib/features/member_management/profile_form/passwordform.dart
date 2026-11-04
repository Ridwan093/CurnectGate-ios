import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/member_management/profile_form/provider%20/form_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordInputField extends ConsumerStatefulWidget {
  final String hintText;
  final String label;
  final bool showErroindicator;
  final ValueChanged<String>? onChanged;

  const PasswordInputField({
    super.key,
    required this.hintText,
    required this.label,
    this.onChanged,
    required this.showErroindicator,
  });

  @override
  ConsumerState<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends ConsumerState<PasswordInputField> {
  final AppColors colors = AppColors.instance;
  final bool _showPassword = false;

  // Validation states
  bool _hasMinLength = false;
  bool _hasNumber = false;
  bool _hasSpecialChar = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          obscureText: !_showPassword,
          decoration: _buildInputDecoration(),
          onChanged: (value) {
            ref.read(formProvider.notifier).updatePassword(value);
          
            _validatePassword(value);
            widget.onChanged?.call(value);
          },
        ),
        const SizedBox(height: 8),
        _buildValidationMessages(),
      ],
    );
  }

  void _validatePassword(String value) {
    setState(() {
      _hasMinLength = value.length >= 9;
      _hasNumber = value.contains(RegExp(r'[0-9]'));
      _hasSpecialChar = value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    });
  }

  Widget _buildValidationMessages() {
    return widget.showErroindicator
        ? Column(
          children: [
            const SizedBox(height: 10),
            _buildValidationRow("At least one number", _hasNumber),
            _buildValidationRow(
              "At least 9 or more characters ",
              _hasMinLength,
            ),
            _buildValidationRow(
              "At least 1 special character (e.g.!., @, #,\$,%,^)",
              _hasSpecialChar,
            ),
          ],
        )
        : SizedBox();
  }

  Widget _buildValidationRow(String text, bool isValid) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Icon(
            isValid ? Icons.check_circle : Icons.error,
            size: 16,
            color: isValid ? colors.teal500 : colors.error600,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 12,
              color: isValid ? colors.teal500 : colors.error600,
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
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
      hintText: widget.hintText,
      labelText: widget.label,

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
