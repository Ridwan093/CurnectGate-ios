// user_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed

class UserModel with _$UserModel {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory UserModel({
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
    bool? deedOfAgreementSign,
    String? emailVerifiedAt,
    String? verificationCodeExpiresAt,
    bool? isServiceProvider,
    bool? passwordChangeRequired,
    String? role,
    String? preferredNotification,
    bool? agreeToTerms,
    Map<String, dynamic>? settings,
    Map<String, dynamic>? curfewSettings,
    String? lastLoginAt,
    String? createdAt,
    String? updatedAt,
  }) = _UserModel;

  // Regular freezed fromJson
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // Safe fromJson with null safety handling
  factory UserModel.fromSafeJson(Map<String, dynamic> json) {
    return UserModel(
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
      deedOfAgreementSign: NullSafetyHelper.safeBool(json['deed_of_agreement_sign']),
      emailVerifiedAt: NullSafetyHelper.safeString(json['email_verified_at']),
      verificationCodeExpiresAt: NullSafetyHelper.safeString(json['verification_code_expires_at']),
      isServiceProvider: NullSafetyHelper.safeBool(json['is_service_provider']),
      passwordChangeRequired: NullSafetyHelper.safeBool(json['password_change_required']),
      role: NullSafetyHelper.safeString(json['role']),
      preferredNotification: NullSafetyHelper.safeString(json['preferred_notification']),
      agreeToTerms: NullSafetyHelper.safeBool(json['agree_to_terms']),
      settings: NullSafetyHelper.safeMap(json['settings']),
      curfewSettings: NullSafetyHelper.safeMap(json['curfew_settings']),
      lastLoginAt: NullSafetyHelper.safeString(json['last_login_at']),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
      updatedAt: NullSafetyHelper.safeString(json['updated_at']),
    );
  }

  factory UserModel.empty() => const UserModel(
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
        deedOfAgreementSign: null,
        emailVerifiedAt: null,
        verificationCodeExpiresAt: null,
        isServiceProvider: null,
        passwordChangeRequired: null,
        role: null,
        preferredNotification: null,
        agreeToTerms: null,
        settings: null,
        curfewSettings: null,
        lastLoginAt: null,
        createdAt: null,
        updatedAt: null,
      );
}