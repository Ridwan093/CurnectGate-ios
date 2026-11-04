// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryImpl _$$SummaryImplFromJson(Map<String, dynamic> json) =>
    _$SummaryImpl(
      totalPermissions: (json['total_permissions'] as num?)?.toInt(),
      rolePermissions: (json['role_permissions'] as num?)?.toInt(),
      explicitPermissions: (json['explicit_permissions'] as num?)?.toInt(),
      activePermissions: (json['active_permissions'] as num?)?.toInt(),
      deniedPermissions: (json['denied_permissions'] as num?)?.toInt(),
      expiredPermissions: (json['expired_permissions'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SummaryImplToJson(_$SummaryImpl instance) =>
    <String, dynamic>{
      'total_permissions': instance.totalPermissions,
      'role_permissions': instance.rolePermissions,
      'explicit_permissions': instance.explicitPermissions,
      'active_permissions': instance.activePermissions,
      'denied_permissions': instance.deniedPermissions,
      'expired_permissions': instance.expiredPermissions,
    };
