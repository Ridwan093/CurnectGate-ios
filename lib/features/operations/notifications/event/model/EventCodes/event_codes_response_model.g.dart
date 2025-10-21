// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_codes_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventCodesResponseImpl _$$EventCodesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EventCodesResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : EventCodesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EventCodesResponseImplToJson(
        _$EventCodesResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
