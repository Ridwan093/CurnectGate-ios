// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permit_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermitItemImpl _$$PermitItemImplFromJson(Map<String, dynamic> json) =>
    _$PermitItemImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      estimatedValue: json['estimated_value'],
    );

Map<String, dynamic> _$$PermitItemImplToJson(_$PermitItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'estimated_value': instance.estimatedValue,
    };
