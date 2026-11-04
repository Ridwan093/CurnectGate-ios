// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_duty.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyDutyImpl _$$MyDutyImplFromJson(Map<String, dynamic> json) => _$MyDutyImpl(
      dutyStatus: json['duty_status'] as String?,
      shift: json['shift'],
      lastCheckIn: json['last_check_in'] as String?,
      lastCheckOut: json['last_check_out'] as String?,
      accessToPortal: json['access_to_portal'] as bool?,
      securityShift: json['security_shift'],
      securityRole: json['security_role'],
      securityPost: json['security_post'],
    );

Map<String, dynamic> _$$MyDutyImplToJson(_$MyDutyImpl instance) =>
    <String, dynamic>{
      'duty_status': instance.dutyStatus,
      'shift': instance.shift,
      'last_check_in': instance.lastCheckIn,
      'last_check_out': instance.lastCheckOut,
      'access_to_portal': instance.accessToPortal,
      'security_shift': instance.securityShift,
      'security_role': instance.securityRole,
      'security_post': instance.securityPost,
    };
