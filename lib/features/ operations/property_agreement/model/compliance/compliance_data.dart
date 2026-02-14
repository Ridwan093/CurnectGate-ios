import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'agreement_status.dart';

part 'compliance_data.freezed.dart';
part 'compliance_data.g.dart';

@freezed
class ComplianceData with _$ComplianceData {
  @JsonSerializable(explicitToJson: true)
  const factory ComplianceData({
    bool? isCompliant,
    List<String>? requiredActions,
    AgreementStatus? agreementStatus,
    bool? canAccessFeatures,
  }) = _ComplianceData;

  factory ComplianceData.fromJson(Map<String, dynamic> json) =>
      _$ComplianceDataFromJson(json);

  factory ComplianceData.safeFromJson(Map<String, dynamic>? json) {
    return ComplianceData(
      isCompliant: NullSafetyHelper.safeBool(json?['is_compliant']),
      requiredActions:
          (json?['required_actions'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList(),
      agreementStatus:
          AgreementStatus.safeFromJson(json?['agreement_status']),
      canAccessFeatures: NullSafetyHelper.safeBool(json?['can_access_features']),
    );
  }
}
