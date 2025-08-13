import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'access_permissions.dart';

part 'digital_id.freezed.dart';
part 'digital_id.g.dart';

@freezed
class DigitalId with _$DigitalId {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory DigitalId({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'user_id') int? userId,
    @JsonKey(name: 'estate_id') int? estateId,
    @JsonKey(name: 'digital_id_code') String? digitalIdCode,
    @JsonKey(name: 'qr_code_url') String? qrCodeUrl,
    @JsonKey(name: 'qr_code_public_id') String? qrCodePublicId,
    @JsonKey(name: 'qr_code_data') String? qrCodeData,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'access_permissions') AccessPermissions? accessPermissions,
    @JsonKey(name: 'restrictions') dynamic restrictions,
    @JsonKey(name: 'deactivation_reason') dynamic deactivationReason,
    @JsonKey(name: 'deactivated_by') int? deactivatedBy,
    @JsonKey(name: 'created_by') int? createdBy,
    @JsonKey(name: 'activated_at') String? activatedAt,
    @JsonKey(name: 'deactivated_at') dynamic deactivatedAt,
    @JsonKey(name: 'last_used_at') String? lastUsedAt,
    @JsonKey(name: 'usage_count') int? usageCount,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _DigitalId;

  // Standard Freezed-generated fromJson
  factory DigitalId.fromJson(Map<String, dynamic> json) =>
      _$DigitalIdFromJson(json);

  // Custom null-safe parser with default values
  factory DigitalId.safeFromJson(Map<String, dynamic>? json) {
    return DigitalId(
      id: NullSafetyHelper.safeInt(json?['id']),
      userId: NullSafetyHelper.safeInt(json?['user_id']),
      estateId: NullSafetyHelper.safeInt(json?['estate_id']),
      digitalIdCode: NullSafetyHelper.safeString(json?['digital_id_code']),
      qrCodeUrl: NullSafetyHelper.safeString(json?['qr_code_url']),
      qrCodePublicId: NullSafetyHelper.safeString(json?['qr_code_public_id']),
      qrCodeData: NullSafetyHelper.safeString(json?['qr_code_data']),
      status: NullSafetyHelper.safeString(json?['status'],),
      accessPermissions: AccessPermissions.safeFromJson(json?['access_permissions']),
      restrictions: json?['restrictions'],
      deactivationReason: json?['deactivation_reason'],
      deactivatedBy: NullSafetyHelper.safeInt(json?['deactivated_by']),
      createdBy: NullSafetyHelper.safeInt(json?['created_by']),
      activatedAt: NullSafetyHelper.safeString(json?['activated_at']),
      deactivatedAt: json?['deactivated_at'],
      lastUsedAt: NullSafetyHelper.safeString(json?['last_used_at']),
      usageCount: NullSafetyHelper.safeInt(json?['usage_count']),
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
    );
  }

  // Helper method to get a default instance
  factory DigitalId.empty() => const DigitalId();
}