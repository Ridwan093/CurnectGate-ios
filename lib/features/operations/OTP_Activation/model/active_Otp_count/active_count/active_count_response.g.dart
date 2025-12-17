// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_count_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActiveCountResponseImpl _$$ActiveCountResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ActiveCountResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : ActiveCountData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ActiveCountResponseImplToJson(
        _$ActiveCountResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
