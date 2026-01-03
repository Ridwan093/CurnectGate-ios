import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'property_agreement.freezed.dart';
part 'property_agreement.g.dart';

@freezed
class PropertyAgreement with _$PropertyAgreement {
  @JsonSerializable(explicitToJson: true)
  const factory PropertyAgreement({
    bool? required,
    bool? accepted,
  }) = _PropertyAgreement;

  factory PropertyAgreement.fromJson(Map<String, dynamic> json) =>
      _$PropertyAgreementFromJson(json);

  factory PropertyAgreement.safeFromJson(Map<String, dynamic>? json) {
    return PropertyAgreement(
      required: NullSafetyHelper.safeBool(json?['required']),
      accepted: NullSafetyHelper.safeBool(json?['accepted']),
    );
  }
}
