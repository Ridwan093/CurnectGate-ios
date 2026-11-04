import 'package:flutter/material.dart';

class DutyTextUiState {
  final String label;
  final String dutyTime;
  final Color dutyColor;
  final FontWeight dutyWeight;
  final bool isOnDuty;

  const DutyTextUiState({
    required this.label,
    required this.dutyTime,
    required this.dutyColor,
    required this.dutyWeight,
    required this.isOnDuty,
  });
}
