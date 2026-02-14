// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatusHistoryResponseImpl _$$StatusHistoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$StatusHistoryResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : HistoryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StatusHistoryResponseImplToJson(
        _$StatusHistoryResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
