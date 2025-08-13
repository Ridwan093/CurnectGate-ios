// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'household_members_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HouseholdMembersResponseImpl _$$HouseholdMembersResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$HouseholdMembersResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : HouseholdData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$HouseholdMembersResponseImplToJson(
        _$HouseholdMembersResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
