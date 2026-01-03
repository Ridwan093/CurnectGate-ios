import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
///585099 digita id
/// 110582
class OtpInputField extends StatefulWidget {
  final int length;
  final Color activeColor;
  final Color filledColor;
  final Color defaultColor;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  const OtpInputField({
    super.key,
    required this.length,
    required this.activeColor,
    required this.filledColor,
    required this.defaultColor,
    this.controller,
    this.onChanged,
  });

  @override
  State<OtpInputField> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<OtpInputField> {
  late TextEditingController _internalController;

  @override
  void initState() {
    super.initState();
    _internalController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    // Only dispose the internal controller if we created it
    if (widget.controller == null) {
      _internalController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,

      length: widget.length,
      keyboardType: TextInputType.number,
      animationType: AnimationType.none,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.underline,
        fieldHeight: 50,
        fieldWidth: 40,
        activeColor: widget.activeColor,
        inactiveColor: widget.defaultColor,
        selectedColor: widget.activeColor,
        borderWidth: 2,
        activeBorderWidth: 3,
      ),
      cursorColor: Colors.black,
      textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      enableActiveFill: false,
      beforeTextPaste: (text) => true,
      onChanged: widget.onChanged ,
    );
  }
}