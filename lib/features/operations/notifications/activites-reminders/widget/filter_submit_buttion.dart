import 'package:curnectgate/core/appErrorBody/LoadingState.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class FilterSubmitButtion extends StatelessWidget {
  final String buttiontext;
  final Color buttionColor;
  final VoidCallback? onTap;
  final Color buttionTextColor;
  final double width;
  final bool isLoading;

  const FilterSubmitButtion({
    super.key,
    this.width = 100,
    required this.buttiontext,
    required this.buttionColor,
    required this.onTap,
    required this.buttionTextColor,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50,
        width: width,

        decoration: BoxDecoration(
          color: buttionColor,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child:
              isLoading
                  ? Loadingstates()
                  : Text(
                    buttiontext,
                    style: TextStyle(
                      color: buttionTextColor,
                      fontFamily: FontFamilies.interDisplay,
                    ),
                  ),
        ),
      ),
    );
  }
}
