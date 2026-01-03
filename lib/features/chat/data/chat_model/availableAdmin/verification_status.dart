import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verification_status.freezed.dart';
part 'verification_status.g.dart';

@freezed
class VerificationStatus with _$VerificationStatus {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory VerificationStatus({
    bool? emailVerified,
    bool? phoneVerified,
    bool? identityVerified,
    bool? digitalIdActive,
    String? backgroundCheckStatus,
  }) = _VerificationStatus;

  factory VerificationStatus.fromJson(Map<String, dynamic> json) =>
      _$VerificationStatusFromJson(json);

  factory VerificationStatus.safeFromJson(Map<String, dynamic>? json) {
    return VerificationStatus(
      emailVerified: NullSafetyHelper.safeBool(json?['email_verified']),
      phoneVerified: NullSafetyHelper.safeBool(json?['phone_verified']),
      identityVerified: NullSafetyHelper.safeBool(json?['identity_verified']),
      digitalIdActive: NullSafetyHelper.safeBool(json?['digital_id_active']),
      backgroundCheckStatus: NullSafetyHelper.safeString(
        json?['background_check_status'],
      ),
    );
  }

  factory VerificationStatus.empty() => const VerificationStatus();
}
