// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActiveOtpModelImpl _$$ActiveOtpModelImplFromJson(Map<String, dynamic> json) =>
    _$ActiveOtpModelImpl(
      visitorName: json['visitorName'] as String? ?? '',
      visitType: json['visitType'] as String? ?? '',
      endDay: NullSafetyHelper.safeDateTime(json['endDay']),
      endTime: NullSafetyHelper.safeDateTime(json['endtime']),
    );

Map<String, dynamic> _$$ActiveOtpModelImplToJson(
        _$ActiveOtpModelImpl instance) =>
    <String, dynamic>{
      'visitorName': instance.visitorName,
      'visitType': instance.visitType,
      'endDay': instance.endDay.toIso8601String(),
      'endtime': instance.endTime.toIso8601String(),
    };
