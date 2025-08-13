// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preference_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreferenceImpl _$$PreferenceImplFromJson(Map<String, dynamic> json) =>
    _$PreferenceImpl(
      key: json['key'] as String? ?? '',
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      value: json['value'] as String? ?? '',
      description: json['description'] as String? ?? '',
      options: (json['options'] as List<dynamic>?)
              ?.map((e) => Option.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PreferenceImplToJson(_$PreferenceImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'type': instance.type,
      'value': instance.value,
      'description': instance.description,
      'options': instance.options,
    };
