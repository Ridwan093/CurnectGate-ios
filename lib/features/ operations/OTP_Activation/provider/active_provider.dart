import 'dart:developer';

import 'package:curnectgate/features/%20operations/OTP_Activation/model/generate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final generateNotifierProvider =
    StateNotifierProvider<ReportNotifier, GenerateState>((ref) {
      return ReportNotifier();
    });

class ReportNotifier extends StateNotifier<GenerateState> {
  ReportNotifier() : super(GenerateState(isLoading: false));

  void setPurpose(String purpose) {
    state = state.copyWith(purposeofVisit: purpose);
  }

  void setSelectedDate(DateTime date) {
    state = state.copyWith(selectedDate: date);
    _updateValidity();
  }

  void setSelectedTime(TimeOfDay time) {
    state = state.copyWith(selectedTime: time);

    _updateValidity();
  }

  void setValidityMinute(int minutes) {
    state = state.copyWith(validityMinutes: minutes);
    _updateValidity();
  }

  void _updateValidity() {
    // This forces a rebuild of any widgets watching the state
    state = state.copyWith();
  }

  void setPeriod(String period) {
    state = state.copyWith(visitperiod: period);
  }

  void setVisitorName(String visitorName) {
    state = state.copyWith(vistorName: visitorName);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  Future<void> submit() async {
    setLoading(true);
    try {
      var name = state.vistorName;
      var purposeofVisit = state.purposeofVisit;
      var validatorperiod = state.visitperiod;
      var date = state.selectedDate;
      var time = state.selectedTime;
      var minut = state.validityMinutes;

      var generatedList = GenerateState(
        validityMinutes: minut,
        vistorName: name,
        purposeofVisit: purposeofVisit,
        visitperiod: validatorperiod,
        selectedDate: date,
        selectedTime: time,
      );
     final updatedList = [...state.generatedList, generatedList];

state = state.copyWith(generatedList: updatedList); 

      log("Name: $name, Purpose:$purposeofVisit, Time: $validatorperiod");
      await Future.delayed(const Duration(seconds: 2));

      // Reset after submission
      // state = GenerateState(isLoading: false);
    } catch (e) {
      rethrow;
    } finally {
      setLoading(false);
    }
  }
}
