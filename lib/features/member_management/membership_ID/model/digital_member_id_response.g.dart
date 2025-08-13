// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_member_id_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DigitalMemberIdResponseImpl _$$DigitalMemberIdResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$DigitalMemberIdResponseImpl(
      status: json['status'] as bool,
      message: json['message'] as String,
      code: (json['code'] as num).toInt(),
      data: DigitalMemberIdData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DigitalMemberIdResponseImplToJson(
        _$DigitalMemberIdResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
