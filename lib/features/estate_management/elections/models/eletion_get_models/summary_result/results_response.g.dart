// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultsResponseImpl _$$ResultsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ResultsResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : ResultsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResultsResponseImplToJson(
        _$ResultsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
