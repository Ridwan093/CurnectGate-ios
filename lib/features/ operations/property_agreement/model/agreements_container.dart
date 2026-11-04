import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'property_agreement.dart';
import 'terms_and_conditions.dart';

part 'agreements_container.freezed.dart';
part 'agreements_container.g.dart';

@freezed
class AgreementsContainer with _$AgreementsContainer {
  @JsonSerializable(explicitToJson: true)
  const factory AgreementsContainer({
    TermsAndConditions? termsAndConditions,
    PropertyAgreement? propertyAgreement,
  }) = _AgreementsContainer;

  factory AgreementsContainer.fromJson(Map<String, dynamic> json) =>
      _$AgreementsContainerFromJson(json);

  factory AgreementsContainer.safeFromJson(Map<String, dynamic>? json) {
    return AgreementsContainer(
      termsAndConditions: NullSafetyHelper.safeModel(
        json?['terms_and_conditions'],
        TermsAndConditions.safeFromJson,
        null,
      ),
      propertyAgreement: NullSafetyHelper.safeModel(
        json?['property_agreement'],
        PropertyAgreement.safeFromJson,
        null,
      ),
    );
  }
}
