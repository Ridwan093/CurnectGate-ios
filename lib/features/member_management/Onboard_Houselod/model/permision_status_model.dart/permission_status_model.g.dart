// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permission_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionStatusImpl _$$PermissionStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$PermissionStatusImpl(
      isGranted: json['is_granted'] as bool?,
      isActive: json['is_active'] as bool?,
      isExpired: json['is_expired'] as bool?,
      hasConditions: json['has_conditions'] as bool?,
      grantSource: json['grant_source'] as String?,
      roleGranted: json['role_granted'] as bool?,
    );

Map<String, dynamic> _$$PermissionStatusImplToJson(
        _$PermissionStatusImpl instance) =>
    <String, dynamic>{
      'is_granted': instance.isGranted,
      'is_active': instance.isActive,
      'is_expired': instance.isExpired,
      'has_conditions': instance.hasConditions,
      'grant_source': instance.grantSource,
      'role_granted': instance.roleGranted,
    };
