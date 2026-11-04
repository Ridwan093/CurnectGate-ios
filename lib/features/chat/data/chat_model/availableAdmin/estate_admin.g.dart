// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate_admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstateAdminImpl _$$EstateAdminImplFromJson(Map<String, dynamic> json) =>
    _$EstateAdminImpl(
      id: (json['id'] as num?)?.toInt(),
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      fullName: json['full_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      role: json['role'] as String?,
      roleBadge: json['role_badge'] as String?,
      onlineStatus: json['online_status'] as String?,
    );

Map<String, dynamic> _$$EstateAdminImplToJson(_$EstateAdminImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'role': instance.role,
      'role_badge': instance.roleBadge,
      'online_status': instance.onlineStatus,
    };
