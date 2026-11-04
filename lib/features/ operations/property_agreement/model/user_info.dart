import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'user_info.freezed.dart';
part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  @JsonSerializable(explicitToJson: true)
  const factory UserInfo({
    String? name,
    String? email,
    String? memberCode,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  factory UserInfo.safeFromJson(Map<String, dynamic>? json) {
    return UserInfo(
      name: NullSafetyHelper.safeString(json?['name']),
      email: NullSafetyHelper.safeString(json?['email']),
      memberCode: NullSafetyHelper.safeString(json?['member_code']),
    );
  }
}
