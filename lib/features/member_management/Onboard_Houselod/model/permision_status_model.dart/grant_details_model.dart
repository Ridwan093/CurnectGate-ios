// grant_details_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'granted_by_model.dart';

part 'grant_details_model.freezed.dart';
part 'grant_details_model.g.dart';

@freezed
class GrantDetails with _$GrantDetails {
  const factory GrantDetails({
    @JsonKey(name: 'granted_by') GrantedBy? grantedBy,
    String? reason,
    Map<String, dynamic>? conditions,
    @JsonKey(name: 'expires_at') String? expiresAt,
    @JsonKey(name: 'granted_at') String? grantedAt,
    @JsonKey(name: 'updated_at') String? updatedAt,
  }) = _GrantDetails;

  factory GrantDetails.fromJson(Map<String, dynamic> json) =>
      _$GrantDetailsFromJson(json);

  factory GrantDetails.safeFromJson(Map<String, dynamic>? json) {
    return GrantDetails(
      grantedBy: GrantedBy.safeFromJson(json?['granted_by']),
      reason: NullSafetyHelper.safeString(json?['reason']),
      conditions: json?['conditions'] as Map<String, dynamic>?,
      expiresAt: NullSafetyHelper.safeString(json?['expires_at']),
      grantedAt: NullSafetyHelper.safeString(json?['granted_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
    );
  }
}