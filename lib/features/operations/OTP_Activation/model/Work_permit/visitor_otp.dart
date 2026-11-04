import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'destination_info.dart';
import 'property.dart';

part 'visitor_otp.freezed.dart';
part 'visitor_otp.g.dart';

@freezed
class VisitorOtp with _$VisitorOtp {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory VisitorOtp({
    int? id,
    int? estateId,
    int? propertyId,
    int? generatedBy,
    String? otpCode,
    String? barcodeData,
    String? qrCodeData,
    String? visitorName,
    String? purpose,
    int? expectedGuest,
    String? validFrom,
    String? validUntil,
    int? validityHours,
    String? status,
    int? requiresSecurityValidation,
    String? securityClearanceLevel,
    dynamic usedAt,
    dynamic usedBy,
    Map<String, dynamic>? metadata,
    String? createdAt,
    String? updatedAt,
    int? timeRemaining,
    bool? isActive,
    String? countdownDisplay,
    String? securityStatus,
    DestinationInfo? destinationInfo,
    dynamic latestSecurityValidation,
    Property? property,
  }) = _VisitorOtp;

  factory VisitorOtp.fromJson(Map<String, dynamic> json) =>
      _$VisitorOtpFromJson(json);

  factory VisitorOtp.fromSafeJson(Map<String, dynamic>? json) {
    if (json == null) return VisitorOtp.empty();
    return VisitorOtp(
      id: NullSafetyHelper.safeInt(json['id']),
      estateId: NullSafetyHelper.safeInt(json['estate_id']),
      propertyId: NullSafetyHelper.safeInt(json['property_id']),
      generatedBy: NullSafetyHelper.safeInt(json['generated_by']),
      otpCode: NullSafetyHelper.safeString(json['otp_code']),
      barcodeData: NullSafetyHelper.safeString(json['barcode_data']),
      qrCodeData: NullSafetyHelper.safeString(json['qr_code_data']),
      visitorName: NullSafetyHelper.safeString(json['visitor_name']),
      purpose: NullSafetyHelper.safeString(json['purpose']),
      expectedGuest: NullSafetyHelper.safeInt(json['expected_guest']),
      validFrom: NullSafetyHelper.safeString(json['valid_from']),
      validUntil: NullSafetyHelper.safeString(json['valid_until']),
      validityHours: NullSafetyHelper.safeInt(json['validity_hours']),
      status: NullSafetyHelper.safeString(json['status']),
      requiresSecurityValidation:
          NullSafetyHelper.safeInt(json['requires_security_validation']),
      securityClearanceLevel:
          NullSafetyHelper.safeString(json['security_clearance_level']),
      usedAt: json['used_at'],
      usedBy: json['used_by'],
      metadata: NullSafetyHelper.safeMap(json['metadata']),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
      updatedAt: NullSafetyHelper.safeString(json['updated_at']),
      timeRemaining: NullSafetyHelper.safeInt(json['time_remaining']),
      isActive: NullSafetyHelper.safeBool(json['is_active']),
      countdownDisplay: NullSafetyHelper.safeString(json['countdown_display']),
      securityStatus: NullSafetyHelper.safeString(json['security_status']),
      destinationInfo: NullSafetyHelper.safeModel(
        json['destination_info'],
        DestinationInfo.fromSafeJson,
        DestinationInfo.empty(),
      ),
      latestSecurityValidation: json['latest_security_validation'],
      property: NullSafetyHelper.safeModel(
        json['property'],
        Property.fromSafeJson,
        Property.empty(),
      ),
    );
  }

  factory VisitorOtp.empty() => const VisitorOtp(
        id: null,
        estateId: null,
        propertyId: null,
        generatedBy: null,
        otpCode: null,
        barcodeData: null,
        qrCodeData: null,
        visitorName: null,
        purpose: null,
        expectedGuest: null,
        validFrom: null,
        validUntil: null,
        validityHours: null,
        status: null,
        requiresSecurityValidation: null,
        securityClearanceLevel: null,
        usedAt: null,
        usedBy: null,
        metadata: null,
        createdAt: null,
        updatedAt: null,
        timeRemaining: null,
        isActive: null,
        countdownDisplay: null,
        securityStatus: null,
        destinationInfo: null,
        latestSecurityValidation: null,
        property: null,
      );
}
