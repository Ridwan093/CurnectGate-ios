// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertyImpl _$$PropertyImplFromJson(Map<String, dynamic> json) =>
    _$PropertyImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      estateId: (json['estate_id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      code: json['code'] as String? ?? '',
      block: json['block'] as String? ?? '',
      street: json['street'] as String? ?? '',
      description: json['description'] as String? ?? '',
      createdAt: NullSafetyHelper.safeDateTime(json['created_at']),
      updatedAt: NullSafetyHelper.safeDateTime(json['updated_at']),
    );

Map<String, dynamic> _$$PropertyImplToJson(_$PropertyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'estate_id': instance.estateId,
      'name': instance.name,
      'type': instance.type,
      'code': instance.code,
      'block': instance.block,
      'street': instance.street,
      'description': instance.description,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
