import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_settings.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  // ignore: deprecated_member_use
  @JsonSerializable(explicitToJson: true, nullable: true)
  const factory User({
    int? id,
    String? firstname,
    String? lastname,
    String? email,
    String? phone,
    @JsonKey(name: 'member_code') String? memberCode,
    @JsonKey(name: 'media_url') String? mediaUrl,
    @JsonKey(name: 'media_key') String? mediaKey,
    @JsonKey(name: 'estate_code') String? estateCode,
    @JsonKey(name: 'estate_name') String? estateName,
    @JsonKey(name: 'estate_id') int? estateId,
    dynamic dob,
    String? status,
    dynamic address,
    dynamic gender,
    @JsonKey(name: 'digital_id_code') String? digitalIdCode,
    @JsonKey(name: 'digital_qr_code') dynamic digitalQrCode,
    @JsonKey(name: 'digital_id_status') bool? digitalIdStatus,
    dynamic signature,
    @JsonKey(name: 'deed_of_agreement_sign') bool? deedOfAgreementSign,
    @JsonKey(name: 'email_verified_at') dynamic emailVerifiedAt,
    @JsonKey(name: 'verification_code_expires_at') dynamic verificationCodeExpiresAt,
    @JsonKey(name: 'is_service_provider') bool? isServiceProvider,
    @JsonKey(name: 'password_change_required') bool? passwordChangeRequired,
    String? role,
    @JsonKey(name: 'preferred_notification') String? preferredNotification,
    @JsonKey(name: 'agree_to_terms') bool? agreeToTerms,
    UserSettings? settings,
    @JsonKey(name: 'curfew_settings') dynamic curfewSettings,
    @JsonKey(name: 'last_login_at') dynamic lastLoginAt,
    @JsonKey(name: 'profile_image_url') dynamic profileImageUrl,
    @JsonKey(name: 'profile_image_key') dynamic profileImageKey,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  factory User.safeFromJson(Map<String, dynamic>? json) {
    return User(
      id: NullSafetyHelper.safeInt(json?['id']),
      firstname: NullSafetyHelper.safeString(json?['firstname']),
      lastname: NullSafetyHelper.safeString(json?['lastname']),
      email: NullSafetyHelper.safeString(json?['email']),
      phone: NullSafetyHelper.safeString(json?['phone']),
      memberCode: NullSafetyHelper.safeString(json?['member_code']),
      mediaUrl: NullSafetyHelper.safeString(json?['media_url']),
      mediaKey: NullSafetyHelper.safeString(json?['media_key']),
      estateCode: NullSafetyHelper.safeString(json?['estate_code']),
      estateName: NullSafetyHelper.safeString(json?['estate_name']),
      estateId: NullSafetyHelper.safeInt(json?['estate_id']),
      dob: json?['dob'],
      status: NullSafetyHelper.safeString(json?['status']),
      address: json?['address'],
      gender: json?['gender'],
      digitalIdCode: NullSafetyHelper.safeString(json?['digital_id_code']),
      digitalQrCode: json?['digital_qr_code'],
      digitalIdStatus: NullSafetyHelper.safeBool(json?['digital_id_status']),
      signature: json?['signature'],
      deedOfAgreementSign: NullSafetyHelper.safeBool(json?['deed_of_agreement_sign']),
      emailVerifiedAt: json?['email_verified_at'],
      verificationCodeExpiresAt: json?['verification_code_expires_at'],
      isServiceProvider: NullSafetyHelper.safeBool(json?['is_service_provider']),
      passwordChangeRequired: NullSafetyHelper.safeBool(json?['password_change_required']),
      role: NullSafetyHelper.safeString(json?['role']),
      preferredNotification: NullSafetyHelper.safeString(json?['preferred_notification']),
      agreeToTerms: NullSafetyHelper.safeBool(json?['agree_to_terms']),
      settings: NullSafetyHelper.safeModel<UserSettings>(
        json?['settings'],
        UserSettings.fromJson,
        UserSettings.empty(),
      ),
      curfewSettings: json?['curfew_settings'],
      lastLoginAt: json?['last_login_at'],
      profileImageUrl: json?['profile_image_url'],
      profileImageKey: json?['profile_image_key'],
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
    );
  }
}