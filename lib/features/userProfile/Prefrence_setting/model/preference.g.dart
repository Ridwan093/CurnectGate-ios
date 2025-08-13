// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreferenceImpl _$$PreferenceImplFromJson(Map<String, dynamic> json) =>
    _$PreferenceImpl(
      name: json['name'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      key: json['key'] as String?,
      value: json['value'] as String?,
    );

Map<String, dynamic> _$$PreferenceImplToJson(_$PreferenceImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'options': instance.options,
      'key': instance.key,
      'value': instance.value,
    };
