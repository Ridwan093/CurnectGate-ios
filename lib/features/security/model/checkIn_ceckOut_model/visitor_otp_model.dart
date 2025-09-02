import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'destination_info_model.dart';
import 'property_model.dart';
import 'security_validation_model.dart';

part 'visitor_otp_model.freezed.dart';
part 'visitor_otp_model.g.dart';

@freezed

class VisitorOtpModel with _$VisitorOtpModel {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory VisitorOtpModel({
    int? id,
    int? estateId,
    int? propertyId,
    int? generatedBy,
    String? otpCode,
    String? barcodeData,
    String? qrCodeData,
    String? visitorName,
    String? purpose,
    String? validFrom,
    String? validUntil,
    int? validityHours,
    String? status,
    int? requiresSecurityValidation,
    String? securityClearanceLevel,
    String? usedAt,
    String? usedBy,
    Map<String, dynamic>? metadata,
    String? createdAt,
    String? updatedAt,
    double? timeRemaining,
    bool? isActive,
    String? countdownDisplay,
    String? securityStatus,
    DestinationInfoModel? destinationInfo,
    SecurityValidationModel? latestSecurityValidation,
    PropertyModel? property,
  }) = _VisitorOtpModel;

  factory VisitorOtpModel.fromJson(Map<String, dynamic> json) =>
      _$VisitorOtpModelFromJson(json);

  factory VisitorOtpModel.fromSafeJson(Map<String, dynamic> json) {
    return VisitorOtpModel(
      id: NullSafetyHelper.safeInt(json['id']),
      estateId: NullSafetyHelper.safeInt(json['estate_id']),
      propertyId: NullSafetyHelper.safeInt(json['property_id']),
      generatedBy: NullSafetyHelper.safeInt(json['generated_by']),
      otpCode: NullSafetyHelper.safeString(json['otp_code']),
      barcodeData: NullSafetyHelper.safeString(json['barcode_data']),
      qrCodeData: NullSafetyHelper.safeString(json['qr_code_data']),
      visitorName: NullSafetyHelper.safeString(json['visitor_name']),
      purpose: NullSafetyHelper.safeString(json['purpose']),
      validFrom: NullSafetyHelper.safeString(json['valid_from']),
      validUntil: NullSafetyHelper.safeString(json['valid_until']),
      validityHours: NullSafetyHelper.safeInt(json['validity_hours']),
      status: NullSafetyHelper.safeString(json['status']),
      requiresSecurityValidation: NullSafetyHelper.safeInt(
        json['requires_security_validation'],
      ),
      securityClearanceLevel: NullSafetyHelper.safeString(
        json['security_clearance_level'],
      ),
      usedAt: NullSafetyHelper.safeString(json['used_at']),
      usedBy: NullSafetyHelper.safeString(json['used_by']),
      metadata: NullSafetyHelper.safeMap(json['metadata']),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
      updatedAt: NullSafetyHelper.safeString(json['updated_at']),
      timeRemaining: NullSafetyHelper.safeDouble(json['time_remaining']),
      isActive: NullSafetyHelper.safeBool(json['is_active']),
      countdownDisplay: NullSafetyHelper.safeString(json['countdown_display']),
      securityStatus: NullSafetyHelper.safeString(json['security_status']),
      destinationInfo: NullSafetyHelper.safeModel(
        json['destination_info'],
        DestinationInfoModel.fromJson,
        DestinationInfoModel.empty(),
      ),
      latestSecurityValidation: NullSafetyHelper.safeModel(
        json['latest_security_validation'],
        SecurityValidationModel.fromJson,
        SecurityValidationModel.empty(),
      ),
      property: NullSafetyHelper.safeModel(
        json['property'],
        PropertyModel.fromJson,
        PropertyModel.empty(),
      ),
    );
  }

  factory VisitorOtpModel.empty() => const VisitorOtpModel(
    id: null,
    estateId: null,
    propertyId: null,
    generatedBy: null,
    otpCode: null,
    barcodeData: null,
    qrCodeData: null,
    visitorName: null,
    purpose: null,
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
