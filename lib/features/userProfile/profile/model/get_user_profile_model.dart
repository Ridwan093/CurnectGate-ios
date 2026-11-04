// get_user_profile_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'data_model.dart';

part 'get_user_profile_model.freezed.dart';
part 'get_user_profile_model.g.dart';

@freezed
class GetUserProfile with _$GetUserProfile {
   @JsonSerializable(explicitToJson: true)
  const factory GetUserProfile({
    @Default(false) bool status,
    @Default('') String message,
    @Default(0) int code,
    required Data data,
  }) = _GetUserProfile;

  factory GetUserProfile.fromJson(Map<String, dynamic> json) =>
      _$GetUserProfileFromJson(json);

  factory GetUserProfile.fromSafeJson(Map<String, dynamic> json) {
    return GetUserProfile(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: Data.safeFromJson(json['data']),
    );
  }
}