// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PollHistoryResponseImpl _$$PollHistoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PollHistoryResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : PollHistoryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PollHistoryResponseImplToJson(
        _$PollHistoryResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
