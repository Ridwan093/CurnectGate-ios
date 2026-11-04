import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary_model.freezed.dart';
part 'summary_model.g.dart';

// summary_model.dart
@freezed
class Summary with _$Summary {
  const factory Summary({
    @JsonKey(name: 'total_permissions') int? totalPermissions,
    @JsonKey(name: 'role_permissions') int? rolePermissions,
    @JsonKey(name: 'explicit_permissions') int? explicitPermissions,
    @JsonKey(name: 'active_permissions') int? activePermissions,
    @JsonKey(name: 'denied_permissions') int? deniedPermissions,
    @JsonKey(name: 'expired_permissions') int? expiredPermissions,
  }) = _Summary;

  factory Summary.fromJson(Map<String, dynamic> json) => _$SummaryFromJson(json);

  factory Summary.safeFromJson(Map<String, dynamic>? json) {
    return Summary(
      totalPermissions: NullSafetyHelper.safeInt(json?['total_permissions']),
      rolePermissions: NullSafetyHelper.safeInt(json?['role_permissions']),
      explicitPermissions: NullSafetyHelper.safeInt(json?['explicit_permissions']),
      activePermissions: NullSafetyHelper.safeInt(json?['active_permissions']),
      deniedPermissions: NullSafetyHelper.safeInt(json?['denied_permissions']),
      expiredPermissions: NullSafetyHelper.safeInt(json?['expired_permissions']),
    );
  }
}