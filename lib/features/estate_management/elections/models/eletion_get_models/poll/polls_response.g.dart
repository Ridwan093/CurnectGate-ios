// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polls_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PollsResponseImpl _$$PollsResponseImplFromJson(Map<String, dynamic> json) =>
    _$PollsResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : PollsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PollsResponseImplToJson(_$PollsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
