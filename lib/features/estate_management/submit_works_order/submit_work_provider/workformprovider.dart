// Provider
import 'package:curnectgate/core/%20utils/emailvalidator.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/work_order_model.dart';


final workOrderFormProvider =
    StateNotifierProvider<WorkOrderFormNotifier, WorkOrderFormState>((ref) {
  return WorkOrderFormNotifier();
});

class WorkOrderFormNotifier extends StateNotifier<WorkOrderFormState> {
  WorkOrderFormNotifier() : super(WorkOrderFormState());

  // Update methods for each field
  void updateVendorName(String name) {
    state = state.copyWith(
      vendorName: name,
      vendorNameValid: name.isNotEmpty,
      vendorNameError: name.isEmpty ? 'Vendor name is required' : null,
    );
  }

  void updateVendorEmail(String email) {
    final isValid = EmailValidator.validateEmail(email);
    state = state.copyWith(
      vendorEmail: email,
      vendorEmailValid: isValid,
      vendorEmailError: isValid ? null : 'Enter a valid email',
    );
  }

  void updatePhoneNumber(String phone) {
    final isValid = phone.length >= 10; // Basic validation
    state = state.copyWith(
      phoneNumber: phone,
      phoneValid: isValid,
      phoneError: isValid ? null : 'Enter a valid phone number',
    );
  }

  void updateWorkType(String? type) {
    state = state.copyWith(
      workType: type,
      workTypeValid: type != null && type.isNotEmpty,
    );
  }

  void updateWorkDescription(String description) {
    state = state.copyWith(
      workDescription: description,
      workDescriptionValid: description.isNotEmpty,
      workDescriptionError: description.isEmpty ? 'Description is required' : null,
    );
  }

  void updateStartDate(DateTime? date) {
    state = state.copyWith(
      startDate: date,
      startDateValid: date != null,
      startDateError: date == null ? 'Select a start date' : null,
    );
  }

  void updateEndDate(DateTime? date) {
    state = state.copyWith(
      endDate: date,
      endDateValid: date != null,
      endDateError: date == null ? 'Select an end date' : null,
    );
  }

  void updateTimeWindow(String? window) {
    state = state.copyWith(
      selectedTimeWindow: window,
      timeWindowValid: window != null && window.isNotEmpty,
    );
  }
    void setIncrementPresse(bool pressed) {
    state = state.copyWith(isIncrementPressed: pressed);
  }

  void setDecrementPressed(bool pressed) {
    state = state.copyWith(isDecrementPressed: pressed);
  }

  void setIncrementPresseday(bool pressed) {
    state = state.copyWith(isIncrementPressedday: pressed);
  }

  void setDecrementPressedday(bool pressed) {
    state = state.copyWith(isDecrementPressedday: pressed);
  }


  // Worker count methods
  void incrementWorkers() {
    state = state.copyWith(workerCount: state.workerCount + 1);
  }

  void decrementWorkers() {
    if (state.workerCount > 1) {
      state = state.copyWith(workerCount: state.workerCount - 1);
    }
  }

  // Days count methods
  void incrementDays() {
    state = state.copyWith(daysCount: state.daysCount + 1);
  }

  void decrementDays() {
    if (state.daysCount > 1) {
      state = state.copyWith(daysCount: state.daysCount - 1);
    }
  }

  // Loading state
  void setLoading(bool isLoading) {
    state = state.copyWith(isLoading: isLoading);
  }
}
