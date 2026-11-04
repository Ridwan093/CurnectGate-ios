class SecurityStateModel {
  final bool oTpCodevalid;
  final bool accessTypevalid;
  final bool locationGatevalid;
  final bool reasonvalid;
  final bool securityNotedvalid;
  final bool vendorPhoneValid;
  final bool numberValid;
  final bool isLoading;
  final bool requiredEscort;
  final String? oTpCodeError;
  final String phoneError;
  final String? accessTypeError;
  final String? locationGateError;
  final String? reasonError;
  final String? securityNotedError;
  final String? accessType;
  final String? otpCode;
  final String? locationAccess;
  final String? reason;
  final String? securityNoted;
  final String? selectedValidationType;
  final String? phone;
  final String? numberOfGusest;
  const SecurityStateModel({
    this.requiredEscort = false,
    this.accessTypevalid = false,
    this.locationGatevalid = false,
    this.reasonvalid = false,
    this.securityNotedvalid = false,
    this.isLoading = false,
    this.oTpCodevalid = false,
    this.vendorPhoneValid = false,
    this.numberValid = false,
    this.reasonError = "",
    this.securityNotedError = "",
    this.phoneError = "",
    this.phone = "",
    this.oTpCodeError,
    this.accessTypeError = '',
    this.locationGateError = "",
    this.accessType = "",
    this.locationAccess = "",
    this.otpCode = "",
    this.selectedValidationType = '',
    this.reason = '',
    this.securityNoted = "",
    this.numberOfGusest = "",
  });
  bool get vendorCodeValid => vendorPhoneValid && oTpCodevalid;

  bool get workersValid => oTpCodevalid;
  bool get allValid => oTpCodevalid && accessTypevalid && locationGatevalid;
  bool get validateMain => accessTypevalid && locationGatevalid;
  bool get denyValid => reasonvalid && securityNotedvalid;
  bool get resonaValid => reasonvalid;
  bool get otpallValid => oTpCodevalid && accessTypevalid;
  bool get numberOfVisitorValid => numberValid;

  SecurityStateModel copyWith({
    String? accessTypeError,
    String? accessType,
    String? otpCode,
    String? locationAccess,
    String? locationGateError,
    String? securityNotedError,
    String? reasonError,
    bool? securityNotedvalid,
    bool? reasonvalid,
    bool? oTpCodevalid,
    bool? isLoading,
    bool? accessTypevalid,
    bool? locationGatevalid,
    bool? requiredEscort,
    bool? vendorPhoneValid,
    bool? numberValid,
    String? oTpCodeError,
    String? numberOfGusest,

    String? selectedValidationType,
    String? reason,
    String? securityNoted,
    String? phone,

    String? phoneError,
  }) {
    return SecurityStateModel(
      numberOfGusest: numberOfGusest ?? this.numberOfGusest,
      numberValid: numberValid ?? this.numberValid,
      vendorPhoneValid: vendorPhoneValid ?? this.vendorPhoneValid,
      phone: phone ?? this.phone,
      phoneError: phoneError ?? this.phoneError,
      requiredEscort: requiredEscort ?? this.requiredEscort,
      securityNoted: securityNoted ?? this.securityNoted,
      securityNotedError: securityNotedError ?? this.securityNotedError,
      securityNotedvalid: securityNotedvalid ?? this.securityNotedvalid,
      reasonError: reasonError ?? this.reasonError,
      reasonvalid: reasonvalid ?? this.reasonvalid,
      reason: reason ?? this.reason,
      selectedValidationType:
          selectedValidationType ?? this.selectedValidationType,
      accessTypeError: accessTypeError ?? this.accessTypeError,
      accessType: accessType ?? this.accessType,
      otpCode: otpCode ?? this.otpCode,
      locationAccess: locationAccess ?? this.locationAccess,
      locationGateError: locationGateError ?? this.locationGateError,
      accessTypevalid: accessTypevalid ?? this.accessTypevalid,
      locationGatevalid: locationGatevalid ?? this.locationGatevalid,
      oTpCodeError: oTpCodeError ?? this.oTpCodeError,
      oTpCodevalid: oTpCodevalid ?? this.oTpCodevalid,

      isLoading: isLoading ?? this.isLoading,
    );
  }
}
