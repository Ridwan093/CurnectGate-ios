// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrivacySettingImpl _$$PrivacySettingImplFromJson(Map<String, dynamic> json) =>
    _$PrivacySettingImpl(
      key: json['key'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      value: json['value'] as bool?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$PrivacySettingImplToJson(
        _$PrivacySettingImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'type': instance.type,
      'value': instance.value,
      'description': instance.description,
    };
