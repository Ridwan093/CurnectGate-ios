// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_otp_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActiveOtpItemImpl _$$ActiveOtpItemImplFromJson(Map<String, dynamic> json) =>
    _$ActiveOtpItemImpl(
      otpId: (json['otp_id'] as num?)?.toInt(),
      otpCode: json['otp_code'] as String?,
      guestName: json['guest_name'] as String?,
      guestPhone: json['guest_phone'] as String?,
      purpose: json['purpose'] as String?,
      property: json['property'] as String?,
      propertyCode: json['property_code'] as String?,
      checkInTime: json['check_in_time'] as String?,
      status: json['status'] as String?,
      validUntil: json['valid_until'] as String?,
      hasPermit: json['has_permit'] as bool?,
    );

Map<String, dynamic> _$$ActiveOtpItemImplToJson(_$ActiveOtpItemImpl instance) =>
    <String, dynamic>{
      'otp_id': instance.otpId,
      'otp_code': instance.otpCode,
      'guest_name': instance.guestName,
      'guest_phone': instance.guestPhone,
      'purpose': instance.purpose,
      'property': instance.property,
      'property_code': instance.propertyCode,
      'check_in_time': instance.checkInTime,
      'status': instance.status,
      'valid_until': instance.validUntil,
      'has_permit': instance.hasPermit,
    };
