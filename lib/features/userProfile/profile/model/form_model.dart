class ProfileFormState {
  final bool firstNameValid;
  final bool lastNameValid;

  final bool newPassValid;
  final bool confirmPassValid;
  final bool currentPasswordValid;
  final bool reasonValid;

  final String reason;
  final String currentPassword;
  final String newPass;
  final String confirmPass;
  final String firstName;
  final String lastName;

  final String? firstNameError;
  final String? lastNameError;
  final String? reasonError;
  final String? passwordError;
  final String? newwpasswordError;
  final String? confirmpasswordError;

  const ProfileFormState({
    this.reasonValid = false,
    this.currentPasswordValid = false,
    this.reasonError,
    this.currentPassword = '',
    this.reason = '',
    this.newPass = '',
    this.confirmPass = '',
    this.firstName = '',
    this.lastName = '',
    this.firstNameValid = false,
    this.lastNameValid = false,
    this.confirmPassValid = false,
    this.newPassValid = false,
    this.firstNameError,
    this.lastNameError,
    this.passwordError,
    this.confirmpasswordError,
    this.newwpasswordError,
  });

  bool get allNewPassValid =>
      newPassValid && confirmPassValid && currentPasswordValid;

  bool get allNameValid => firstNameValid && lastNameValid;

  bool get allReasonValid => reasonValid && currentPasswordValid;

  ProfileFormState copyWith({
    bool? firstNameValid,
    bool? lastNameValid,
    bool? newPassValid,
    bool? confirmPassValid,
    bool? currentPasswordValid,
    bool? reasonValid,
    String? reason,
    String? currentPassword,
    String? newPass,
    String? confirmPass,
    String? firstName,
    String? lastName,
    String? firstNameError,
    String? lastNameError,
    String? reasonError,
    String? passwordError,
    String? newwpasswordError,
    String? confirmpasswordError,
  }) {
    return ProfileFormState(
      firstNameValid: firstNameValid ?? this.firstNameValid,
      lastNameValid: lastNameValid ?? this.lastNameValid,
      newPassValid: newPassValid ?? this.newPassValid,
      confirmPassValid: confirmPassValid ?? this.confirmPassValid,
      currentPasswordValid: currentPasswordValid ?? this.currentPasswordValid,
      reasonValid: reasonValid ?? this.reasonValid,
      reason: reason ?? this.reason,
      currentPassword: currentPassword ?? this.currentPassword,
      newPass: newPass ?? this.newPass,
      confirmPass: confirmPass ?? this.confirmPass,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      firstNameError: firstNameError ?? this.firstNameError,
      lastNameError: lastNameError ?? this.lastNameError,
      reasonError: reasonError ?? this.reasonError,
      passwordError: passwordError ?? this.passwordError,
      confirmpasswordError: confirmpasswordError ?? this.confirmpasswordError,
      newwpasswordError: newwpasswordError ?? this.newwpasswordError,
    );
  }
}
