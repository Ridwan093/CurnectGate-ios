import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum FieldType {
  name,
  email,
  phone,
  oTpCode,
  vendorOtp,
  general,
  password,
  reason,
  year,
  itemName,
}

class ReusabelProfileForm extends StatefulWidget {
  final String? initialValue;
  final bool isRead;
  final String hintText;
  final String label;

  final FieldType fieldType;
  final TextEditingController? controller;
  final int? maxLength;
  final int? maxLines;
  final String fieldKey;
  final ValueChanged<({bool isValid, String? error})>? onValidationChanged;
  final void Function(String)? onChanged;
  final bool showLockIcon; // New parameter for read-only fields

  const ReusabelProfileForm({
    super.key,
    required this.hintText,
    required this.label,
    required this.fieldKey,
    this.fieldType = FieldType.general,
    this.isRead = false,
    this.controller,
    this.initialValue,
    this.onValidationChanged,
    this.onChanged,
    this.maxLength,
    this.maxLines = 1,
    this.showLockIcon = false,
    // Default to false
  });

  @override
  State<ReusabelProfileForm> createState() => _ReusabelProfileFormState();
}

class _ReusabelProfileFormState extends State<ReusabelProfileForm> {
  late final TextEditingController _controller;
  final AppColors colors = AppColors.instance;
  String? _errorMessage;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    // Add this in initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_controller.text.isNotEmpty) {
        _validateField(_controller.text);
      }
    });
    if (widget.initialValue != null) {
      _controller.text = widget.initialValue!;
    }
  }

  @override
  void didUpdateWidget(covariant ReusabelProfileForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue &&
        widget.initialValue != _controller.text) {
      _controller.text = widget.initialValue ?? '';
      _validateField(_controller.text);
    }
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
      controller: _controller, // Using controller instead of initialValue
      readOnly: widget.isRead,
      // enabled: !widget.isRead, // Properly disables interaction
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      obscureText:
          widget.fieldType == FieldType.password ? _obscureText : false,
      decoration: _buildInputDecoration(),
      // onChanged: _validateField, // Skip validation if read-only
      onChanged: (value) {
        _validateField(value.trim());
        widget.onChanged!(value);
      },
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
      return IconButton(
        icon: Icon(
          _obscureText ? Icons.visibility_off : Icons.visibility,
          color: colors.black400,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    } else if (widget.isRead && widget.showLockIcon) {
      return Icon(Icons.lock_outline, size: 18, color: colors.black400);
    }
    return null;
  }

  void _validateField(String value) {
    String? error;
    bool isValid = false;
    widget.onChanged;
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
            error = 'Please enter a correct email address';
          }
          break;
        case FieldType.phone:
          final cleaned = value.replaceAll(RegExp(r'[^0-9]'), '');
          if (cleaned.length < 10) {
            error = 'Phone number must be at least 10 digits';
          } else if (!RegExp(r'^\+?[0-9-]+$').hasMatch(value)) {
            error = 'Invalid phone number format';
          }

        case FieldType.year:
          if (value.isEmpty) {
            error = '${widget.label} must be at least 1 digits';
          }
          break;
        case FieldType.password:
          // Password validation logic

          break;
        case FieldType.oTpCode:
          if (value.length < 6) {
            error = 'OTP Code must be at least 6 characters';
          } else if (value.isEmpty) {
            error = 'Please enter a correct OTP code';
          }
          break;
        case FieldType.vendorOtp:
          if (value.length < 5) {
            error = 'OTP Code must be at least 5 characters';
          } else if (value.isEmpty) {
            error = 'Please enter a correct OTP code';
          }
          break;
        case FieldType.general:
          if (value.length < 20) {
            error = '${widget.label} must be at least 20 characters';
          }
        case FieldType.reason:
          if (value.length < 10) {
            error = '${widget.label} must be at least 10 characters';
          }
        case FieldType.itemName:
          if (value.length < 5) {
            error = '${widget.label} must be at least 5 characters';
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
      case FieldType.year:
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
        return [FilteringTextInputFormatter.allow(RegExp(r'[0-9+\-]'))];
      default:
        return null;
    }
  }
}
