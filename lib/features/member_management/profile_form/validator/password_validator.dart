// lib/features/member_management/profile_form/validators/password_validator.dart
class PasswordValidator {
  static const int minLength = 9;

  static PasswordValidationResult validate(String password) {
    return PasswordValidationResult(
      hasMinLength: password.length >= minLength,
      hasNumber: password.contains(RegExp(r'[0-9]')),
      hasSpecialChar: password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
    );
  }
}

class PasswordValidationResult {
  final bool hasMinLength;
  final bool hasNumber;
  final bool hasSpecialChar;

  bool get isValid => hasMinLength && hasNumber && hasSpecialChar;

  PasswordValidationResult({
    required this.hasMinLength,
    required this.hasNumber,
    required this.hasSpecialChar,
  });
}