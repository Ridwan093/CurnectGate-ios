import 'package:freezed_annotation/freezed_annotation.dart';
import 'chairperson_settings.dart';

import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'chairperson_model.freezed.dart';
part 'chairperson_model.g.dart';

@freezed
class Chairperson with _$Chairperson {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Chairperson({
    int? id,
    String? firstname,
    String? lastname,
    String? email,
    String? phone,
    String? memberCode,
    String? mediaUrl,
    String? mediaKey,
    String? estateCode,
    String? estateName,
    int? estateId,
    String? dob,
    String? status,
    String? address,
    String? gender,
    String? digitalIdCode,
    String? digitalQrCode,
    bool? digitalIdStatus,
    String? signature,
    int? propertyAgreementSign,
    String? propertyAgreementSignedAt,
    String? propertyAgreementVersionAccepted,
    String? emailVerifiedAt,
    String? verificationCodeExpiresAt,
    bool? isServiceProvider,
    bool? passwordChangeRequired,
    bool? google2faEnabled,
    String? google2faBackupCodes,
    String? google2faEnabledAt,
    String? google2faLastUsed,
    String? role,
    String? preferredNotification,
    int? forceChangePassword,
    bool? agreeToTerms,
    String? termsAcceptedAt,
    String? termsVersionAccepted,
    ChairpersonSettings? settings,
    DateTime? lastLoginAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? biometricEnabled,
  }) = _Chairperson;

  factory Chairperson.fromJson(Map<String, dynamic> json) =>
      _$ChairpersonFromJson(json);

  factory Chairperson.fromSafeJson(Map<String, dynamic> json) {
    return Chairperson(
      id: NullSafetyHelper.safeInt(json['id']),
      firstname: NullSafetyHelper.safeString(json['firstname']),
      lastname: NullSafetyHelper.safeString(json['lastname']),
      email: NullSafetyHelper.safeString(json['email']),
      phone: NullSafetyHelper.safeString(json['phone']),
      memberCode: NullSafetyHelper.safeString(json['member_code']),
      mediaUrl: NullSafetyHelper.safeString(json['media_url']),
      mediaKey: NullSafetyHelper.safeString(json['media_key']),
      estateCode: NullSafetyHelper.safeString(json['estate_code']),
      estateName: NullSafetyHelper.safeString(json['estate_name']),
      estateId: NullSafetyHelper.safeInt(json['estate_id']),
      dob: NullSafetyHelper.safeString(json['dob']),
      status: NullSafetyHelper.safeString(json['status']),
      address: NullSafetyHelper.safeString(json['address']),
      gender: NullSafetyHelper.safeString(json['gender']),
      digitalIdCode: NullSafetyHelper.safeString(json['digital_id_code']),
      digitalQrCode: NullSafetyHelper.safeString(json['digital_qr_code']),
      digitalIdStatus: NullSafetyHelper.safeBool(json['digital_id_status']),
      signature: NullSafetyHelper.safeString(json['signature']),
      propertyAgreementSign:
          NullSafetyHelper.safeInt(json['property_agreement_sign']),
      propertyAgreementSignedAt:
          NullSafetyHelper.safeString(json['property_agreement_signed_at']),
      propertyAgreementVersionAccepted: NullSafetyHelper.safeString(
          json['property_agreement_version_accepted']),
      emailVerifiedAt: NullSafetyHelper.safeString(json['email_verified_at']),
      verificationCodeExpiresAt:
          NullSafetyHelper.safeString(json['verification_code_expires_at']),
      isServiceProvider: NullSafetyHelper.safeBool(json['is_service_provider']),
      passwordChangeRequired:
          NullSafetyHelper.safeBool(json['password_change_required']),
      google2faEnabled: NullSafetyHelper.safeBool(json['google2fa_enabled']),
      google2faBackupCodes:
          NullSafetyHelper.safeString(json['google2fa_backup_codes']),
      google2faEnabledAt: NullSafetyHelper.safeString(json['google2fa_enabled_at']),
      google2faLastUsed: NullSafetyHelper.safeString(json['google2fa_last_used']),
      role: NullSafetyHelper.safeString(json['role']),
      preferredNotification:
          NullSafetyHelper.safeString(json['preferred_notification']),
      forceChangePassword: NullSafetyHelper.safeInt(json['force_change_password']),
      agreeToTerms: NullSafetyHelper.safeBool(json['agree_to_terms']),
      termsAcceptedAt: NullSafetyHelper.safeString(json['terms_accepted_at']),
      termsVersionAccepted:
          NullSafetyHelper.safeString(json['terms_version_accepted']),
      settings: NullSafetyHelper.safeModel(
          json['settings'], ChairpersonSettings.fromSafeJson, ChairpersonSettings.empty()),
      lastLoginAt: NullSafetyHelper.safeDateTime(json['last_login_at']),
      createdAt: NullSafetyHelper.safeDateTime(json['created_at']),
      updatedAt: NullSafetyHelper.safeDateTime(json['updated_at']),
      biometricEnabled: NullSafetyHelper.safeBool(json['biometric_enabled']),
    );
  }

  factory Chairperson.empty() => const Chairperson(
        id: null,
        firstname: null,
        lastname: null,
        email: null,
        phone: null,
        memberCode: null,
        mediaUrl: null,
        mediaKey: null,
        estateCode: null,
        estateName: null,
        estateId: null,
        dob: null,
        status: null,
        address: null,
        gender: null,
        digitalIdCode: null,
        digitalQrCode: null,
        digitalIdStatus: null,
        signature: null,
        propertyAgreementSign: null,
        propertyAgreementSignedAt: null,
        propertyAgreementVersionAccepted: null,
        emailVerifiedAt: null,
        verificationCodeExpiresAt: null,
        isServiceProvider: null,
        passwordChangeRequired: null,
        google2faEnabled: null,
        google2faBackupCodes: null,
        google2faEnabledAt: null,
        google2faLastUsed: null,
        role: null,
        preferredNotification: null,
        forceChangePassword: null,
        agreeToTerms: null,
        termsAcceptedAt: null,
        termsVersionAccepted: null,
        settings: null,
        lastLoginAt: null,
        createdAt: null,
        updatedAt: null,
        biometricEnabled: null,
      );
}
