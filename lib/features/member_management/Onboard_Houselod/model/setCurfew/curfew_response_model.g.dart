// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curfew_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurfewResponseImpl _$$CurfewResponseImplFromJson(Map<String, dynamic> json) =>
    _$CurfewResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : CurfewData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CurfewResponseImplToJson(
        _$CurfewResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
