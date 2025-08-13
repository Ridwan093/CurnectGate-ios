import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GenerateState {
  final String vistorName;
  final String purposeofVisit;
  final String? securitylevel;
  final String vehiclenumber;
  final String phoneNumber;
  final String? filter;
  final String? historyfilter;
  final String? visitperiod;
  final String? revorkActiveOTP;
  final bool? isOtpValide;
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final int? validityMinutes;
  final bool? otpCodeError;

  final List<GenerateState> generatedList; // 30 or 90 minutes

  GenerateState({
    this.historyfilter = "",
    this.purposeofVisit = '',
    this.visitperiod = '',
    this.revorkActiveOTP = "",
    this.isOtpValide = false,
    this.filter = "",
    this.vistorName = '',
    this.vehiclenumber = '',
    this.securitylevel = '',
    this.otpCodeError = false,
    this.phoneNumber = '',

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

  bool get genrateValidation =>
      vistorName.isNotEmpty &&
      purposeofVisit.isNotEmpty &&
      visitperiod!.isNotEmpty;
  bool get schedulValid =>
      vistorName.isNotEmpty &&
      purposeofVisit.isNotEmpty &&
      selectedDate.toString().isNotEmpty &&
      selectedTime.toString().isNotEmpty;
  bool get validrevorked => isOtpValide! && revorkActiveOTP!.length > 19;
  GenerateState copyWith({
    String? filter,
    String? vistorName,
    String? purposeofVisit,
    String? historyfilter,
    bool? isLoading,
    String? visitperiod,
    DateTime? selectedDate,
    TimeOfDay? selectedTime,
    int? validityMinutes,
    List<GenerateState>? generatedList,
    bool? otpCodeError,
    String? securitylevel,
    String? vehiclenumber,
    String? phoneNumber,
    bool? isInternal,
    String? revorkActiveOTP,
    bool? isOtpValide,
  }) {
    return GenerateState(
      revorkActiveOTP: revorkActiveOTP ?? this.revorkActiveOTP,
      isOtpValide: isOtpValide ?? this.isOtpValide,
      historyfilter: historyfilter ?? this.historyfilter,
      visitperiod: visitperiod ?? this.visitperiod,
      vistorName: vistorName ?? this.vistorName,
      purposeofVisit: purposeofVisit ?? this.purposeofVisit,
      filter: filter ?? this.filter,
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
      validityMinutes: validityMinutes ?? this.validityMinutes,
      generatedList: generatedList ?? this.generatedList,
      otpCodeError: otpCodeError ?? this.otpCodeError,
      vehiclenumber: vehiclenumber ?? this.vehiclenumber,
      phoneNumber: phoneNumber ?? this.phoneNumber,

      securitylevel: securitylevel ?? this.securitylevel,
    );
  }
}
