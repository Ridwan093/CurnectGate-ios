// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import 'models.dart.dart';
import 'nullSafty_model.dart';

part 'otp.freezed.dart';
part 'otp.g.dart';

@freezed
class Otp with _$Otp {
  @JsonSerializable(explicitToJson: true)
  const factory Otp({
    @Default(0) int id,
    @JsonKey(name: 'estate_id', fromJson: NullSafetyHelper.safeInt)
    @Default(0)
    int estateId,
    @JsonKey(name: 'property_id', fromJson: NullSafetyHelper.safeInt)
    @Default(0)
    int propertyId,
    @JsonKey(name: 'generated_by', fromJson: NullSafetyHelper.safeInt)
    @Default(0)
    int generatedBy,
    @JsonKey(name: 'otp_code', fromJson: NullSafetyHelper.safeString)
    @Default('')
    String otpCode,
    @JsonKey(name: 'barcode_data', fromJson: NullSafetyHelper.safeString)
    @Default('')
    String barcodeData,
    @JsonKey(name: 'qr_code_data', fromJson: NullSafetyHelper.safeString)
    @Default('')
    String qrCodeData,
    @JsonKey(name: 'visitor_name', fromJson: NullSafetyHelper.safeString)
    @Default('')
    String visitorName,
    @JsonKey(name: 'purpose', fromJson: NullSafetyHelper.safeString)
    @Default('')
    String purpose,
    @JsonKey(name: 'valid_from', fromJson: NullSafetyHelper.safeDateTime)
    required DateTime validFrom,
    @JsonKey(name: 'valid_until', fromJson: NullSafetyHelper.safeDateTime)
    required DateTime validUntil,
    @JsonKey(name: 'validity_hours', fromJson: NullSafetyHelper.safeInt)
    @Default(0)
    int validityHours,
    @JsonKey(name: 'status', fromJson: NullSafetyHelper.safeString)
    @Default('')
    String status,
    @JsonKey(
      name: 'requires_security_validation',
      fromJson: NullSafetyHelper.safeBool,
    )
    @Default(false)
    bool requiresSecurityValidation,
    @JsonKey(
      name: 'security_clearance_level',
      fromJson: NullSafetyHelper.safeString,
    )
    @Default('')
    String securityClearanceLevel,
    @JsonKey(name: 'used_at', fromJson: NullSafetyHelper.safeDateTime)
    DateTime? usedAt,
    @JsonKey(name: 'used_by', fromJson: NullSafetyHelper.safeInt) int? usedBy,
    @JsonKey(name: 'metadata', fromJson: NullSafetyHelper.safeMap)
    @Default(<String, dynamic>{})
    Map<String, dynamic> metadata,
    @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'time_remaining', fromJson: NullSafetyHelper.safeDouble)
    @Default(0.0)
    double timeRemaining,
    @JsonKey(name: 'is_active', fromJson: NullSafetyHelper.safeBool)
    @Default(false)
    bool isActive,
    @JsonKey(name: 'countdown_display', fromJson: NullSafetyHelper.safeString)
    @Default('')
    String countdownDisplay,
    @JsonKey(name: 'security_status', fromJson: NullSafetyHelper.safeString)
    @Default('')
    String securityStatus,
    @JsonKey(name: 'destination_info') DestinationInfo? destinationInfo,
    required Estate estate,
    Property? property,
  }) = _Otp;

  factory Otp.fromJson(Map<String, dynamic> json) => _$OtpFromJson(json);
}
