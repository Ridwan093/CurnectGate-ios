
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class OtpInputField extends StatefulWidget {
  final ValueChanged<String>? onCompleted;
  final int length;
  final Color activeColor;
  final Color filledColor;
  final Color defaultColor;

  const OtpInputField({
    super.key,
   required this.onCompleted,
   required  this.length ,
   required  this.activeColor,
   required this.filledColor ,
   required this.defaultColor ,
  });

  @override
  State<OtpInputField> createState() => _OtpInputFieldState();
}

class _OtpInputFieldState extends State<OtpInputField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  late List<String> _otp;

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  void _initialize() {
    _controllers = List.generate(
      widget.length,
      (index) => TextEditingController(),
    );
    _focusNodes = List.generate(
      widget.length,
      (index) => FocusNode(),
    );
    _otp = List.filled(widget.length, '');
    
    for (int i = 0; i < widget.length; i++) {
      _focusNodes[i].addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.length,
        (index) => _buildDigitField(index),
      ),
    );
  }

  Widget _buildDigitField(int index) {
    final isFocused = _focusNodes[index].hasFocus;
    final hasValue = _otp[index].isNotEmpty;
    final color = isFocused 
        ? widget.activeColor
        : hasValue 
            ? widget.filledColor 
            : widget.defaultColor;

    return SizedBox(
      width: 40,
      child: Column(
        children: [
          TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontFamilies.bold,
              fontFamily: FontFamilies.interDisplay,
            ),
            decoration: InputDecoration(
              counterText: '',
              contentPadding: EdgeInsets.zero,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: color,
                  width: 2,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: color,
                  width: 3,
                ),
              ),
              border: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: color,
                  width: 2,
                ),
              ),
            ),
            onChanged: (value) {
              if (value.length == 1) {
                _otp[index] = value;
                if (index < widget.length - 1) {
                  _focusNodes[index].unfocus();
                  FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                } else {
                  _focusNodes[index].unfocus();
                  widget.onCompleted?.call(_otp.join());
                }
              } else if (value.isEmpty && index > 0) {
                _otp[index] = '';
                _focusNodes[index].unfocus();
                FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
              }
              setState(() {});
            },
          ),
          const SizedBox(height: 4),
          if (isFocused)
            Container(
              height: 2,
              color: widget.activeColor,
            ),
        ],
      ),
    );
  }
}