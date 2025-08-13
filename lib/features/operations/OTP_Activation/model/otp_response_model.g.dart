// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtpResponseModelImpl _$$OtpResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OtpResponseModelImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      code: (json['code'] as num?)?.toInt() ?? 0,
      data: json['data'] == null
          ? null
          : OtpData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OtpResponseModelImplToJson(
        _$OtpResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
