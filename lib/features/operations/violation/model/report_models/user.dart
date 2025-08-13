import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';



part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  @JsonSerializable(explicitToJson: true)
  const factory User({
    @JsonKey(fromJson: NullSafetyHelper.safeInt) required int id,
    @JsonKey(fromJson: NullSafetyHelper.safeString) required String name,
    @JsonKey(name: 'member_code', fromJson: NullSafetyHelper.safeString) String? memberCode,
    @JsonKey(fromJson: NullSafetyHelper.safeString) required String role,
    @JsonKey(name: 'is_self', fromJson: NullSafetyHelper.safeBool) required bool isSelf,
    @JsonKey(name: 'is_current_user', fromJson: NullSafetyHelper.safeBool) bool? isCurrentUser,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static User safeFromJson(Map<String, dynamic>? json) {
    return User(
      id: NullSafetyHelper.safeInt(json?['id']),
      name: NullSafetyHelper.safeString(json?['name']),
      memberCode: NullSafetyHelper.safeString(json?['member_code']),
      role: NullSafetyHelper.safeString(json?['role']),
      isSelf: NullSafetyHelper.safeBool(json?['is_self']),
      isCurrentUser: NullSafetyHelper.safeBool(json?['is_current_user']),
    );
  }
}
