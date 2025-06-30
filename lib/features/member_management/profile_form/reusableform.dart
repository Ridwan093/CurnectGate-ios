import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum FieldType { name, email, phone, oTpCode, general, password }

class ReusabelProfileForm extends StatefulWidget {
  final String hintText;
  final String label;
  final FieldType fieldType;
  final TextEditingController? controller;
  final int? maxLength;
  final int? maxLines;
  final String fieldKey;
  final ValueChanged<({bool isValid, String? error})>? onValidationChanged;

  const ReusabelProfileForm({
    super.key,
    required this.hintText,
    required this.label,
    required this.fieldKey,
    this.fieldType = FieldType.general,
    this.controller,
    this.onValidationChanged,
    this.maxLength,
    this.maxLines = 1,
  });

  @override
  State<ReusabelProfileForm> createState() => _ReusabelProfileFormState();
}

class _ReusabelProfileFormState extends State<ReusabelProfileForm> {
  late final TextEditingController _controller;
  final AppColors colors = AppColors.instance;
  String? _errorMessage;
  final bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      obscureText:
          widget.fieldType == FieldType.password ? _obscureText : false,
      decoration: _buildInputDecoration(),
      onChanged: _validateField,
      keyboardType: _getKeyboardType(),
      inputFormatters: _getInputFormatters(),
      validator: (_) => _errorMessage,
      autovalidateMode: AutovalidateMode.onUserInteraction,
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
      suffixIcon: _buildSuffixIcon(),
      errorText: _errorMessage,
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

  Widget? _buildSuffixIcon() {
    if (_errorMessage != null) {
      return Icon(Icons.error_outline, color: colors.error600);
    } else if (widget.fieldType == FieldType.password) {
      return null;
    }
    return null;
  }

  void _validateField(String value) {
    String? error;
    bool isValid = false;

    if (value.isEmpty) {
      error = '${widget.label} is required';
    } else {
      switch (widget.fieldType) {
        case FieldType.name:
          if (value.length < 2) {
            error = '${widget.label} must be at least 2 characters';
          } else if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(value)) {
            error = 'Only letters and spaces allowed';
          }
          break;
        case FieldType.email:
          if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
            error = 'Please enter a correct email  address';
          }
          break;
        case FieldType.phone:
          if (value.length < 10) {
            error = 'Phone number must be at least 10 digits';
          } else if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
            error = 'Only numbers allowed';
          }
          break;
        case FieldType.password:
          // if (value.length < 9) {
          //   error = '';
          // } else if (!RegExp(r'[0-9]').hasMatch(value)) {
          //   error = '';
          // } else if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
          //   error = '';
          // }
          break;
        case FieldType.oTpCode:
          if (value.length < 6) {
            error = 'OTP Code  must be at least 6 characters';
          } else if (value.isEmpty) {
            error = 'Please enter a correct OTP code';
          }
          break;
        case FieldType.general:
          if (value.length < 50) {
            error = '${widget.label} must be at least 50 characters';
          }
          break;
      }
    }

    setState(() {
      _errorMessage = error;
      isValid = error == null;
    });

    widget.onValidationChanged?.call((isValid: isValid, error: error));
  }

  TextInputType _getKeyboardType() {
    switch (widget.fieldType) {
      case FieldType.email:
        return TextInputType.emailAddress;
      case FieldType.phone:
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
  }

  List<TextInputFormatter>? _getInputFormatters() {
    switch (widget.fieldType) {
      case FieldType.name:
        return [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))];
      case FieldType.phone:
        return [FilteringTextInputFormatter.digitsOnly];
      default:
        return null;
    }
  }
}
