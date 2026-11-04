// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preference_setting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreferenceSettingImpl _$$PreferenceSettingImplFromJson(
        Map<String, dynamic> json) =>
    _$PreferenceSettingImpl(
      key: json['key'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      value: json['value'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$PreferenceSettingImplToJson(
        _$PreferenceSettingImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'type': instance.type,
      'value': instance.value,
      'options': instance.options,
      'description': instance.description,
    };
