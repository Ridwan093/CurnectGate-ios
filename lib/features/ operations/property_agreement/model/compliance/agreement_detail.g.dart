// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agreement_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgreementDetailImpl _$$AgreementDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$AgreementDetailImpl(
      required: json['required'] as bool?,
      accepted: json['accepted'] as bool?,
      version: (json['version'] as num?)?.toInt(),
      acceptedAt: json['acceptedAt'] as String?,
      acceptedVersion: json['acceptedVersion'] as String?,
      signature: json['signature'] as String?,
    );

Map<String, dynamic> _$$AgreementDetailImplToJson(
        _$AgreementDetailImpl instance) =>
    <String, dynamic>{
      'required': instance.required,
      'accepted': instance.accepted,
      'version': instance.version,
      'acceptedAt': instance.acceptedAt,
      'acceptedVersion': instance.acceptedVersion,
      'signature': instance.signature,
    };
