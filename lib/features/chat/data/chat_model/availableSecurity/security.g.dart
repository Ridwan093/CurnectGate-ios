// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SecurityPersonnelImpl _$$SecurityPersonnelImplFromJson(
        Map<String, dynamic> json) =>
    _$SecurityPersonnelImpl(
      id: (json['id'] as num?)?.toInt(),
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      fullName: json['full_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      role: json['role'] as String?,
      roleBadge: json['role_badge'] as String?,
      post: json['post'] as String?,
      shiftStatus: json['shift_status'] as String?,
      onlineStatus: json['online_status'] as String?,
    );

Map<String, dynamic> _$$SecurityPersonnelImplToJson(
        _$SecurityPersonnelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'role': instance.role,
      'role_badge': instance.roleBadge,
      'post': instance.post,
      'shift_status': instance.shiftStatus,
      'online_status': instance.onlineStatus,
    };
