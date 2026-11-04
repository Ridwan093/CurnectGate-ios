// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_grant.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionGrantImpl _$$PermissionGrantImplFromJson(
        Map<String, dynamic> json) =>
    _$PermissionGrantImpl(
      id: (json['id'] as num?)?.toInt(),
      permission: json['permission'] == null
          ? null
          : Permission.fromJson(json['permission'] as Map<String, dynamic>),
      isGranted: json['is_granted'] as bool?,
      grantedBy: json['granted_by'] == null
          ? null
          : GrantedBy.fromJson(json['granted_by'] as Map<String, dynamic>),
      reason: json['reason'] as String?,
      conditions: json['conditions'],
      expiresAt: json['expires_at'] as String?,
      isExpired: json['is_expired'] as bool?,
      daysUntilExpiry: json['days_until_expiry'],
      grantedAt: json['granted_at'] as String?,
    );

Map<String, dynamic> _$$PermissionGrantImplToJson(
        _$PermissionGrantImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'permission': instance.permission?.toJson(),
      'is_granted': instance.isGranted,
      'granted_by': instance.grantedBy?.toJson(),
      'reason': instance.reason,
      'conditions': instance.conditions,
      'expires_at': instance.expiresAt,
      'is_expired': instance.isExpired,
      'days_until_expiry': instance.daysUntilExpiry,
      'granted_at': instance.grantedAt,
    };
