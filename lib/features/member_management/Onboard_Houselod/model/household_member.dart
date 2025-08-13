import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'permissions_summary.dart';
import 'permission_grant.dart';
import 'access_summary.dart';
import 'verification_status.dart';

part 'household_member.freezed.dart';
part 'household_member.g.dart';

@freezed
class HouseholdMember with _$HouseholdMember {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory HouseholdMember({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'firstname') String? firstname,
    @JsonKey(name: 'lastname') String? lastname,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'media_url') String? mediaUrl,
    @JsonKey(name: 'estate_code') String? estateCode,
    @JsonKey(name: 'estate_name') String? estateName,
    @JsonKey(name: 'estate_id') int? estateId,
    @JsonKey(name: 'dob') String? dob,
    @JsonKey(name: 'age') dynamic age,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'digital_id_status') bool? digitalIdStatus,
    @JsonKey(name: 'deed_of_agreement_sign') bool? deedOfAgreementSign,
    @JsonKey(name: 'email_verified_at') String? emailVerifiedAt,
    @JsonKey(name: 'is_service_provider') bool? isServiceProvider,
    @JsonKey(name: 'password_change_required') bool? passwordChangeRequired,
    @JsonKey(name: 'role') String? role,
    @JsonKey(name: 'preferred_notification') String? preferredNotification,
    @JsonKey(name: 'agree_to_terms') bool? agreeToTerms,
    @JsonKey(name: 'last_login_at') String? lastLoginAt,
    @JsonKey(name: 'profile_image_url') String? profileImageUrl,
    @JsonKey(name: 'curfew_settings') dynamic curfewSettings,
    @JsonKey(name: 'has_curfew') bool? hasCurfew,
    @JsonKey(name: 'curfew_status') dynamic curfewStatus,
    @JsonKey(name: 'can_access_now') bool? canAccessNow,
    @JsonKey(name: 'household_role') String? householdRole,
    @JsonKey(name: 'is_household_member') bool? isHouseholdMember,
    @JsonKey(name: 'permissions_summary') PermissionsSummary? permissionsSummary,
    @JsonKey(name: 'permission_grants') List<PermissionGrant>? permissionGrants,
    @JsonKey(name: 'access_summary') AccessSummary? accessSummary,
    @JsonKey(name: 'verification_status') VerificationStatus? verificationStatus,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _HouseholdMember;

  factory HouseholdMember.fromJson(Map<String, dynamic> json) =>
      _$HouseholdMemberFromJson(json);

  factory HouseholdMember.safeFromJson(Map<String, dynamic>? json) {
      List<PermissionGrant>? parsePermissionGrants(dynamic data) {
    if (data == null) return null;
    if (data is List) {
      return data
          .map((e) => PermissionGrant.safeFromJson(e))
          .whereType<PermissionGrant>()
          .toList();
    }
    if (data is Map<String, dynamic>) {
      final grant = PermissionGrant.safeFromJson(data);
      return grant != null ? [grant] : null;
    }
    return null;
  }
    return HouseholdMember(
      id: NullSafetyHelper.safeInt(json?['id']),
      firstname: NullSafetyHelper.safeString(json?['firstname']),
      lastname: NullSafetyHelper.safeString(json?['lastname']),
      fullName: NullSafetyHelper.safeString(json?['full_name']),
      email: NullSafetyHelper.safeString(json?['email']),
      phone: NullSafetyHelper.safeString(json?['phone']),
      mediaUrl: json?['media_url'] as String?,
      estateCode: NullSafetyHelper.safeString(json?['estate_code']),
      estateName: NullSafetyHelper.safeString(json?['estate_name']),
      estateId: NullSafetyHelper.safeInt(json?['estate_id']),
      dob: json?['dob'] as String?,
      age: json?['age'],
      status: NullSafetyHelper.safeString(json?['status']),
      address: json?['address'] as String?,
      gender: json?['gender'] as String?,
      digitalIdStatus: NullSafetyHelper.safeBool(json?['digital_id_status']),
      deedOfAgreementSign: NullSafetyHelper.safeBool(json?['deed_of_agreement_sign']),
      emailVerifiedAt: json?['email_verified_at'] as String?,
      isServiceProvider: NullSafetyHelper.safeBool(json?['is_service_provider']),
      passwordChangeRequired: NullSafetyHelper.safeBool(json?['password_change_required']),
      role: NullSafetyHelper.safeString(json?['role']),
      preferredNotification: NullSafetyHelper.safeString(json?['preferred_notification']),
      agreeToTerms: NullSafetyHelper.safeBool(json?['agree_to_terms']),
      lastLoginAt: json?['last_login_at'] as String?,
      profileImageUrl: json?['profile_image_url'] as String?,
      curfewSettings: json?['curfew_settings'],
      hasCurfew: NullSafetyHelper.safeBool(json?['has_curfew']),
      curfewStatus: json?['curfew_status'],
      canAccessNow: NullSafetyHelper.safeBool(json?['can_access_now']),
      householdRole: NullSafetyHelper.safeString(json?['household_role']),
      isHouseholdMember: NullSafetyHelper.safeBool(json?['is_household_member']),
      permissionsSummary: PermissionsSummary.safeFromJson(json?['permissions_summary']),
      permissionGrants: parsePermissionGrants(json?['permission_grants']),
      accessSummary: AccessSummary.safeFromJson(json?['access_summary']),
      verificationStatus: VerificationStatus.safeFromJson(json?['verification_status']),
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
    );
  }

  factory HouseholdMember.empty() => const HouseholdMember(
    id: null,
    firstname: null,
    lastname: null,
    fullName: null,
    email: null,
    phone: null,
    mediaUrl: null,
    estateCode: null,
    estateName: null,
    estateId: null,
    dob: null,
    age: null,
    status: null,
    address: null,
    gender: null,
    digitalIdStatus: null,
    deedOfAgreementSign: null,
    emailVerifiedAt: null,
    isServiceProvider: null,
    passwordChangeRequired: null,
    role: null,
    preferredNotification: null,
    agreeToTerms: null,
    lastLoginAt: null,
    profileImageUrl: null,
    curfewSettings: null,
    hasCurfew: null,
    curfewStatus: null,
    canAccessNow: null,
    householdRole: null,
    isHouseholdMember: null,
    permissionsSummary: null,
    permissionGrants: null,
    accessSummary: null,
    verificationStatus: null,
    createdAt: null,
    updatedAt: null,
  );


}