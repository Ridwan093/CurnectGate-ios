class PasswordFormState {
  final String current;
  final String newPassword;
  final String confirm;
  final bool isValid;

  PasswordFormState({
    required this.current,
    required this.newPassword,
    required this.confirm,
    required this.isValid,
  });

  PasswordFormState copyWith({
    String? current,
    String? newPassword,
    String? confirm,
    bool? isValid,
  }) {
    return PasswordFormState(
      current: current ?? this.current,
      newPassword: newPassword ?? this.newPassword,
      confirm: confirm ?? this.confirm,
      isValid: isValid ?? this.isValid,
    );
  }

  factory PasswordFormState.initial() => PasswordFormState(
    current: '',
    newPassword: '',
    confirm: '',
    isValid: false,
  );
}
