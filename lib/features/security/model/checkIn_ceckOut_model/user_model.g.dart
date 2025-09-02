// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: (json['id'] as num?)?.toInt(),
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      memberCode: json['member_code'] as String?,
      mediaUrl: json['media_url'] as String?,
      mediaKey: json['media_key'] as String?,
      estateCode: json['estate_code'] as String?,
      estateName: json['estate_name'] as String?,
      estateId: (json['estate_id'] as num?)?.toInt(),
      dob: json['dob'] as String?,
      status: json['status'] as String?,
      address: json['address'] as String?,
      gender: json['gender'] as String?,
      digitalIdCode: json['digital_id_code'] as String?,
      digitalQrCode: json['digital_qr_code'] as String?,
      digitalIdStatus: json['digital_id_status'] as bool?,
      signature: json['signature'] as String?,
      deedOfAgreementSign: json['deed_of_agreement_sign'] as bool?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      verificationCodeExpiresAt:
          json['verification_code_expires_at'] as String?,
      isServiceProvider: json['is_service_provider'] as bool?,
      passwordChangeRequired: json['password_change_required'] as bool?,
      role: json['role'] as String?,
      preferredNotification: json['preferred_notification'] as String?,
      agreeToTerms: json['agree_to_terms'] as bool?,
      settings: json['settings'] as Map<String, dynamic>?,
      curfewSettings: json['curfew_settings'] as Map<String, dynamic>?,
      lastLoginAt: json['last_login_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'phone': instance.phone,
      'member_code': instance.memberCode,
      'media_url': instance.mediaUrl,
      'media_key': instance.mediaKey,
      'estate_code': instance.estateCode,
      'estate_name': instance.estateName,
      'estate_id': instance.estateId,
      'dob': instance.dob,
      'status': instance.status,
      'address': instance.address,
      'gender': instance.gender,
      'digital_id_code': instance.digitalIdCode,
      'digital_qr_code': instance.digitalQrCode,
      'digital_id_status': instance.digitalIdStatus,
      'signature': instance.signature,
      'deed_of_agreement_sign': instance.deedOfAgreementSign,
      'email_verified_at': instance.emailVerifiedAt,
      'verification_code_expires_at': instance.verificationCodeExpiresAt,
      'is_service_provider': instance.isServiceProvider,
      'password_change_required': instance.passwordChangeRequired,
      'role': instance.role,
      'preferred_notification': instance.preferredNotification,
      'agree_to_terms': instance.agreeToTerms,
      'settings': instance.settings,
      'curfew_settings': instance.curfewSettings,
      'last_login_at': instance.lastLoginAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
