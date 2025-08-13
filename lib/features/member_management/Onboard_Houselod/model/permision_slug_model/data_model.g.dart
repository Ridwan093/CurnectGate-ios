// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionsDataImpl _$$PermissionsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PermissionsDataImpl(
      member: json['member'] == null
          ? null
          : Member.fromJson(json['member'] as Map<String, dynamic>),
      permissions: (json['permissions'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, Permission.fromJson(e as Map<String, dynamic>)),
      ),
      summary: json['summary'] == null
          ? null
          : Summary.fromJson(json['summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PermissionsDataImplToJson(
        _$PermissionsDataImpl instance) =>
    <String, dynamic>{
      'member': instance.member,
      'permissions': instance.permissions,
      'summary': instance.summary,
    };
