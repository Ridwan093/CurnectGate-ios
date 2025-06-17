
import 'package:curnectgate/core/style/fontStyle.dart';

import 'package:flutter/material.dart';

class OnBoardButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color bodycolor;
  final Color textcolor;
  const OnBoardButton({
    super.key,
    required this.label,
    required this.onPressed,
    required this.bodycolor,
    required this.textcolor
  });

  @override
  Widget build(BuildContext context) {


    return _biuldbutton(
      textcolor: textcolor,
      bodycolor: bodycolor,
      context: context,
      ontap: onPressed,
      title: label,
    );
  }

  Widget _biuldbutton({
    required Color bodycolor,
    required Color textcolor,
    required BuildContext context,
    required VoidCallback ontap,
    required String title,
  }) {
    final size = MediaQuery.sizeOf(context);
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
          color: bodycolor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 17,
              fontWeight: FontFamilies.medium,
              color: textcolor,
            ),
          ),
        ),
      ),
    );
  }
}