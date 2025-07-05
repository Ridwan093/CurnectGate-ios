class FormStates {
  final bool firstNameValid;
  final bool lastNameValid;
  final bool emailValid;
  final bool phoneValid;

  final bool isLoading;
  final String? firstNameError;
  final String? lastNameError;
  final String? emailError;
  final String? phoneError;
  final String? pass;
  final String? gender;
  final bool agreedToTerms;

  const FormStates({
    this.pass = '',

    this.agreedToTerms = false,
    this.firstNameValid = false,
    this.lastNameValid = false,
    this.emailValid = false,
    this.phoneValid = false,
    this.isLoading = false,
    this.firstNameError,
    this.lastNameError,
    this.emailError,
    this.phoneError,
    this.gender,
  });

  bool get allValid =>
      firstNameValid &&
      lastNameValid &&
      emailValid &&
      phoneValid &&
      gender?.isNotEmpty == true &&
      agreedToTerms;

  FormStates copyWith({
    bool? agreedToTerms,
    bool? firstNameValid,
    bool? lastNameValid,
    bool? emailValid,
    bool? phoneValid,
    bool? isLoading,
    String? firstNameError,
    String? lastNameError,
    String? emailError,
    String? phoneError,
    String? gender,
    String? pass,
  }) {
    return FormStates(
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
    );
  }
}
