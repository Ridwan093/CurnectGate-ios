// permission_status_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'permission_status_model.freezed.dart';
part 'permission_status_model.g.dart';

@freezed
class PermissionStatus with _$PermissionStatus {
  const factory PermissionStatus({
    @JsonKey(name: 'is_granted') bool? isGranted,
    @JsonKey(name: 'is_active') bool? isActive,
    @JsonKey(name: 'is_expired') bool? isExpired,
    @JsonKey(name: 'has_conditions') bool? hasConditions,
    @JsonKey(name: 'grant_source') String? grantSource,
    @JsonKey(name: 'role_granted') bool? roleGranted,
  }) = _PermissionStatus;

  factory PermissionStatus.fromJson(Map<String, dynamic> json) =>
      _$PermissionStatusFromJson(json);

  factory PermissionStatus.safeFromJson(Map<String, dynamic>? json) {
    return PermissionStatus(
      isGranted: NullSafetyHelper.safeBool(json?['is_granted']),
      isActive: NullSafetyHelper.safeBool(json?['is_active']),
      isExpired: NullSafetyHelper.safeBool(json?['is_expired']),
      hasConditions: NullSafetyHelper.safeBool(json?['has_conditions']),
      grantSource: NullSafetyHelper.safeString(json?['grant_source']),
      roleGranted: NullSafetyHelper.safeBool(json?['role_granted']),
    );
  }
}