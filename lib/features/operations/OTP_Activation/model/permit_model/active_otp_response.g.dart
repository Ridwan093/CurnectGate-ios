// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_otp_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActiveOtpResponseImpl _$$ActiveOtpResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ActiveOtpResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : ActiveOtpData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ActiveOtpResponseImplToJson(
        _$ActiveOtpResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
