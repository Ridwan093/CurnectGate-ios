// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'biometric_device.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BiometricDeviceImpl _$$BiometricDeviceImplFromJson(
        Map<String, dynamic> json) =>
    _$BiometricDeviceImpl(
      token: json['token'] as String?,
      lastUsed: json['last_used'] as String?,
      deviceInfo: json['device_info'] as Map<String, dynamic>?,
      registeredAt: json['registered_at'] as String?,
    );

Map<String, dynamic> _$$BiometricDeviceImplToJson(
        _$BiometricDeviceImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'last_used': instance.lastUsed,
      'device_info': instance.deviceInfo,
      'registered_at': instance.registeredAt,
    };
