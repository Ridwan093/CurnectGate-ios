// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate_admin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstateAdminImpl _$$EstateAdminImplFromJson(Map<String, dynamic> json) =>
    _$EstateAdminImpl(
      id: (json['id'] as num?)?.toInt(),
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      fullName: json['full_name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      mediaUrl: json['media_url'] as String?,
      estateCode: json['estate_code'] as String?,
      estateName: json['estate_name'] as String?,
      estateId: (json['estate_id'] as num?)?.toInt(),
      dob: json['dob'] as String?,
      age: (json['age'] as num?)?.toInt(),
      status: json['status'] as String?,
      address: json['address'] as String?,
      gender: json['gender'] as String?,
      digitalIdStatus: json['digital_id_status'] as bool?,
      deedOfAgreementSign: json['deed_of_agreement_sign'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      isServiceProvider: json['is_service_provider'] as bool?,
      passwordChangeRequired: json['password_change_required'] as bool?,
      role: json['role'] as String?,
      preferredNotification: json['preferred_notification'] as String?,
      agreeToTerms: json['agree_to_terms'] as bool?,
      lastLoginAt: json['last_login_at'] as String?,
      profileImageUrl: json['profile_image_url'] as String?,
      curfewSettings: json['curfew_settings'] == null
          ? null
          : CurfewSettings.fromJson(
              json['curfew_settings'] as Map<String, dynamic>),
      hasCurfew: json['has_curfew'] as bool?,
      curfewStatus: json['curfew_status'] as String?,
      canAccessNow: json['can_access_now'] as bool?,
      householdRole: json['household_role'] as String?,
      isHouseholdMember: json['is_household_member'] as bool?,
      accessSummary: json['access_summary'] == null
          ? null
          : AccessSummary.fromJson(
              json['access_summary'] as Map<String, dynamic>),
      verificationStatus: json['verification_status'] == null
          ? null
          : VerificationStatus.fromJson(
              json['verification_status'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$EstateAdminImplToJson(_$EstateAdminImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'full_name': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'media_url': instance.mediaUrl,
      'estate_code': instance.estateCode,
      'estate_name': instance.estateName,
      'estate_id': instance.estateId,
      'dob': instance.dob,
      'age': instance.age,
      'status': instance.status,
      'address': instance.address,
      'gender': instance.gender,
      'digital_id_status': instance.digitalIdStatus,
      'deed_of_agreement_sign': instance.deedOfAgreementSign,
      'email_verified_at': instance.emailVerifiedAt,
      'is_service_provider': instance.isServiceProvider,
      'password_change_required': instance.passwordChangeRequired,
      'role': instance.role,
      'preferred_notification': instance.preferredNotification,
      'agree_to_terms': instance.agreeToTerms,
      'last_login_at': instance.lastLoginAt,
      'profile_image_url': instance.profileImageUrl,
      'curfew_settings': instance.curfewSettings?.toJson(),
      'has_curfew': instance.hasCurfew,
      'curfew_status': instance.curfewStatus,
      'can_access_now': instance.canAccessNow,
      'household_role': instance.householdRole,
      'is_household_member': instance.isHouseholdMember,
      'access_summary': instance.accessSummary?.toJson(),
      'verification_status': instance.verificationStatus?.toJson(),
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
