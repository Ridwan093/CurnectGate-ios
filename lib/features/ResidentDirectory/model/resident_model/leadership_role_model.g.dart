// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leadership_role_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LeadershipRoleImpl _$$LeadershipRoleImplFromJson(Map<String, dynamic> json) =>
    _$LeadershipRoleImpl(
      type: json['type'] as String?,
      title: json['title'] as String?,
      organization: json['organization'] as String?,
      category: json['category'] as String?,
      termNumber: (json['term_number'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LeadershipRoleImplToJson(
        _$LeadershipRoleImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'title': instance.title,
      'organization': instance.organization,
      'category': instance.category,
      'term_number': instance.termNumber,
    };
