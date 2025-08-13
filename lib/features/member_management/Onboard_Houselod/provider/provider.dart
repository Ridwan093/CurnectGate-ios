import 'dart:developer';

import 'package:curnectgate/features/member_management/Onboard_Houselod/model/permision_slug_model/conditions_model.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/permision_slug_model/time_restriction_model.dart';
import 'package:curnectgate/features/member_management/Onboard_Houselod/model/stateModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Riverpod state for curfew settings
final notificationProviders =
    StateNotifierProvider<CurfewNotifier, CurfewState>((ref) {
      return CurfewNotifier();
    });

class CurfewNotifier extends StateNotifier<CurfewState> {
  CurfewNotifier() : super(CurfewState());

  void toggleCurfew(bool value) {
    state = state.copyWith(isCurfewEnabled: value);
  }

  void toggleVisitorInvitation(bool value) {
    state = state.copyWith(enableVisitorInvitation: value);
  }

  void togglePackingaccess(bool value) {
    state = state.copyWith(ispackingEnabled: value);
  }

  void toggleNightaccess(bool value) {
    state = state.copyWith(isNightEnable: value);
  }

  void toggleRequiresApproval(bool value) {
    state = state.copyWith(requiresApproval: value);
  }

  void togglemoderated(bool value) {
    state = state.copyWith(moderated: value);
  }

  void togglecommunityforum(bool value) {
    state = state.copyWith(isCommunityEnabel: value);
  }

  void updateMaxpost(int value) {
    state = state.copyWith(totalPost: value);
  }

  void updateMaxcomment(int value) {
    state = state.copyWith(totalComment: value);
  }

  void updateMaxVisitors(int value) {
    state = state.copyWith(maxVisitorsPerDay: value);
  }

  void updateVisitorReason(String value) {
    state = state.copyWith(visitorReason: value);
  }

  void updateOtherReason(String value) {
    state = state.copyWith(otherReason: value);
  }

  void updateID(String value) {
    state = state.copyWith(id: value);
  }

  void toggleRepeatDay(String day) {
    final newRepeatDays = List<String>.from(state.repeatDays);
    if (newRepeatDays.contains(day)) {
      newRepeatDays.remove(day);
    } else {
      newRepeatDays.add(day);
    }
    state = state.copyWith(repeatDays: newRepeatDays);
  }

  void updateStartTime(String day, TimeOfDay time) {
    final newStartTimes = Map<String, TimeOfDay?>.from(state.startTimes);
    newStartTimes[day] = time;
    state = state.copyWith(startTimes: newStartTimes);
  }

  void updateEndTime(String day, TimeOfDay time) {
    final newEndTimes = Map<String, TimeOfDay?>.from(state.endTimes);
    newEndTimes[day] = time;
    state = state.copyWith(endTimes: newEndTimes);
  }

  // In your notificationProviders notifier
  void updateFacilityAccess({required bool isActive, Conditions? conditions}) {
    state = state.copyWith(
      isFacilityEnabled: isActive,
      facilityConditions: conditions ?? state.facilityConditions,
    );
  }

  void updateGateAccess({required bool isActive, Conditions? conditions}) {
    state = state.copyWith(
      isGateEnabled: isActive,
      gateConditions: conditions ?? state.gateConditions,
    );
  }

  void updateFacilityReason(String value) {
    log(value);
    state = state.copyWith(facilityReason: value);
  }

  void updateGateReason(String value) {
    log(value);
    state = state.copyWith(gateReason: value);
  }

  void updateFacilityConditions({
    List<String>? facilities,
    Map<String, TimeRestriction>? timeRestrictions,
  }) {
    log(facilities!.first.toString());
    state = state.copyWith(
      facilityConditions: (state.facilityConditions ?? Conditions()).copyWith(
        facilities: facilities,
        timeRestrictions:
            timeRestrictions ?? state.facilityConditions?.timeRestrictions,
      ),
    );
  }

  void resetForm() {
    state = state.copyWith(
      gateReason: "",
      facilityReason: "",
      visitorReason: "",
      maxVisitorsPerDay: 0,
      otherReason: "",
      totalComment: 0,
      totalPost: 0,
    );
  }

  void updateGateConditions({
    String? expireday,
    Map<String, TimeRestriction>? timeRestrictions,
  }) {
    state = state.copyWith(
      expiredDay: expireday,
      facilityConditions: (state.facilityConditions ?? Conditions()).copyWith(
        timeRestrictions:
            timeRestrictions ?? state.facilityConditions?.timeRestrictions,
      ),
    );
  }

  void updateGateTimeRestriction({
    required String day,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
  }) {
    final updatedRestrictions = {
      ...(state.gateConditions?.timeRestrictions ?? {}),
    };

    updatedRestrictions[day] = TimeRestriction(
      startTime:
          '${startTime.hour}:${startTime.minute.toString().padLeft(2, '0')}',
      endTime: '${endTime.hour}:${endTime.minute.toString().padLeft(2, '0')}',
    );

    state = state.copyWith(
      gateConditions: (state.facilityConditions ?? Conditions()).copyWith(
        timeRestrictions: updatedRestrictions,
      ),
    );
  }

  // Update the time restriction method in CurfewNotifier
  void updateFacilityTimeRestriction({
    required String day,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
  }) {
    final updatedRestrictions = {
      ...(state.facilityConditions?.timeRestrictions ?? {}),
    };

    updatedRestrictions[day] = TimeRestriction(
      startTime:
          '${startTime.hour}:${startTime.minute.toString().padLeft(2, '0')}',
      endTime: '${endTime.hour}:${endTime.minute.toString().padLeft(2, '0')}',
    );

    state = state.copyWith(
      facilityConditions: (state.facilityConditions ?? Conditions()).copyWith(
        timeRestrictions: updatedRestrictions,
      ),
    );
  }

  Future<void> saveFacilitySettings() async {
    try {
      // Convert conditions to the format your API expects

      // await _repository.updateFacilityPermission(
      //   isActive: state.isFacilityEnabled,
      //   facilities: conditions?.facilities,
      //   timeRestrictions: conditions?.timeRestrictions?.map(
      //     (key, value) => MapEntry(key, {
      //       'start_time': '${value.startTime?.hour}:${value.startTime?.minute}',
      //       'end_time': '${value.endTime?.hour}:${value.endTime?.minute}',
      //     }),
      //   ),
      // );
    } catch (e) {
      // Handle error appropriately
      rethrow;
    }
  }

  void toggleFacility(String facility) {
    final current = List<String>.from(state.facilities ?? []);

    if (current.contains(facility)) {
      current.remove(facility);
    } else {
      current.add(facility);
    }

    state = state.copyWith(facilities: current);
  }
}
