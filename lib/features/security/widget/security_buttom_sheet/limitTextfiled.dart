import 'package:curnectgate/core/style/colors.dart' show AppColors;
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class LimitedTextField extends StatefulWidget {
  final int maxLength;
  final String hintText;
  final int maxLines;

  const LimitedTextField({
    super.key,
    this.maxLength = 500,
    this.hintText = 'Enter your text',
    this.maxLines = 3,
  });

  @override
  State<LimitedTextField> createState() => _LimitedTextFieldState();
}

class _LimitedTextFieldState extends State<LimitedTextField> {
  late TextEditingController _controller;
  int _remainingChars = 500;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _remainingChars = widget.maxLength;
    _controller.addListener(_updateRemainingChars);
  }

  void _updateRemainingChars() {
    setState(() {
      _remainingChars = widget.maxLength - _controller.text.length;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            // Adjust max width as needed
          ),
          child: TextField(
            controller: _controller,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
              counterText: "",
              hintText: widget.hintText,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.instance.black600),
                borderRadius: BorderRadius.circular(10),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.instance.black600),
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: EdgeInsets.all(12),
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          '$_remainingChars characters remaining',
          style: TextStyle(
            fontFamily: FontFamilies.interDisplay,
            color:
                _remainingChars < 1
                    ? AppColors.instance.error500
                    : AppColors.instance.black300,
            fontSize: 10,
            fontWeight: FontFamilies.bold,
          ),
        ),
      ],
    );
  }
}
