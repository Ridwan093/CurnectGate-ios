// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_otp_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActiveOtpDataImpl _$$ActiveOtpDataImplFromJson(Map<String, dynamic> json) =>
    _$ActiveOtpDataImpl(
      otps: (json['otps'] as List<dynamic>?)
          ?.map((e) => ActiveOtpItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ActiveOtpDataImplToJson(_$ActiveOtpDataImpl instance) =>
    <String, dynamic>{
      'otps': instance.otps?.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };
