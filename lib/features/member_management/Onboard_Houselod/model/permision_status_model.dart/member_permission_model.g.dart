// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_permission_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MemberPermissionImpl _$$MemberPermissionImplFromJson(
        Map<String, dynamic> json) =>
    _$MemberPermissionImpl(
      permission: json['permission'] == null
          ? null
          : PermissionInfo.fromJson(json['permission'] as Map<String, dynamic>),
      status: json['status'] == null
          ? null
          : PermissionStatus.fromJson(json['status'] as Map<String, dynamic>),
      grantDetails: json['grant_details'] == null
          ? null
          : GrantDetails.fromJson(
              json['grant_details'] as Map<String, dynamic>),
      effectiveStatus: json['effective_status'] as String?,
    );

Map<String, dynamic> _$$MemberPermissionImplToJson(
        _$MemberPermissionImpl instance) =>
    <String, dynamic>{
      'permission': instance.permission,
      'status': instance.status,
      'grant_details': instance.grantDetails,
      'effective_status': instance.effectiveStatus,
    };
