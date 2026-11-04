// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OtpImpl _$$OtpImplFromJson(Map<String, dynamic> json) => _$OtpImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      estateId: json['estate_id'] == null
          ? 0
          : NullSafetyHelper.safeInt(json['estate_id']),
      propertyId: json['property_id'] == null
          ? 0
          : NullSafetyHelper.safeInt(json['property_id']),
      generatedBy: json['generated_by'] == null
          ? 0
          : NullSafetyHelper.safeInt(json['generated_by']),
      otpCode: json['otp_code'] == null
          ? ''
          : NullSafetyHelper.safeString(json['otp_code']),
      barcodeData: json['barcode_data'] == null
          ? ''
          : NullSafetyHelper.safeString(json['barcode_data']),
      qrCodeData: json['qr_code_data'] == null
          ? ''
          : NullSafetyHelper.safeString(json['qr_code_data']),
      visitorName: json['visitor_name'] == null
          ? ''
          : NullSafetyHelper.safeString(json['visitor_name']),
      purpose: json['purpose'] == null
          ? ''
          : NullSafetyHelper.safeString(json['purpose']),
      validFrom: NullSafetyHelper.safeDateTime(json['valid_from']),
      validUntil: NullSafetyHelper.safeDateTime(json['valid_until']),
      validityHours: json['validity_hours'] == null
          ? 0
          : NullSafetyHelper.safeInt(json['validity_hours']),
      status: json['status'] == null
          ? ''
          : NullSafetyHelper.safeString(json['status']),
      requiresSecurityValidation: json['requires_security_validation'] == null
          ? false
          : NullSafetyHelper.safeBool(json['requires_security_validation']),
      securityClearanceLevel: json['security_clearance_level'] == null
          ? ''
          : NullSafetyHelper.safeString(json['security_clearance_level']),
      usedAt: NullSafetyHelper.safeDateTime(json['used_at']),
      usedBy: NullSafetyHelper.safeInt(json['used_by']),
      metadata: json['metadata'] == null
          ? const <String, dynamic>{}
          : NullSafetyHelper.safeMap(json['metadata']),
      createdAt: NullSafetyHelper.safeDateTime(json['created_at']),
      updatedAt: NullSafetyHelper.safeDateTime(json['updated_at']),
      timeRemaining: json['time_remaining'] == null
          ? 0.0
          : NullSafetyHelper.safeDouble(json['time_remaining']),
      isActive: json['is_active'] == null
          ? false
          : NullSafetyHelper.safeBool(json['is_active']),
      countdownDisplay: json['countdown_display'] == null
          ? ''
          : NullSafetyHelper.safeString(json['countdown_display']),
      securityStatus: json['security_status'] == null
          ? ''
          : NullSafetyHelper.safeString(json['security_status']),
      destinationInfo: json['destination_info'] == null
          ? null
          : DestinationInfo.fromJson(
              json['destination_info'] as Map<String, dynamic>),
      estate: Estate.fromJson(json['estate'] as Map<String, dynamic>),
      property: json['property'] == null
          ? null
          : Property.fromJson(json['property'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$OtpImplToJson(_$OtpImpl instance) => <String, dynamic>{
      'id': instance.id,
      'estate_id': instance.estateId,
      'property_id': instance.propertyId,
      'generated_by': instance.generatedBy,
      'otp_code': instance.otpCode,
      'barcode_data': instance.barcodeData,
      'qr_code_data': instance.qrCodeData,
      'visitor_name': instance.visitorName,
      'purpose': instance.purpose,
      'valid_from': instance.validFrom.toIso8601String(),
      'valid_until': instance.validUntil.toIso8601String(),
      'validity_hours': instance.validityHours,
      'status': instance.status,
      'requires_security_validation': instance.requiresSecurityValidation,
      'security_clearance_level': instance.securityClearanceLevel,
      'used_at': instance.usedAt?.toIso8601String(),
      'used_by': instance.usedBy,
      'metadata': instance.metadata,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'time_remaining': instance.timeRemaining,
      'is_active': instance.isActive,
      'countdown_display': instance.countdownDisplay,
      'security_status': instance.securityStatus,
      'destination_info': instance.destinationInfo?.toJson(),
      'estate': instance.estate.toJson(),
      'property': instance.property?.toJson(),
    };
