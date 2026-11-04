
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'security.freezed.dart';
part 'security.g.dart';

@freezed
class SecurityPersonnel with _$SecurityPersonnel {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory SecurityPersonnel({
    int? id,
    String? firstname,
    String? lastname,
    String? fullName,
    String? avatarUrl,
    String? role,
    String? roleBadge,
    String? post,
    String? shiftStatus,
    String? onlineStatus,
  }) = _SecurityPersonnel;

  factory SecurityPersonnel.fromJson(Map<String, dynamic> json) =>
      _$SecurityPersonnelFromJson(json);

  factory SecurityPersonnel.fromSafeJson(
      Map<String, dynamic> json) {
    return SecurityPersonnel(
      id: NullSafetyHelper.safeInt(json["id"]),
      firstname: NullSafetyHelper.safeString(json["firstname"]),
      lastname: NullSafetyHelper.safeString(json["lastname"]),
      fullName: NullSafetyHelper.safeString(json["full_name"]),
      avatarUrl: json["avatar_url"]?.toString(),
      role: NullSafetyHelper.safeString(json["role"]),
      roleBadge: NullSafetyHelper.safeString(json["role_badge"]),
      post: NullSafetyHelper.safeString(json["post"]),
      shiftStatus: NullSafetyHelper.safeString(json["shift_status"]),
      onlineStatus: NullSafetyHelper.safeString(json["online_status"]),
    );
  }
}