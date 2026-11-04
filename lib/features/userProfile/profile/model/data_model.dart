// data_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_model.freezed.dart';
part 'data_model.g.dart';

@freezed
class Data with _$Data {
   @JsonSerializable(explicitToJson: true)
  const factory Data({
    @Default(0) int id,
    @Default('') String firstname,
    @Default('') String lastname,
    @JsonKey(name: 'full_name') @Default('') String fullName,
    @Default('') String email,
    @Default('') String phone,
    @JsonKey(name: 'member_code') @Default('') String memberCode,
    @JsonKey(name: 'estate_code') @Default('') String estateCode,
    @JsonKey(name: 'estate_name') @Default('') String estateName,
    String? gender,
    @Default('') String role,
    @Default(false) bool status,
    @JsonKey(name: 'media_url') @Default('') String mediaUrl,
    @JsonKey(name: 'preferred_notification') @Default('') String preferredNotification,
    @JsonKey(name: 'email_verified_at') DateTime? emailVerifiedAt,
    @JsonKey(name: 'last_login_at') DateTime? lastLoginAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'updated_at') DateTime? updatedAt,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  factory Data.safeFromJson(Map<String, dynamic>? json) {
    return Data(
      id: NullSafetyHelper.safeInt(json?['id']),
      firstname: NullSafetyHelper.safeString(json?['firstname']),
      lastname: NullSafetyHelper.safeString(json?['lastname']),
      fullName: NullSafetyHelper.safeString(json?['full_name']),
      email: NullSafetyHelper.safeString(json?['email']),
      phone: NullSafetyHelper.safeString(json?['phone']),
      memberCode: NullSafetyHelper.safeString(json?['member_code']),
      estateCode: NullSafetyHelper.safeString(json?['estate_code']),
      estateName: NullSafetyHelper.safeString(json?['estate_name']),
      gender: NullSafetyHelper.safeString(json?['gender']),
      role: NullSafetyHelper.safeString(json?['role']),
      status: NullSafetyHelper.safeBool(json?['status']),
      mediaUrl: NullSafetyHelper.safeString(json?['media_url']),
      preferredNotification: NullSafetyHelper.safeString(json?['preferred_notification']),
      emailVerifiedAt: NullSafetyHelper.safeDateTime(json?['email_verified_at']),
      lastLoginAt: NullSafetyHelper.safeDateTime(json?['last_login_at']),
      createdAt: NullSafetyHelper.safeDateTime(json?['created_at']),
      updatedAt: NullSafetyHelper.safeDateTime(json?['updated_at']),
    );
  }
}