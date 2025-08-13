// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionImpl _$$PermissionImplFromJson(Map<String, dynamic> json) =>
    _$PermissionImpl(
      id: (json['id'] as num?)?.toInt(),
      slug: json['slug'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      source: json['source'] as String?,
      status: json['status'] as String?,
      isGranted: json['is_granted'] as bool?,
      isActive: json['is_active'] as bool?,
      isExpired: json['is_expired'] as bool?,
      conditions: json['conditions'] == null
          ? null
          : Conditions.fromJson(json['conditions'] as Map<String, dynamic>),
      expiresAt: json['expires_at'] as String?,
      grantedBy: json['granted_by'] == null
          ? null
          : GrantedBy.fromJson(json['granted_by'] as Map<String, dynamic>),
      reason: json['reason'] as String?,
      grantedAt: json['granted_at'] as String?,
    );

Map<String, dynamic> _$$PermissionImplToJson(_$PermissionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'slug': instance.slug,
      'name': instance.name,
      'description': instance.description,
      'source': instance.source,
      'status': instance.status,
      'is_granted': instance.isGranted,
      'is_active': instance.isActive,
      'is_expired': instance.isExpired,
      'conditions': instance.conditions,
      'expires_at': instance.expiresAt,
      'granted_by': instance.grantedBy,
      'reason': instance.reason,
      'granted_at': instance.grantedAt,
    };
