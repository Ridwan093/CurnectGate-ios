// member_permission_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'permission_info_model.dart';
import 'permission_status_model.dart';
import 'grant_details_model.dart';

part 'member_permission_model.freezed.dart';
part 'member_permission_model.g.dart';

@freezed
class MemberPermission with _$MemberPermission {
  const factory MemberPermission({
    PermissionInfo? permission,
    PermissionStatus? status,
    @JsonKey(name: 'grant_details') GrantDetails? grantDetails,
    @JsonKey(name: 'effective_status') String? effectiveStatus,
  }) = _MemberPermission;

  factory MemberPermission.fromJson(Map<String, dynamic> json) =>
      _$MemberPermissionFromJson(json);

  factory MemberPermission.safeFromJson(Map<String, dynamic>? json) {
    return MemberPermission(
      permission: PermissionInfo.safeFromJson(json?['permission']),
      status: PermissionStatus.safeFromJson(json?['status']),
      grantDetails: GrantDetails.safeFromJson(json?['grant_details']),
      effectiveStatus: NullSafetyHelper.safeString(json?['effective_status']),
    );
  }
}