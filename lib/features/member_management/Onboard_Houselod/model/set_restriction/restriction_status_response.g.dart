// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restriction_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestrictionStatusResponseImpl _$$RestrictionStatusResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$RestrictionStatusResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : RestrictionStatusData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RestrictionStatusResponseImplToJson(
        _$RestrictionStatusResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
