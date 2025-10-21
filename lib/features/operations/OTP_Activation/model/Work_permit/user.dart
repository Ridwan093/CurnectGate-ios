import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'biometric_device.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory User({
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
    bool? digitalIdStatus,
    String? signature,
    int? propertyAgreementSign,
    String? propertyAgreementSignedAt,
    String? propertyAgreementVersionAccepted,
    String? emailVerifiedAt,
    String? verificationCodeExpiresAt,
    bool? isServiceProvider,
    bool? passwordChangeRequired,
    String? role,
    String? preferredNotification,
    int? forceChangePassword,
    bool? agreeToTerms,
    String? termsAcceptedAt,
    String? termsVersionAccepted,
    Map<String, dynamic>? settings,
    Map<String, dynamic>? curfewSettings,
    String? lastLoginAt,
    String? createdAt,
    String? updatedAt,
    bool? biometricEnabled,
    List<BiometricDevice>? biometricDevices,
    String? biometricLastUsed,
    String? biometricPublicKey,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.fromSafeJson(Map<String, dynamic>? json) {
    if (json == null) return User.empty();
    return User(
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
      digitalIdStatus: NullSafetyHelper.safeBool(json['digital_id_status']),
      signature: NullSafetyHelper.safeString(json['signature']),
      propertyAgreementSign:
          NullSafetyHelper.safeInt(json['property_agreement_sign']),
      propertyAgreementSignedAt:
          NullSafetyHelper.safeString(json['property_agreement_signed_at']),
      propertyAgreementVersionAccepted:
          NullSafetyHelper.safeString(json['property_agreement_version_accepted']),
      emailVerifiedAt: NullSafetyHelper.safeString(json['email_verified_at']),
      verificationCodeExpiresAt:
          NullSafetyHelper.safeString(json['verification_code_expires_at']),
      isServiceProvider: NullSafetyHelper.safeBool(json['is_service_provider']),
      passwordChangeRequired:
          NullSafetyHelper.safeBool(json['password_change_required']),
      role: NullSafetyHelper.safeString(json['role']),
      preferredNotification:
          NullSafetyHelper.safeString(json['preferred_notification']),
      forceChangePassword: NullSafetyHelper.safeInt(json['force_change_password']),
      agreeToTerms: NullSafetyHelper.safeBool(json['agree_to_terms']),
      termsAcceptedAt: NullSafetyHelper.safeString(json['terms_accepted_at']),
      termsVersionAccepted:
          NullSafetyHelper.safeString(json['terms_version_accepted']),
      settings: NullSafetyHelper.safeMap(json['settings']),
      curfewSettings: NullSafetyHelper.safeMap(json['curfew_settings']),
      lastLoginAt: NullSafetyHelper.safeString(json['last_login_at']),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
      updatedAt: NullSafetyHelper.safeString(json['updated_at']),
      biometricEnabled: NullSafetyHelper.safeBool(json['biometric_enabled']),
      biometricDevices: NullSafetyHelper.safeList(json['biometric_devices'])
          ?.map((e) => NullSafetyHelper.safeModel(
                e,
                BiometricDevice.fromSafeJson,
                BiometricDevice.empty(),
              ))
          .whereType<BiometricDevice>()
          .toList(),
      biometricLastUsed: NullSafetyHelper.safeString(json['biometric_last_used']),
      biometricPublicKey: NullSafetyHelper.safeString(json['biometric_public_key']),
    );
  }

  factory User.empty() => const User(
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
        digitalIdStatus: null,
        signature: null,
        propertyAgreementSign: null,
        propertyAgreementSignedAt: null,
        propertyAgreementVersionAccepted: null,
        emailVerifiedAt: null,
        verificationCodeExpiresAt: null,
        isServiceProvider: null,
        passwordChangeRequired: null,
        role: null,
        preferredNotification: null,
        forceChangePassword: null,
        agreeToTerms: null,
        termsAcceptedAt: null,
        termsVersionAccepted: null,
        settings: null,
        curfewSettings: null,
        lastLoginAt: null,
        createdAt: null,
        updatedAt: null,
        biometricEnabled: null,
        biometricDevices: null,
        biometricLastUsed: null,
        biometricPublicKey: null,
      );
}
