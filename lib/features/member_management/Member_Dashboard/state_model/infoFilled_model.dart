import 'dart:typed_data';

class FormStates {
  final bool firstNameValid;
  final bool lastNameValid;
  final bool emailValid;
  final bool phoneValid;
  final bool newpassValid;
  final bool confirmpassValid;

  final String otp;
  final bool isOtpComplete;
  final bool isLoading;
  final String? firstNameError;
  final String? lastNameError;
  final String? emailError;
  final String? phoneError;
  final String? pass;
  final String? oTpCode;
  final String? gender;
  final String createNewpass;
  final String confirmNewpass;
  final bool isResendOtpEnabled; // New: Tracks if resend button is enabled
  final int resendCountdownTime; // New: Tracks remaining seconds

  final bool agreedToTerms;
  final bool passValid;
  final Uint8List? profileImage; // Add this field
  final String? profileImagePath; // Optional: store file path
  final bool hasMinLength;
  final bool hasNumber;
  final bool hasSpecialChar;

  const FormStates({
    this.oTpCode = "",
    this.pass = '',
    this.otp = '',
    this.createNewpass = '',
    this.confirmNewpass = "",
    this.isResendOtpEnabled = true,
    this.resendCountdownTime = 30,
    this.isOtpComplete = false,
    this.passValid = false,
    this.agreedToTerms = false,
    this.firstNameValid = false,
    this.lastNameValid = false,
    this.emailValid = false,
    this.phoneValid = false,
    this.isLoading = false,
    this.hasMinLength = false,
    this.hasNumber = false,
    this.hasSpecialChar = false,
    this.confirmpassValid = false,
    this.newpassValid = false,
    this.firstNameError,
    this.lastNameError,
    this.emailError,
    this.phoneError,
    this.gender,
    this.profileImage,
    this.profileImagePath,
  });
  bool get allNewpassValid => newpassValid && confirmpassValid;
  bool get allValidAddmember =>
      firstNameValid &&
      lastNameValid &&
      emailValid &&
      phoneValid &&
      profileImage != null;

  bool get singinValid => emailValid && passValid && profileImage != null;
  bool get allValid =>
      firstNameValid &&
      lastNameValid &&
      emailValid &&
      phoneValid &&
      gender?.isNotEmpty == true &&
      agreedToTerms;

  FormStates copyWith({
    bool? passValid,
    bool? agreedToTerms,
    bool? firstNameValid,
    bool? lastNameValid,
    bool? emailValid,
    bool? phoneValid,
    bool? isLoading,
    bool? hasMinLength,
    bool? hasNumber,
    bool? hasSpecialChar,
    bool? isOtpComplete,
    bool? newpassValid,
    bool? confirmpassValid,
    String? createNewpass,
    String? confirmNewpass,
    String? otp,
    String? firstNameError,
    String? lastNameError,
    String? emailError,
    String? phoneError,
    String? gender,
    String? pass,
    String? oTpCode,
    Uint8List? profileImage,
    String? profileImagePath,

    bool? isResendOtpEnabled,
    int? resendCountdownTime,
  }) {
    return FormStates(
      otp: otp ?? this.otp,
      isOtpComplete: isOtpComplete ?? this.isOtpComplete,
      hasMinLength: hasMinLength ?? this.hasMinLength,
      hasNumber: hasNumber ?? this.hasNumber,
      hasSpecialChar: hasSpecialChar ?? this.hasSpecialChar,
      passValid: passValid ?? this.passValid,
      firstNameValid: firstNameValid ?? this.firstNameValid,
      lastNameValid: lastNameValid ?? this.lastNameValid,
      emailValid: emailValid ?? this.emailValid,
      phoneValid: phoneValid ?? this.phoneValid,
      isLoading: isLoading ?? this.isLoading,
      firstNameError: firstNameError ?? this.firstNameError,
      lastNameError: lastNameError ?? this.lastNameError,
      emailError: emailError ?? this.emailError,
      phoneError: phoneError ?? this.phoneError,
      agreedToTerms: agreedToTerms ?? this.agreedToTerms,
      gender: gender ?? this.gender,
      pass: pass ?? this.pass,
      oTpCode: oTpCode ?? this.oTpCode,
      confirmNewpass: confirmNewpass ?? this.confirmNewpass,
      createNewpass: createNewpass ?? this.confirmNewpass,
      profileImage: profileImage ?? this.profileImage,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      isResendOtpEnabled: isResendOtpEnabled ?? this.isResendOtpEnabled,
      resendCountdownTime: resendCountdownTime ?? this.resendCountdownTime,
      newpassValid: newpassValid ?? this.newpassValid,
      confirmpassValid: confirmpassValid ?? this.confirmpassValid,
    );
  }
}
