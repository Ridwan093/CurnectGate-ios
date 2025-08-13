// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViolationResponseImpl _$$ViolationResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ViolationResponseImpl(
      status: json['status'] as bool,
      message: json['message'] as String,
      code: (json['code'] as num).toInt(),
      data: ViolationData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ViolationResponseImplToJson(
        _$ViolationResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
