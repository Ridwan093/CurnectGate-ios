// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_agreement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertyAgreementImpl _$$PropertyAgreementImplFromJson(
        Map<String, dynamic> json) =>
    _$PropertyAgreementImpl(
      required: json['required'] as bool?,
      content: json['content'] as String?,
      version: (json['version'] as num?)?.toInt(),
      requiresSignature: json['requiresSignature'] as bool?,
      accepted: json['accepted'] as bool?,
      signedAt: json['signedAt'] as String?,
      acceptedVersion: (json['acceptedVersion'] as num?)?.toInt(),
      signature: json['signature'] as String?,
      needsUpdate: json['needsUpdate'] as bool?,
    );

Map<String, dynamic> _$$PropertyAgreementImplToJson(
        _$PropertyAgreementImpl instance) =>
    <String, dynamic>{
      'required': instance.required,
      'content': instance.content,
      'version': instance.version,
      'requiresSignature': instance.requiresSignature,
      'accepted': instance.accepted,
      'signedAt': instance.signedAt,
      'acceptedVersion': instance.acceptedVersion,
      'signature': instance.signature,
      'needsUpdate': instance.needsUpdate,
    };
