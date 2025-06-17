
enum ValidationStatus { initial, loading, success, error }

class ValidationState {
  final ValidationStatus status;
  final String? errorMessage;
  final String? memberAddress;

  ValidationState({
    this.status = ValidationStatus.initial,
    this.errorMessage,
    this.memberAddress,
  });

  ValidationState copyWith({
    ValidationStatus? status,
    String? errorMessage,
    String? memberAddress,
  }) {
    return ValidationState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      memberAddress: memberAddress ?? this.memberAddress,
    );
  }
}
