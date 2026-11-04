// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_results_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveResultsResponseImpl _$$LiveResultsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LiveResultsResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : LiveResultsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LiveResultsResponseImplToJson(
        _$LiveResultsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
