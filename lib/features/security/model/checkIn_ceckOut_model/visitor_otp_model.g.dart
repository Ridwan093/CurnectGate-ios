// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_otp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VisitorOtpModelImpl _$$VisitorOtpModelImplFromJson(
        Map<String, dynamic> json) =>
    _$VisitorOtpModelImpl(
      id: (json['id'] as num?)?.toInt(),
      estateId: (json['estate_id'] as num?)?.toInt(),
      propertyId: (json['property_id'] as num?)?.toInt(),
      generatedBy: (json['generated_by'] as num?)?.toInt(),
      otpCode: json['otp_code'] as String?,
      barcodeData: json['barcode_data'] as String?,
      qrCodeData: json['qr_code_data'] as String?,
      visitorName: json['visitor_name'] as String?,
      purpose: json['purpose'] as String?,
      validFrom: json['valid_from'] as String?,
      validUntil: json['valid_until'] as String?,
      validityHours: (json['validity_hours'] as num?)?.toInt(),
      status: json['status'] as String?,
      requiresSecurityValidation:
          (json['requires_security_validation'] as num?)?.toInt(),
      securityClearanceLevel: json['security_clearance_level'] as String?,
      usedAt: json['used_at'] as String?,
      usedBy: json['used_by'] as String?,
      metadata: json['metadata'] as Map<String, dynamic>?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      timeRemaining: (json['time_remaining'] as num?)?.toDouble(),
      isActive: json['is_active'] as bool?,
      countdownDisplay: json['countdown_display'] as String?,
      securityStatus: json['security_status'] as String?,
      destinationInfo: json['destination_info'] == null
          ? null
          : DestinationInfoModel.fromJson(
              json['destination_info'] as Map<String, dynamic>),
      latestSecurityValidation: json['latest_security_validation'] == null
          ? null
          : SecurityValidationModel.fromJson(
              json['latest_security_validation'] as Map<String, dynamic>),
      property: json['property'] == null
          ? null
          : PropertyModel.fromJson(json['property'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VisitorOtpModelImplToJson(
        _$VisitorOtpModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'estate_id': instance.estateId,
      'property_id': instance.propertyId,
      'generated_by': instance.generatedBy,
      'otp_code': instance.otpCode,
      'barcode_data': instance.barcodeData,
      'qr_code_data': instance.qrCodeData,
      'visitor_name': instance.visitorName,
      'purpose': instance.purpose,
      'valid_from': instance.validFrom,
      'valid_until': instance.validUntil,
      'validity_hours': instance.validityHours,
      'status': instance.status,
      'requires_security_validation': instance.requiresSecurityValidation,
      'security_clearance_level': instance.securityClearanceLevel,
      'used_at': instance.usedAt,
      'used_by': instance.usedBy,
      'metadata': instance.metadata,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'time_remaining': instance.timeRemaining,
      'is_active': instance.isActive,
      'countdown_display': instance.countdownDisplay,
      'security_status': instance.securityStatus,
      'destination_info': instance.destinationInfo?.toJson(),
      'latest_security_validation': instance.latestSecurityValidation?.toJson(),
      'property': instance.property?.toJson(),
    };
