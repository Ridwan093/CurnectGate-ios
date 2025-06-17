import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ReUsableForm extends StatefulWidget {
  final String hintText;
  final String label;

  const ReUsableForm({
    super.key,
    required this.onValidationChanged,
    required this.hintText,
    required this.label, 
  });

  final ValueChanged<bool>? onValidationChanged;

  @override
  State<ReUsableForm> createState() => ReUsableFormState();
}

class ReUsableFormState extends State<ReUsableForm> {
  final TextEditingController _controller = TextEditingController();
  final AppColors colors = AppColors.instance;
  String _errorMessage = '';
  bool _isValid = false;

  // Public getter to access the validation status and value
  bool get isValid => _isValid;
  String get currentValue => _controller.text;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      decoration: _buildInputDecoration(),
      onChanged: _validateCode,
      validator: (_) => _errorMessage.isNotEmpty ? _errorMessage : null,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9]')),
      ],
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
      // hintText: "e.g. D45679",
      // labelText: "Estate Code",
      hintText: widget.hintText,
      labelText: widget.label,
      suffixIcon:
          _errorMessage.isNotEmpty
              ? Icon(Icons.error, color: colors.error600)
              : null,
      errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
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

  void _validateCode(String value) {
    final wasValid = _isValid;

    setState(() {
      if (value.isEmpty) {
        _errorMessage = '';
        _isValid = false;
      } else if (value.length < 6) {
        _errorMessage = 'Must be at least 6 characters';
        _isValid = false;
      } else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(value)) {
        _errorMessage = 'Only alphanumeric characters allowed';
        _isValid = false;
      } else {
        _errorMessage = '';
        _isValid = true;
      }
    });

    // Only notify listeners when validity changes
    if (_isValid != wasValid) {
      widget.onValidationChanged?.call(_isValid);
    }
  }
}
