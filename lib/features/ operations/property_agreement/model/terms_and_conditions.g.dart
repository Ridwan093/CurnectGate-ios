// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_and_conditions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TermsAndConditionsImpl _$$TermsAndConditionsImplFromJson(
        Map<String, dynamic> json) =>
    _$TermsAndConditionsImpl(
      required: json['required'] as bool?,
      content: json['content'] as String?,
      version: (json['version'] as num?)?.toInt(),
      accepted: json['accepted'] as bool?,
      acceptedAt: json['acceptedAt'] as String?,
      acceptedVersion: (json['acceptedVersion'] as num?)?.toInt(),
      needsUpdate: json['needsUpdate'] as bool?,
    );

Map<String, dynamic> _$$TermsAndConditionsImplToJson(
        _$TermsAndConditionsImpl instance) =>
    <String, dynamic>{
      'required': instance.required,
      'content': instance.content,
      'version': instance.version,
      'accepted': instance.accepted,
      'acceptedAt': instance.acceptedAt,
      'acceptedVersion': instance.acceptedVersion,
      'needsUpdate': instance.needsUpdate,
    };
