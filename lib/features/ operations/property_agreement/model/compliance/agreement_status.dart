import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'agreement_detail.dart';

part 'agreement_status.freezed.dart';
part 'agreement_status.g.dart';

@freezed
class AgreementStatus with _$AgreementStatus {
  @JsonSerializable(explicitToJson: true)
  const factory AgreementStatus({
    AgreementDetail? termsAndConditions,
    AgreementDetail? propertyAgreement,
    bool? needsAction,
  }) = _AgreementStatus;

  factory AgreementStatus.fromJson(Map<String, dynamic> json) =>
      _$AgreementStatusFromJson(json);

  factory AgreementStatus.safeFromJson(Map<String, dynamic>? json) {
    return AgreementStatus(
      termsAndConditions:
          AgreementDetail.safeFromJson(json?['terms_and_conditions']),
      propertyAgreement:
          AgreementDetail.safeFromJson(json?['property_agreement']),
      needsAction: NullSafetyHelper.safeBool(json?['needs_action']),
    );
  }
}
