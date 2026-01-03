import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'access_summary.dart';
import 'verification_status.dart';
import 'curfew_settings.dart';

part 'estate_admin.freezed.dart';
part 'estate_admin.g.dart';

@freezed
class EstateAdmin with _$EstateAdmin {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory EstateAdmin({
    int? id,
    String? firstname,
    String? lastname,
    String? fullName,
    String? email,
    String? phone,
    String? mediaUrl,
    String? estateCode,
    String? estateName,
    int? estateId,
    String? dob,
    int? age,
    String? status,
    String? address,
    String? gender,
    bool? digitalIdStatus,
    String? deedOfAgreementSign,
    String? emailVerifiedAt,
    bool? isServiceProvider,
    bool? passwordChangeRequired,
    String? role,
    String? preferredNotification,
    bool? agreeToTerms,
    String? lastLoginAt,
    String? profileImageUrl,
    CurfewSettings? curfewSettings,
    bool? hasCurfew,
    String? curfewStatus,
    bool? canAccessNow,
    String? householdRole,
    bool? isHouseholdMember,
    AccessSummary? accessSummary,
    VerificationStatus? verificationStatus,
    String? createdAt,
    String? updatedAt,
  }) = _EstateAdmin;

  factory EstateAdmin.fromJson(Map<String, dynamic> json) =>
      _$EstateAdminFromJson(json);

  factory EstateAdmin.safeFromJson(Map<String, dynamic>? json) {
    return EstateAdmin(
      id: NullSafetyHelper.safeInt(json?['id']),
      firstname: NullSafetyHelper.safeString(json?['firstname']),
      lastname: NullSafetyHelper.safeString(json?['lastname']),
      fullName: NullSafetyHelper.safeString(json?['full_name']),
      email: NullSafetyHelper.safeString(json?['email']),
      phone: NullSafetyHelper.safeString(json?['phone']),
      mediaUrl: NullSafetyHelper.safeString(json?['media_url']),
      estateCode: NullSafetyHelper.safeString(json?['estate_code']),
      estateName: NullSafetyHelper.safeString(json?['estate_name']),
      estateId: NullSafetyHelper.safeInt(json?['estate_id']),
      dob: NullSafetyHelper.safeString(json?['dob']),
      age: NullSafetyHelper.safeInt(json?['age']),
      status: NullSafetyHelper.safeString(json?['status']),
      address: NullSafetyHelper.safeString(json?['address']),
      gender: NullSafetyHelper.safeString(json?['gender']),
      digitalIdStatus: NullSafetyHelper.safeBool(json?['digital_id_status']),
      deedOfAgreementSign:
          NullSafetyHelper.safeString(json?['deed_of_agreement_sign']),
      emailVerifiedAt:
          NullSafetyHelper.safeString(json?['email_verified_at']),
      isServiceProvider:
          NullSafetyHelper.safeBool(json?['is_service_provider']),
      passwordChangeRequired:
          NullSafetyHelper.safeBool(json?['password_change_required']),
      role: NullSafetyHelper.safeString(json?['role']),
      preferredNotification:
          NullSafetyHelper.safeString(json?['preferred_notification']),
      agreeToTerms: NullSafetyHelper.safeBool(json?['agree_to_terms']),
      lastLoginAt: NullSafetyHelper.safeString(json?['last_login_at']),
      profileImageUrl:
          NullSafetyHelper.safeString(json?['profile_image_url']),
      curfewSettings: NullSafetyHelper.safeModel(
        json?['curfew_settings'],
        CurfewSettings.safeFromJson,
        CurfewSettings.empty(),
      ),
      hasCurfew: NullSafetyHelper.safeBool(json?['has_curfew']),
      curfewStatus: NullSafetyHelper.safeString(json?['curfew_status']),
      canAccessNow: NullSafetyHelper.safeBool(json?['can_access_now']),
      householdRole:
          NullSafetyHelper.safeString(json?['household_role']),
      isHouseholdMember:
          NullSafetyHelper.safeBool(json?['is_household_member']),
      accessSummary: NullSafetyHelper.safeModel(
        json?['access_summary'],
        AccessSummary.safeFromJson,
        AccessSummary.empty(),
      ),
      verificationStatus: NullSafetyHelper.safeModel(
        json?['verification_status'],
        VerificationStatus.safeFromJson,
        VerificationStatus.empty(),
      ),
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
    );
  }

  factory EstateAdmin.empty() => const EstateAdmin();
}
