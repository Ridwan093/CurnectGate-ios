import 'package:curnectgate/core/style/fontStyle.dart';
import 'package:curnectgate/features/security/model/duty_model/duty_text_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'duty_data.dart';

class DutyUiMapper {
  static DutyTextUiState mapCurrentDuty(DutyData? data) {
    /// ⭐ no data
    if (data == null || data.myDuty == null) {
      return DutyTextUiState(
        label: "Duty",
        dutyTime: "Unavailable",
        dutyColor: Colors.grey,
        dutyWeight: FontFamilies.medium,
        isOnDuty: false,
      );
    }

    final myDuty = data.myDuty!;

    /// ⭐ OFF DUTY
    if (myDuty.dutyStatus != "on_duty") {
      return const DutyTextUiState(
        label: "Currently: ",
        dutyTime: "Off Duty",
        dutyColor: Colors.red,
        dutyWeight: FontWeight.w600,
        isOnDuty: false,
      );
    }

    /// ⭐ SHIFT FROM BACKEND (using securityShift)
    if (myDuty.securityShift != null) {
      final start = _formatTime(myDuty.securityShift['start_time']);
      final end = _formatTime(myDuty.securityShift['end_time']);

      return DutyTextUiState(
        label: "Currently on duty: ",
        dutyTime: "$start - $end",
        dutyColor: Colors.green,
        dutyWeight: FontWeight.w700,
        isOnDuty: true,
      );
    }

    /// ⭐ fallback
    final shift = data.todayShifts?.firstOrNull;

    if (shift != null) {
      final start = _formatTime(shift.startTime);
      final end = _formatTime(shift.endTime);

      return DutyTextUiState(
        label: "Currently on duty: ",
        dutyTime: "$start - $end",
        dutyColor: Colors.green,
        dutyWeight: FontWeight.w700,
        isOnDuty: true,
      );
    }

    return const DutyTextUiState(
      label: "Duty:",
      dutyTime: " Unknown",
      dutyColor: Colors.grey,
      dutyWeight: FontWeight.w400,
      isOnDuty: false,
    );
  }

  static String _formatTime(String? time) {
    if (time == null || time.isEmpty) return "--";

    try {
      // Handle cases like "06:00:00" or "06:00"
      final parts = time.split(':');
      if (parts.length >= 2) {
        final hour = int.parse(parts[0]);
        final minute = int.parse(parts[1]);
        final dt = DateTime(2024, 1, 1, hour, minute);
        return DateFormat("hh:mm a").format(dt);
      }
      return time;
    } catch (e) {
      return time;
    }
  }
}
