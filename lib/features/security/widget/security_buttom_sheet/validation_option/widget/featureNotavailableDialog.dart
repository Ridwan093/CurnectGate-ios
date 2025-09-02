import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

void showFuturNotAvailableDialog(BuildContext context, String content) {
  showDialog(
    context: context,
    builder:
        (context) => AlertDialog(
          title: Text(
            '$content is currently not available.',
            style: TextStyle(
              fontFamily: FontFamilies.interDisplay,
              fontSize: 16,
              color: AppColors.instance.black600,
              fontWeight: FontFamilies.bold,
            ),
          ),
          content: Text(
            'This feature is under development and will be available in a future update.',
            style: TextStyle(
              fontSize: 14,

              fontFamily: FontFamilies.interDisplay,

              color: AppColors.instance.black300,
              fontWeight: FontFamilies.medium,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'OK',
                style: TextStyle(
                  fontSize: 14,

                  fontFamily: FontFamilies.interDisplay,

                  color: AppColors.instance.teal400,
                  fontWeight: FontFamilies.bold,
                ),
              ),
            ),
          ],
        ),
  );
}
