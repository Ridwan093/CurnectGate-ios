import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'conditions_model.dart';
import 'granted_by_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'permission_model.freezed.dart';
part 'permission_model.g.dart';  // Added missing semicolon


// permission_model.dart
@freezed
class Permission with _$Permission {
  const factory Permission({
    int? id,
    String? slug,
    String? name,
    String? description,
    String? source,
    String? status,
    @JsonKey(name: 'is_granted') bool? isGranted,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'is_expired') bool? isExpired,
    Conditions? conditions,
    @JsonKey(name: 'expires_at') String? expiresAt,
    @JsonKey(name: 'granted_by') GrantedBy? grantedBy,
    String? reason,
    @JsonKey(name: 'granted_at') String? grantedAt,
  }) = _Permission;

  factory Permission.fromJson(Map<String, dynamic> json) => _$PermissionFromJson(json);

  factory Permission.safeFromJson(Map<String, dynamic>? json) {
    return Permission(
      id: NullSafetyHelper.safeInt(json?['id']),
      slug: NullSafetyHelper.safeString(json?['slug']),
      name: NullSafetyHelper.safeString(json?['name']),
      description: NullSafetyHelper.safeString(json?['description']),
      source: NullSafetyHelper.safeString(json?['source']),
      status: NullSafetyHelper.safeString(json?['status']),
      isGranted: NullSafetyHelper.safeBool(json?['is_granted']),
      isActive: NullSafetyHelper.safeBool(json?['is_active']),
      isExpired: NullSafetyHelper.safeBool(json?['is_expired']),
      conditions: Conditions.safeFromJson(json?['conditions']),
      expiresAt: NullSafetyHelper.safeString(json?['expires_at']),
      grantedBy: GrantedBy.safeFromJson(json?['granted_by']),
      reason: NullSafetyHelper.safeString(json?['reason']),
      grantedAt: NullSafetyHelper.safeString(json?['granted_at']),
    );
  }
}