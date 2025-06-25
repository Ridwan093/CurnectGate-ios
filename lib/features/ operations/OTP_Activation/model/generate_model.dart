import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GenerateState {
  final String vistorName;
  final String purposeofVisit;
  final bool isLoading;
  final String visitperiod;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final int? validityMinutes; 
  final List<GenerateState> generatedList;// 30 or 90 minutes

  GenerateState({
    this.purposeofVisit = '',
    this.visitperiod = '',
    this.isLoading = false,
    this.vistorName = '',
    this.selectedDate,
    this.selectedTime,
    this.validityMinutes,
     this.generatedList = const [],
  });

  // Get formatted validity duration (e.g. "27 hours 30 minutes")
  String get formattedValidityDuration {
    if (validityMinutes == null) return "Not set";

    final hours = validityMinutes! ~/ 60;
    final minutes = validityMinutes! % 60;

    if (hours > 0 && minutes > 0) {
      return "$hours hours $minutes minutes";
    } else if (hours > 0) {
      return "$hours hours";
    } else {
      return "$minutes minutes";
    }
  }

  DateTime? get expiryDateTime {
    if (selectedDate == null ||
        selectedTime == null ||
        validityMinutes == null) {
      return null;
    }

    final startTime = DateTime(
      selectedDate!.year,
      selectedDate!.month,
      selectedDate!.day,
      selectedTime!.hour,
      selectedTime!.minute,
    );

    return startTime.add(Duration(minutes: validityMinutes!));
  }

  // Get complete validity message
  String get validityMessage {
    if (selectedDate == null ||
        selectedTime == null ||
        validityMinutes == null) {
      return "Please select date, time and validity duration";
    }

    final startTime = DateTime(
      selectedDate!.year,
      selectedDate!.month,
      selectedDate!.day,
      selectedTime!.hour,
      selectedTime!.minute,
    );

    final endTime = startTime.add(Duration(minutes: validityMinutes!));

    return "Valid for $formattedValidityDuration\n"
        "From: ${DateFormat('dd/MM/yyyy hh:mm a').format(startTime)}\n"
        "To: ${DateFormat('dd/MM/yyyy hh:mm a').format(endTime)}";
  }

  GenerateState copyWith({
    String? vistorName,
    String? purposeofVisit,
    bool? isLoading,
    String? visitperiod,
    DateTime? selectedDate,
    TimeOfDay? selectedTime,
    int? validityMinutes,
      List<GenerateState>? generatedList,
  }) {
    return GenerateState(
      visitperiod: visitperiod ?? this.visitperiod,
      vistorName: vistorName ?? this.vistorName,
      purposeofVisit: purposeofVisit ?? this.purposeofVisit,
      isLoading: isLoading ?? this.isLoading,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
      validityMinutes: validityMinutes ?? this.validityMinutes,
       generatedList: generatedList ?? this.generatedList,
    );
  }
}


