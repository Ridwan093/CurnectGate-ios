// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrivacyItemImpl _$$PrivacyItemImplFromJson(Map<String, dynamic> json) =>
    _$PrivacyItemImpl(
      key: json['key'] as String?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      value: json['value'],
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$PrivacyItemImplToJson(_$PrivacyItemImpl instance) =>
    <String, dynamic>{
      'key': instance.key,
      'name': instance.name,
      'type': instance.type,
      'value': instance.value,
      'description': instance.description,
    };
