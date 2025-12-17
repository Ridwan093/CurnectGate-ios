// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voting_settings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VotingSettingsResponseImpl _$$VotingSettingsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$VotingSettingsResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : VotingSettingsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VotingSettingsResponseImplToJson(
        _$VotingSettingsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
