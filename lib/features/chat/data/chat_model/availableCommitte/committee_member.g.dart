// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'committee_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommitteeMemberImpl _$$CommitteeMemberImplFromJson(
        Map<String, dynamic> json) =>
    _$CommitteeMemberImpl(
      id: (json['id'] as num?)?.toInt(),
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      fullName: json['full_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      role: json['role'] as String?,
      roleBadge: json['role_badge'] as String?,
      committeeName: json['committee_name'] as String?,
      committeeRole: json['committee_role'] as String?,
      position: json['position'] as String?,
      onlineStatus: json['online_status'] as String?,
    );

Map<String, dynamic> _$$CommitteeMemberImplToJson(
        _$CommitteeMemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'role': instance.role,
      'role_badge': instance.roleBadge,
      'committee_name': instance.committeeName,
      'committee_role': instance.committeeRole,
      'position': instance.position,
      'online_status': instance.onlineStatus,
    };
