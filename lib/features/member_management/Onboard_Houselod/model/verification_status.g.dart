// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VerificationStatusImpl _$$VerificationStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationStatusImpl(
      emailVerified: json['email_verified'] as bool?,
      phoneVerified: json['phone_verified'] as bool?,
      identityVerified: json['identity_verified'] as bool?,
      digitalIdActive: json['digital_id_active'] as bool?,
      backgroundCheckStatus: json['background_check_status'] as String?,
    );

Map<String, dynamic> _$$VerificationStatusImplToJson(
        _$VerificationStatusImpl instance) =>
    <String, dynamic>{
      'email_verified': instance.emailVerified,
      'phone_verified': instance.phoneVerified,
      'identity_verified': instance.identityVerified,
      'digital_id_active': instance.digitalIdActive,
      'background_check_status': instance.backgroundCheckStatus,
    };
