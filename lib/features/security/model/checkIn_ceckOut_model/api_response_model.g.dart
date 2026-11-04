// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseModelImpl _$$ApiResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ApiResponseModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : DataPayload.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ApiResponseModelImplToJson(
        _$ApiResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
