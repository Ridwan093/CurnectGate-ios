// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agreements_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgreementsContainerImpl _$$AgreementsContainerImplFromJson(
        Map<String, dynamic> json) =>
    _$AgreementsContainerImpl(
      termsAndConditions: json['termsAndConditions'] == null
          ? null
          : TermsAndConditions.fromJson(
              json['termsAndConditions'] as Map<String, dynamic>),
      propertyAgreement: json['propertyAgreement'] == null
          ? null
          : PropertyAgreement.fromJson(
              json['propertyAgreement'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AgreementsContainerImplToJson(
        _$AgreementsContainerImpl instance) =>
    <String, dynamic>{
      'termsAndConditions': instance.termsAndConditions?.toJson(),
      'propertyAgreement': instance.propertyAgreement?.toJson(),
    };
