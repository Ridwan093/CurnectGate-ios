// reminder_notifier.dart
import 'dart:developer';

import 'package:curnectgate/features/security/model/state.dart';
// reminder_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reminderProvider = StateNotifierProvider<ReminderNotifier, ReminderState>(
  (ref) => ReminderNotifier(),
);

class ReminderNotifier extends StateNotifier<ReminderState> {
  ReminderNotifier() : super(ReminderState());

  // Update individual fields
  void updateTitle(String title) {
    state = state.copyWith(title: title);
  }

  void updateDescription(String dec) {
    state = state.copyWith(dec: dec);
  }

  void updateCategory(String category) {
    state = state.copyWith(category: category);
  }

  void updateRemberType(String remberType) {
    state = state.copyWith(remberType: remberType);
  }

  void updateTime(String time) {
    log(time);
    state = state.copyWith(time: time);
  }

  void updateFrequence(String frequence) {
    state = state.copyWith(frequence: frequence);
  }

  void updatePiority(String piority) {
    state = state.copyWith(piority: piority);
  }

  void updateIsSharedWithHousehold(bool isSharedWithHousehold) {
    state = state.copyWith(isSharedWithHousehold: isSharedWithHousehold);
  }

  void updateNotificationType(String interver) {
    state = state.copyWith(interva: interver);
  }

  void updateNotificationMethod(String value) {
    state = state.copyWith(notificationmethod: value);
  }

  // Loading state
  void updateLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }

  void updateSeletedFilter(String value) {
    state = state.copyWith(filter: value);
  }

  // Error handling
  // void updateError(String? error) {
  //   state = state.copyWith(error: error);
  // }

  // Reset all fields to initial state
  void resetAll() {
    state = state.copyWith(
      id: "",
      title: "",
      dec: "",
      category: "",
      remberType: "",
      time: "",
      frequence: "",
      piority: "",
      isSharedWithHousehold: false,
      interva: "",
      notificationmethod: "",
      isLoading: false,
      filter: ""
    );
  }
}
