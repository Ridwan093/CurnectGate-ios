// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstateImpl _$$EstateImplFromJson(Map<String, dynamic> json) => _$EstateImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      code: json['code'] as String?,
      description: json['description'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$EstateImplToJson(_$EstateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'description': instance.description,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
