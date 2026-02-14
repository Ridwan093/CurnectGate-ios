import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'agreement_detail.freezed.dart';
part 'agreement_detail.g.dart';

@freezed
class AgreementDetail with _$AgreementDetail {
  @JsonSerializable(explicitToJson: true)
  const factory AgreementDetail({
    bool? required,
    bool? accepted,
    int? version,
    String? acceptedAt,
    String? acceptedVersion,
    String? signature,
  }) = _AgreementDetail;

  factory AgreementDetail.fromJson(Map<String, dynamic> json) =>
      _$AgreementDetailFromJson(json);

  factory AgreementDetail.safeFromJson(Map<String, dynamic>? json) {
    return AgreementDetail(
      required: NullSafetyHelper.safeBool(json?['required']),
      accepted: NullSafetyHelper.safeBool(json?['accepted']),
      version: NullSafetyHelper.safeInt(json?['version']),
      acceptedAt: NullSafetyHelper.safeString(json?['accepted_at']),
      acceptedVersion: NullSafetyHelper.safeString(json?['accepted_version']),
      signature: NullSafetyHelper.safeString(json?['signature']),
    );
  }
}
