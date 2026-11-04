class WorkOrderFormState {
  // Form fields
  static const _noValue = Object();

  final String vendorName;
  final String vendorEmail;
  final String phoneNumber;
  final String? workType;
  final String workDescription;
  final int workerCount;
  final int daysCount;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? selectedTimeWindow;
  final int id;

  // Validation states
  final bool vendorNameValid;
  final bool vendorEmailValid;
  final bool phoneValid;
  final bool workTypeValid;
  final bool workDescriptionValid;
  final bool startDateValid;
  final bool endDateValid;
  final bool timeWindowValid;

  // Error messages
  final String? vendorNameError;
  final String? vendorEmailError;
  final String? phoneError;
  final String? workDescriptionError;
  final String? startDateError;
  final String? endDateError;

  // UI states
  final bool isIncrementPressed;
  final bool isDecrementPressed;
  final bool isIncrementPressedday;
  final bool isDecrementPressedday;
  final bool isLoading;

  WorkOrderFormState({
    this.vendorName = '',
    this.vendorEmail = '',
    this.phoneNumber = '',
    this.workType = '',
    this.workDescription = '',
    this.workerCount = 1,
    this.daysCount = 1,
    this.id = 0,
    this.startDate = null,
    this.endDate = null,
    this.selectedTimeWindow,

    // Validation defaults to false
    this.vendorNameValid = false,
    this.vendorEmailValid = false,
    this.phoneValid = false,
    this.workTypeValid = false,
    this.workDescriptionValid = false,
    this.startDateValid = false,
    this.endDateValid = false,
    this.timeWindowValid = false,

    // Error messages
    this.vendorNameError,
    this.vendorEmailError,
    this.phoneError,
    this.workDescriptionError,
    this.startDateError,
    this.endDateError,

    // UI states
    this.isIncrementPressed = false,
    this.isDecrementPressed = false,
    this.isIncrementPressedday = false,
    this.isDecrementPressedday = false,
    this.isLoading = false,
  });

  bool get allValid =>
      vendorNameValid &&
      vendorEmailValid &&
      phoneValid &&
      workTypeValid &&
      workDescriptionValid &&
      startDateValid &&
      endDateValid &&
      timeWindowValid;

  WorkOrderFormState copyWith({
    // Form fields
    String? vendorName,
    String? vendorEmail,
    String? phoneNumber,
    String? workType,
    String? workDescription,
    int? workerCount,
    int? daysCount,
    int? id,
    Object? startDate = _noValue,
    Object? endDate = _noValue,
    String? selectedTimeWindow,

    // Validation states
    bool? vendorNameValid,
    bool? vendorEmailValid,
    bool? phoneValid,
    bool? workTypeValid,
    bool? workDescriptionValid,
    bool? startDateValid,
    bool? endDateValid,
    bool? timeWindowValid,

    // Error messages
    String? vendorNameError,
    String? vendorEmailError,
    String? phoneError,
    String? workDescriptionError,
    String? startDateError,
    String? endDateError,

    // UI states
    bool? isIncrementPressed,
    bool? isDecrementPressed,
    bool? isIncrementPressedday,
    bool? isDecrementPressedday,
    bool? isLoading,
  }) {
    return WorkOrderFormState(
      id: id ?? this.id,
      vendorName: vendorName ?? this.vendorName,
      vendorEmail: vendorEmail ?? this.vendorEmail,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      workType: workType ?? this.workType,
      workDescription: workDescription ?? this.workDescription,
      workerCount: workerCount ?? this.workerCount,
      daysCount: daysCount ?? this.daysCount,
      startDate:
          startDate == _noValue ? this.startDate : startDate as DateTime?,

      endDate: endDate == _noValue ? this.endDate : endDate as DateTime?,

      selectedTimeWindow: selectedTimeWindow ?? this.selectedTimeWindow,

      // Validation
      vendorNameValid: vendorNameValid ?? this.vendorNameValid,
      vendorEmailValid: vendorEmailValid ?? this.vendorEmailValid,
      phoneValid: phoneValid ?? this.phoneValid,
      workTypeValid: workTypeValid ?? this.workTypeValid,
      workDescriptionValid: workDescriptionValid ?? this.workDescriptionValid,
      startDateValid: startDateValid ?? this.startDateValid,
      endDateValid: endDateValid ?? this.endDateValid,
      timeWindowValid: timeWindowValid ?? this.timeWindowValid,

      // Errors
      vendorNameError: vendorNameError ?? this.vendorNameError,
      vendorEmailError: vendorEmailError ?? this.vendorEmailError,
      phoneError: phoneError ?? this.phoneError,
      workDescriptionError: workDescriptionError ?? this.workDescriptionError,
      startDateError: startDateError ?? this.startDateError,
      endDateError: endDateError ?? this.endDateError,

      // UI states
      isIncrementPressed: isIncrementPressed ?? this.isIncrementPressed,
      isDecrementPressed: isDecrementPressed ?? this.isDecrementPressed,
      isIncrementPressedday:
          isIncrementPressedday ?? this.isIncrementPressedday,
      isDecrementPressedday:
          isDecrementPressedday ?? this.isDecrementPressedday,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
