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

    /// ⭐ SHIFT FROM BACKEND
    if (myDuty.shift != null) {
      final start = _formatTime(myDuty.shift['start_time']);
      final end = _formatTime(myDuty.shift['end_time']);

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

    final parsed = DateFormat("HH:mm").parse(time);
    return DateFormat("hh:mm a").format(parsed);
  }
}
