// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstateImpl _$$EstateImplFromJson(Map<String, dynamic> json) => _$EstateImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      description: json['description'] as String? ?? '',
      type: json['type'] as String? ?? '',
      code: json['code'] as String? ?? '',
      logoUrl: json['logo_url'] as String? ?? '',
      color: json['color'] as String? ?? '',
      backgroundImage: json['backgroundImage'] as String? ?? '',
      createdAt: NullSafetyHelper.safeDateTime(json['created_at']),
      updatedAt: NullSafetyHelper.safeDateTime(json['updated_at']),
    );

Map<String, dynamic> _$$EstateImplToJson(_$EstateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'type': instance.type,
      'code': instance.code,
      'logo_url': instance.logoUrl,
      'color': instance.color,
      'backgroundImage': instance.backgroundImage,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
