// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compliance_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComplianceDataImpl _$$ComplianceDataImplFromJson(Map<String, dynamic> json) =>
    _$ComplianceDataImpl(
      isCompliant: json['isCompliant'] as bool?,
      requiredActions: (json['requiredActions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      agreementStatus: json['agreementStatus'] == null
          ? null
          : AgreementStatus.fromJson(
              json['agreementStatus'] as Map<String, dynamic>),
      canAccessFeatures: json['canAccessFeatures'] as bool?,
    );

Map<String, dynamic> _$$ComplianceDataImplToJson(
        _$ComplianceDataImpl instance) =>
    <String, dynamic>{
      'isCompliant': instance.isCompliant,
      'requiredActions': instance.requiredActions,
      'agreementStatus': instance.agreementStatus?.toJson(),
      'canAccessFeatures': instance.canAccessFeatures,
    };
