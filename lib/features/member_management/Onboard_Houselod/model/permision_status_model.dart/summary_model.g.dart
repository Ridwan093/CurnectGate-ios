// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryImpl _$$SummaryImplFromJson(Map<String, dynamic> json) =>
    _$SummaryImpl(
      totalPermissions: (json['total_permissions'] as num?)?.toInt(),
      grantedPermissions: (json['granted_permissions'] as num?)?.toInt(),
      activePermissions: (json['active_permissions'] as num?)?.toInt(),
      expiredPermissions: (json['expired_permissions'] as num?)?.toInt(),
      conditionalPermissions:
          (json['conditional_permissions'] as num?)?.toInt(),
      roleBasedPermissions: (json['role_based_permissions'] as num?)?.toInt(),
      explicitPermissions: (json['explicit_permissions'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SummaryImplToJson(_$SummaryImpl instance) =>
    <String, dynamic>{
      'total_permissions': instance.totalPermissions,
      'granted_permissions': instance.grantedPermissions,
      'active_permissions': instance.activePermissions,
      'expired_permissions': instance.expiredPermissions,
      'conditional_permissions': instance.conditionalPermissions,
      'role_based_permissions': instance.roleBasedPermissions,
      'explicit_permissions': instance.explicitPermissions,
    };
