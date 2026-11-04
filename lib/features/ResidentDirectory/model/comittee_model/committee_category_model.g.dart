// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'committee_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommitteeCategoryImpl _$$CommitteeCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$CommitteeCategoryImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      estateId: (json['estate_id'] as num?)?.toInt(),
      description: json['description'] as String?,
      colorCode: json['color_code'] as String?,
      isActive: json['is_active'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$CommitteeCategoryImplToJson(
        _$CommitteeCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'estate_id': instance.estateId,
      'description': instance.description,
      'color_code': instance.colorCode,
      'is_active': instance.isActive,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
