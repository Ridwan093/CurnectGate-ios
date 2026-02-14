// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agreement_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgreementStatusImpl _$$AgreementStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$AgreementStatusImpl(
      termsAndConditions: json['termsAndConditions'] == null
          ? null
          : AgreementDetail.fromJson(
              json['termsAndConditions'] as Map<String, dynamic>),
      propertyAgreement: json['propertyAgreement'] == null
          ? null
          : AgreementDetail.fromJson(
              json['propertyAgreement'] as Map<String, dynamic>),
      needsAction: json['needsAction'] as bool?,
    );

Map<String, dynamic> _$$AgreementStatusImplToJson(
        _$AgreementStatusImpl instance) =>
    <String, dynamic>{
      'termsAndConditions': instance.termsAndConditions?.toJson(),
      'propertyAgreement': instance.propertyAgreement?.toJson(),
      'needsAction': instance.needsAction,
    };
