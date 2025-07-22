import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

Future<bool> showSessionExpiredDialog(BuildContext context) async {
  return await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder:
            (context) => AlertDialog(
              title: Text(
                "Session Expired",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
              ),
              content: Text(
                "Your session has expired. Please log in again.",
                style: TextStyle(
                  fontFamily: FontFamilies.interDisplay,
                  color: AppColors.instance.black600,
                ),
              ),
              actions: [
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(true),
                  child: Container(
                    height: 40,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: AppColors.instance.teal300,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "LOGIN NOW",
                        style: TextStyle(
                          fontFamily: FontFamilies.interDisplay,
                          color: AppColors.instance.black600,
                          fontWeight: FontFamilies.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      ) ??
      false; // Returns false if dialog is dismissed
}
