// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate_admins_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstateAdminsDataImpl _$$EstateAdminsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$EstateAdminsDataImpl(
      admins: (json['admins'] as List<dynamic>?)
          ?.map((e) => EstateAdmin.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
      role: json['role'] as String?,
      roleBadge: json['role_badge'] as String?,
    );

Map<String, dynamic> _$$EstateAdminsDataImplToJson(
        _$EstateAdminsDataImpl instance) =>
    <String, dynamic>{
      'admins': instance.admins?.map((e) => e.toJson()).toList(),
      'count': instance.count,
      'role': instance.role,
      'role_badge': instance.roleBadge,
    };
