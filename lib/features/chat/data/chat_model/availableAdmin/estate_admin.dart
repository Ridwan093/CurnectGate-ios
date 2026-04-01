import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

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
    String? avatarUrl,
    String? role,
    String? roleBadge,
    String? onlineStatus,
  }) = _EstateAdmin;

  factory EstateAdmin.fromJson(Map<String, dynamic> json) =>
      _$EstateAdminFromJson(json);

  factory EstateAdmin.safeFromJson(Map<String, dynamic>? json) {
    return EstateAdmin(
      id: NullSafetyHelper.safeInt(json?['id']),
      firstname: NullSafetyHelper.safeString(json?['firstname']),
      lastname: NullSafetyHelper.safeString(json?['lastname']),
      fullName: NullSafetyHelper.safeString(json?['full_name']),
      avatarUrl: NullSafetyHelper.safeString(json?['avatar_url']),
      role: NullSafetyHelper.safeString(json?['role']),
      roleBadge: NullSafetyHelper.safeString(json?['role_badge']),
      onlineStatus: NullSafetyHelper.safeString(json?['online_status']),
    );
  }

  factory EstateAdmin.empty() => const EstateAdmin();
}
