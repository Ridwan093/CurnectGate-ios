

import 'package:curnectgate/features/estate_management/submit_works_order/model/enum/status_num.dart';
import 'package:flutter/material.dart';

class ProgressLine extends StatelessWidget {
  final TaskStatus status;
  final double height;
  final Color backgroundColor;
  final Color progressColor;

  const ProgressLine({
    super.key,
    required this.status,
    this.height = 8,
    this.backgroundColor = const Color(0xFFE0E0E0),
   required this.progressColor,
  });

  double _getProgress() {
    switch (status) {
      case TaskStatus.start:
        return 0.3;
      case TaskStatus.inProgress:
        return 0.6; // You could make this dynamic if needed
      case TaskStatus.complete:
        return 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final progress = _getProgress();

    return LayoutBuilder(
      builder: (context, constraints) {
        final fullWidth = constraints.maxWidth;
        final progressWidth = fullWidth * progress;

        return Container(
          width: double.infinity,
          height: height,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(height / 2),
          ),
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: progressWidth,
                height: height,
                decoration: BoxDecoration(
                  color: progressColor,
                  borderRadius: BorderRadius.circular(height / 2),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
