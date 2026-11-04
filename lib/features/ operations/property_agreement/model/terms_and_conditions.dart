import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'terms_and_conditions.freezed.dart';
part 'terms_and_conditions.g.dart';

@freezed
class TermsAndConditions with _$TermsAndConditions {
  @JsonSerializable(explicitToJson: true)
  const factory TermsAndConditions({
    bool? required,
    String? content,
    int? version,
    bool? accepted,
    String? acceptedAt,
    int? acceptedVersion,
    bool? needsUpdate,
  }) = _TermsAndConditions;

  factory TermsAndConditions.fromJson(Map<String, dynamic> json) =>
      _$TermsAndConditionsFromJson(json);

  factory TermsAndConditions.safeFromJson(Map<String, dynamic>? json) {
    return TermsAndConditions(
      required: NullSafetyHelper.safeBool(json?['required']),
      content: NullSafetyHelper.safeString(json?['content']),
      version: NullSafetyHelper.safeInt(json?['version']),
      accepted: NullSafetyHelper.safeBool(json?['accepted']),
      acceptedAt: NullSafetyHelper.safeString(json?['accepted_at']),
      acceptedVersion:
          NullSafetyHelper.safeInt(json?['accepted_version']),
      needsUpdate: NullSafetyHelper.safeBool(json?['needs_update']),
    );
  }
}
