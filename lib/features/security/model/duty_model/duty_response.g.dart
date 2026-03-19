// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DutyResponseImpl _$$DutyResponseImplFromJson(Map<String, dynamic> json) =>
    _$DutyResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : DutyData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DutyResponseImplToJson(_$DutyResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
