// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertyResponseImpl _$$PropertyResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PropertyResponseImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      code: (json['code'] as num?)?.toInt() ?? 0,
      data: json['data'] == null
          ? null
          : PropertyData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PropertyResponseImplToJson(
        _$PropertyResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
