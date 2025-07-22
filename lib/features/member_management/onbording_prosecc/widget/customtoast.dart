import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';
void showCustomSuccessToast({
  required BuildContext context,
  required String message,
  required Color color,
  required IconData icon,
  required Color iconColors,
  required int positionNumber,
  int maxLines = 3, // Maximum lines before text is truncated
  Duration? duration, // Allow custom duration
}) {
  final overlay = Overlay.of(context);
  final textStyle = TextStyle(
    fontFamily: FontFamilies.interDisplay,
    fontWeight: FontFamilies.medium,
    color: AppColors.instance.black600,
    fontSize: 14,
  );

 
  final screenWidth = MediaQuery.of(context).size.width;

  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).viewInsets.top + positionNumber,
      left: screenWidth * 0.1,
      right: screenWidth * 0.1,
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: screenWidth * 0.8,
              minWidth: screenWidth * 0.3,
            ),
            child: AnimatedSize(
              duration: const Duration(milliseconds: 200),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: iconColors, size: 20),
                    const SizedBox(width: 12),
                    Flexible(
                      child: Text(
                        message,
                        style: textStyle,
                        textAlign: TextAlign.center,
                        maxLines: maxLines,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  // Calculate duration based on word count if not specified
  final toastDuration = duration ?? 
      Duration(seconds: (2 + (message.split(' ').length / 5)).round().clamp(2, 5));

  Future.delayed(toastDuration, overlayEntry.remove);
}