// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expired_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExpiredCountResponseImpl _$$ExpiredCountResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ExpiredCountResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : ExpiredCountData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ExpiredCountResponseImplToJson(
        _$ExpiredCountResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
