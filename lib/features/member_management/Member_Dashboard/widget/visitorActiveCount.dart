import 'package:curnectgate/core/style/colors.dart';
import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:flutter/material.dart';

class Visitoractivecount extends StatelessWidget {
  final String title;
  final String count;

  const Visitoractivecount({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio:
            1.2, // Slightly wider than tall (adjust 1.1–1.4 for your taste)
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.instance.grey300,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 12,
                      color: AppColors.instance.black300,
                      fontWeight: FontFamilies.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    count,
                    style: TextStyle(
                      fontFamily: FontFamilies.interDisplay,
                      fontSize: 28,
                      color: AppColors.instance.black600,
                      fontWeight: FontFamilies.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
