import 'package:curnectgate/core/style/colors.dart';
import 'package:flutter/material.dart';

class ProgressIndicators extends StatelessWidget {
  final int currentStep;
  final int totalSteps;
  final double height;
  final double borderRadius;

  const ProgressIndicators({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.height = 6.0,
    this.borderRadius = 2.0,
  });

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.instance;
    final progressPercentage = currentStep / totalSteps;
    const fixedWidth = 80.0; // Fixed width as requested

    return SizedBox(
      width: fixedWidth,
      child: Stack(
        children: [
          // Background track
          Container(
            height: height,
            width: fixedWidth,
            decoration: BoxDecoration(
              color: colors.grey400,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
          ),
          
          // Progress fill
          Container(
            height: height,
            width: fixedWidth * progressPercentage,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(borderRadius),
              color: _getProgressColor(colors, progressPercentage),
            ),
          ),
          
          // Current step indicator dot
          if (progressPercentage > 0)
            Positioned(
              left: fixedWidth * progressPercentage - 4, // Centered dot
              child: Container(
                width: 6,
                height: height * 2, // Slightly taller dot
                decoration: BoxDecoration(
                  color: colors.yellow500,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: colors.yellow600.withOpacity(0.3),
                      blurRadius: 2,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Color _getProgressColor(AppColors colors, double progress) {
    return Color.lerp(
      colors.yellow400,
      colors.yellow500,
      progress,
    )!;
  }
}