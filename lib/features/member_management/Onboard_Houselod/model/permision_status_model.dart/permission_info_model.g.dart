// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionInfoImpl _$$PermissionInfoImplFromJson(Map<String, dynamic> json) =>
    _$PermissionInfoImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$PermissionInfoImplToJson(
        _$PermissionInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'category': instance.category,
    };
