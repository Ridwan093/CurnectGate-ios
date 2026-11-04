// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'committee_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommitteeMemberImpl _$$CommitteeMemberImplFromJson(
        Map<String, dynamic> json) =>
    _$CommitteeMemberImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      role: json['role'] as String?,
      roleDisplayName: json['role_display_name'] as String?,
      category: json['category'] == null
          ? null
          : CommitteeCategory.fromJson(
              json['category'] as Map<String, dynamic>),
      isLeadership: json['is_leadership'] as bool?,
    );

Map<String, dynamic> _$$CommitteeMemberImplToJson(
        _$CommitteeMemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'role': instance.role,
      'role_display_name': instance.roleDisplayName,
      'category': instance.category?.toJson(),
      'is_leadership': instance.isLeadership,
    };
