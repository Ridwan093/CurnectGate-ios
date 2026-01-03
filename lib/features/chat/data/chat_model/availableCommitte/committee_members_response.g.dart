// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'committee_members_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommitteeMembersResponseImpl _$$CommitteeMembersResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CommitteeMembersResponseImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : CommitteeMembersData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommitteeMembersResponseImplToJson(
        _$CommitteeMembersResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };
