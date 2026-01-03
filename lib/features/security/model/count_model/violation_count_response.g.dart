// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViolationCountResponseImpl _$$ViolationCountResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ViolationCountResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : ViolationCountData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ViolationCountResponseImplToJson(
        _$ViolationCountResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
