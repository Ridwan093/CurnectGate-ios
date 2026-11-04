// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_visibility.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileVisibilityImpl _$$ProfileVisibilityImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileVisibilityImpl(
      name: json['name'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      key: json['key'] as String?,
      value: json['value'] as bool?,
    );

Map<String, dynamic> _$$ProfileVisibilityImplToJson(
        _$ProfileVisibilityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'key': instance.key,
      'value': instance.value,
    };
