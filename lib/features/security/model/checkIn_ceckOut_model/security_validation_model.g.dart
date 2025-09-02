// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'security_validation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SecurityValidationModelImpl _$$SecurityValidationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SecurityValidationModelImpl(
      id: (json['id'] as num?)?.toInt(),
      visitorOtpId: (json['visitor_otp_id'] as num?)?.toInt(),
      securityPersonnelId: (json['security_personnel_id'] as num?)?.toInt(),
      estateId: (json['estate_id'] as num?)?.toInt(),
      validationMethod: json['validation_method'] as String?,
      validationStatus: json['validation_status'] as String?,
      otpStatusAtValidation: json['otp_status_at_validation'] as String?,
      validatedAt: json['validated_at'] as String?,
      denialReason: json['denial_reason'] as String?,
      securityNotes: json['security_notes'] as String?,
      validationMetadata: json['validation_metadata'] as List<dynamic>?,
      gateAction: json['gate_action'] as String?,
      gateEntryTime: json['gate_entry_time'] as String?,
      requiresEscort: json['requires_escort'] as bool?,
      escortToAddress: json['escort_to_address'] as String?,
      securityInstructions: json['security_instructions'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      statusBadge: json['status_badge'] as Map<String, dynamic>?,
      timeSinceValidation: json['time_since_validation'] as String?,
      validationSummary: json['validation_summary'] as Map<String, dynamic>?,
      securityPersonnel: json['security_personnel'] == null
          ? null
          : UserModel.fromJson(
              json['security_personnel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SecurityValidationModelImplToJson(
        _$SecurityValidationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'visitor_otp_id': instance.visitorOtpId,
      'security_personnel_id': instance.securityPersonnelId,
      'estate_id': instance.estateId,
      'validation_method': instance.validationMethod,
      'validation_status': instance.validationStatus,
      'otp_status_at_validation': instance.otpStatusAtValidation,
      'validated_at': instance.validatedAt,
      'denial_reason': instance.denialReason,
      'security_notes': instance.securityNotes,
      'validation_metadata': instance.validationMetadata,
      'gate_action': instance.gateAction,
      'gate_entry_time': instance.gateEntryTime,
      'requires_escort': instance.requiresEscort,
      'escort_to_address': instance.escortToAddress,
      'security_instructions': instance.securityInstructions,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'status_badge': instance.statusBadge,
      'time_since_validation': instance.timeSinceValidation,
      'validation_summary': instance.validationSummary,
      'security_personnel': instance.securityPersonnel?.toJson(),
    };
