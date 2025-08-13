// summary_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_model.freezed.dart';
part 'summary_model.g.dart';

@freezed
class Summary with _$Summary {
  const factory Summary({
    @JsonKey(name: 'total_permissions') int? totalPermissions,
    @JsonKey(name: 'granted_permissions') int? grantedPermissions,
    @JsonKey(name: 'active_permissions') int? activePermissions,
    @JsonKey(name: 'expired_permissions') int? expiredPermissions,
    @JsonKey(name: 'conditional_permissions') int? conditionalPermissions,
    @JsonKey(name: 'role_based_permissions') int? roleBasedPermissions,
    @JsonKey(name: 'explicit_permissions') int? explicitPermissions,
  }) = _Summary;

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);

  factory Summary.safeFromJson(Map<String, dynamic>? json) {
    return Summary(
      totalPermissions: NullSafetyHelper.safeInt(json?['total_permissions']),
      grantedPermissions: NullSafetyHelper.safeInt(json?['granted_permissions']),
      activePermissions: NullSafetyHelper.safeInt(json?['active_permissions']),
      expiredPermissions: NullSafetyHelper.safeInt(json?['expired_permissions']),
      conditionalPermissions: NullSafetyHelper.safeInt(json?['conditional_permissions']),
      roleBasedPermissions: NullSafetyHelper.safeInt(json?['role_based_permissions']),
      explicitPermissions: NullSafetyHelper.safeInt(json?['explicit_permissions']),
    );
  }
}