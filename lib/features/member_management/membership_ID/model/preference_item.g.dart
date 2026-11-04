// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preference_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PreferenceItemImpl _$$PreferenceItemImplFromJson(Map<String, dynamic> json) =>
    _$PreferenceItemImpl(
      key: json['key'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      value: json['value'],
      options: (json['options'] as List<dynamic>?)
              ?.map((e) =>
                  PreferenceItemOption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$PreferenceItemImplToJson(
        _$PreferenceItemImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'type': instance.type,
      'value': instance.value,
      'options': instance.options?.map((e) => e.toJson()).toList(),
      'description': instance.description,
    };
