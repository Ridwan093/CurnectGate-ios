import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'permission.dart';
import 'granted_by.dart';

part 'permission_grant.freezed.dart';
part 'permission_grant.g.dart';

@freezed
class PermissionGrant with _$PermissionGrant {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory PermissionGrant({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'permission') Permission? permission,
    @JsonKey(name: 'is_granted') bool? isGranted,
    @JsonKey(name: 'granted_by') GrantedBy? grantedBy,
    @JsonKey(name: 'reason') String? reason,
    @JsonKey(name: 'conditions') dynamic conditions,
    @JsonKey(name: 'expires_at') String? expiresAt,
    @JsonKey(name: 'is_expired') bool? isExpired,
    @JsonKey(name: 'days_until_expiry') dynamic daysUntilExpiry,
    @JsonKey(name: 'granted_at') String? grantedAt,
  }) = _PermissionGrant;

  factory PermissionGrant.fromJson(Map<String, dynamic> json) =>
      _$PermissionGrantFromJson(json);

  factory PermissionGrant.safeFromJson(Map<String, dynamic>? json) {
    return PermissionGrant(
      id: NullSafetyHelper.safeInt(json?['id']),
      permission: Permission.safeFromJson(json?['permission']),
      isGranted: NullSafetyHelper.safeBool(json?['is_granted']),
      grantedBy: GrantedBy.safeFromJson(json?['granted_by']),
      reason: NullSafetyHelper.safeString(json?['reason']),
      conditions: json?['conditions'],
      expiresAt: json?['expires_at'] as String?,
      isExpired: NullSafetyHelper.safeBool(json?['is_expired']),
      daysUntilExpiry: json?['days_until_expiry'],
      grantedAt: NullSafetyHelper.safeString(json?['granted_at']),
    );
  }

  factory PermissionGrant.empty() =>  PermissionGrant(
        id: 0,
        permission: Permission.empty(),
        isGranted: false,
        grantedBy: null,
        reason: null,
        conditions: null,
        expiresAt: null,
        isExpired: null,
        daysUntilExpiry: null,
        grantedAt: null,
      );
}