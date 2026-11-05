// lib/features/member_management/profile_form/validators/password_validator.dart
class PasswordValidator {
  static const int minLength = 9;

  static PasswordValidationResult validate(String password) {
    return PasswordValidationResult(
      hasMinLength: password.length >= minLength,
      hasNumber: password.contains(RegExp(r'[0-9]')),
      // The server requires both upper and lower case letters.
      hasMixedCase:
          password.contains(RegExp(r'[a-z]')) &&
          password.contains(RegExp(r'[A-Z]')),
      hasSpecialChar: password.contains(RegExp(r'[^A-Za-z0-9\s]')),
    );
  }
}

class PasswordValidationResult {
  final bool hasMinLength;
  final bool hasNumber;
  final bool hasSpecialChar;
  final bool hasMixedCase;

  bool get isValid =>
      hasMinLength && hasNumber && hasSpecialChar && hasMixedCase;

  PasswordValidationResult({
    required this.hasMinLength,
    required this.hasNumber,
    required this.hasSpecialChar,
    required this.hasMixedCase,
  });
}