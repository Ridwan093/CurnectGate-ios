enum ValidationStatus { initial, loading, success, error }

class ValidationState {
  final ValidationStatus status;
  final String? errorMessage;
  final String? memberAddress;
  final String? memerHouseName;
  final String? lastName;
  final String? firstName;
  final String? estateCode;
  final String? digitalID;
  final String? role;
  final bool? terms;
  final bool? identityconfirmed;
  final String? userEmail;
  final String? userPhoneNumber;

  ValidationState({
    this.status = ValidationStatus.initial,
    this.role,
    this.terms = false,
    this.identityconfirmed = false,
     this.userPhoneNumber,
     this.userEmail,
    this.errorMessage,
    this.memberAddress,
    this.memerHouseName,
    this.firstName,
    this.lastName,
    this.estateCode,
    this.digitalID,
  });

  ValidationState copyWith({
    ValidationStatus? status,
    String? errorMessage,
    String? memberAddress,
    String? memberHouseName,
    String? firstName,
    String? lastName,
    String? estateCode,
    String? digitalID,
    String? role,
    String? userPhoneNumber,
    String?  userEmail,
    bool? terms,
    bool? identityConfirmed,
  }) {
    return ValidationState(
      userEmail: userEmail ?? this.userEmail,
      userPhoneNumber: userPhoneNumber ??this.userPhoneNumber,
      status: status ?? this.status,
      role: role ?? this.role,
      terms: terms ?? this.terms,
      identityconfirmed: identityConfirmed ?? identityconfirmed,
      digitalID: digitalID ?? this.digitalID,
      estateCode: estateCode ?? this.estateCode,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      errorMessage: errorMessage ?? this.errorMessage,
      memberAddress: memberAddress ?? this.memberAddress,
      memerHouseName: memberHouseName ?? memerHouseName,
    );
  }
}
