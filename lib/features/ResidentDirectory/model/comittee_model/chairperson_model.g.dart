// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chairperson_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChairpersonImpl _$$ChairpersonImplFromJson(Map<String, dynamic> json) =>
    _$ChairpersonImpl(
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
      propertyAgreementSign: (json['property_agreement_sign'] as num?)?.toInt(),
      propertyAgreementSignedAt:
          json['property_agreement_signed_at'] as String?,
      propertyAgreementVersionAccepted:
          json['property_agreement_version_accepted'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      verificationCodeExpiresAt:
          json['verification_code_expires_at'] as String?,
      isServiceProvider: json['is_service_provider'] as bool?,
      passwordChangeRequired: json['password_change_required'] as bool?,
      google2faEnabled: json['google2fa_enabled'] as bool?,
      google2faBackupCodes: json['google2fa_backup_codes'] as String?,
      google2faEnabledAt: json['google2fa_enabled_at'] as String?,
      google2faLastUsed: json['google2fa_last_used'] as String?,
      role: json['role'] as String?,
      preferredNotification: json['preferred_notification'] as String?,
      forceChangePassword: (json['force_change_password'] as num?)?.toInt(),
      agreeToTerms: json['agree_to_terms'] as bool?,
      termsAcceptedAt: json['terms_accepted_at'] as String?,
      termsVersionAccepted: json['terms_version_accepted'] as String?,
      settings: json['settings'] == null
          ? null
          : ChairpersonSettings.fromJson(
              json['settings'] as Map<String, dynamic>),
      lastLoginAt: json['last_login_at'] == null
          ? null
          : DateTime.parse(json['last_login_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      biometricEnabled: json['biometric_enabled'] as bool?,
    );

Map<String, dynamic> _$$ChairpersonImplToJson(_$ChairpersonImpl instance) =>
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
      'property_agreement_sign': instance.propertyAgreementSign,
      'property_agreement_signed_at': instance.propertyAgreementSignedAt,
      'property_agreement_version_accepted':
          instance.propertyAgreementVersionAccepted,
      'email_verified_at': instance.emailVerifiedAt,
      'verification_code_expires_at': instance.verificationCodeExpiresAt,
      'is_service_provider': instance.isServiceProvider,
      'password_change_required': instance.passwordChangeRequired,
      'google2fa_enabled': instance.google2faEnabled,
      'google2fa_backup_codes': instance.google2faBackupCodes,
      'google2fa_enabled_at': instance.google2faEnabledAt,
      'google2fa_last_used': instance.google2faLastUsed,
      'role': instance.role,
      'preferred_notification': instance.preferredNotification,
      'force_change_password': instance.forceChangePassword,
      'agree_to_terms': instance.agreeToTerms,
      'terms_accepted_at': instance.termsAcceptedAt,
      'terms_version_accepted': instance.termsVersionAccepted,
      'settings': instance.settings?.toJson(),
      'last_login_at': instance.lastLoginAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'biometric_enabled': instance.biometricEnabled,
    };
