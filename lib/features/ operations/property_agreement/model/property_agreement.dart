import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'property_agreement.freezed.dart';
part 'property_agreement.g.dart';

@freezed
class PropertyAgreement with _$PropertyAgreement {
  @JsonSerializable(explicitToJson: true)
  const factory PropertyAgreement({
    bool? required,
    String? content,
    int? version,
    bool? requiresSignature,
    bool? accepted,
    String? signedAt,
    int? acceptedVersion,
    String? signature,
    bool? needsUpdate,
  }) = _PropertyAgreement;

  factory PropertyAgreement.fromJson(Map<String, dynamic> json) =>
      _$PropertyAgreementFromJson(json);

  factory PropertyAgreement.safeFromJson(Map<String, dynamic>? json) {
    return PropertyAgreement(
      required: NullSafetyHelper.safeBool(json?['required']),
      content: NullSafetyHelper.safeString(json?['content']),
      version: NullSafetyHelper.safeInt(json?['version']),
      requiresSignature: NullSafetyHelper.safeBool(json?['requires_signature']),
      accepted: NullSafetyHelper.safeBool(json?['accepted']),
      signedAt: NullSafetyHelper.safeString(json?['signed_at']),
      acceptedVersion: NullSafetyHelper.safeInt(json?['accepted_version']),
      signature: NullSafetyHelper.safeString(json?['signature']),
      needsUpdate: NullSafetyHelper.safeBool(json?['needs_update']),
    );
  }
}
