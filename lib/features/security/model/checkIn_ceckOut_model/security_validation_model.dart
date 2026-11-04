// security_validation_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


import 'user_model.dart';

part 'security_validation_model.freezed.dart';
part 'security_validation_model.g.dart';

@freezed

class SecurityValidationModel with _$SecurityValidationModel {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory SecurityValidationModel({
    int? id,
    int? visitorOtpId,
    int? securityPersonnelId,
    int? estateId,
    String? validationMethod,
    String? validationStatus,
    String? otpStatusAtValidation,
    String? validatedAt,
    String? denialReason,
    String? securityNotes,
    List<dynamic>? validationMetadata,
    String? gateAction,
    String? gateEntryTime,
    bool? requiresEscort,
    String? escortToAddress,
    String? securityInstructions,
    String? createdAt,
    String? updatedAt,
    Map<String, dynamic>? statusBadge,
    String? timeSinceValidation,
    Map<String, dynamic>? validationSummary,
    UserModel? securityPersonnel,
  }) = _SecurityValidationModel;

  // Regular freezed fromJson
  factory SecurityValidationModel.fromJson(Map<String, dynamic> json) =>
      _$SecurityValidationModelFromJson(json);

  // Safe fromJson with null safety handling
  factory SecurityValidationModel.fromSafeJson(Map<String, dynamic> json) {
    return SecurityValidationModel(
      id: NullSafetyHelper.safeInt(json['id']),
      visitorOtpId: NullSafetyHelper.safeInt(json['visitor_otp_id']),
      securityPersonnelId: NullSafetyHelper.safeInt(json['security_personnel_id']),
      estateId: NullSafetyHelper.safeInt(json['estate_id']),
      validationMethod: NullSafetyHelper.safeString(json['validation_method']),
      validationStatus: NullSafetyHelper.safeString(json['validation_status']),
      otpStatusAtValidation: NullSafetyHelper.safeString(json['otp_status_at_validation']),
      validatedAt: NullSafetyHelper.safeString(json['validated_at']),
      denialReason: NullSafetyHelper.safeString(json['denial_reason']),
      securityNotes: NullSafetyHelper.safeString(json['security_notes']),
      validationMetadata: NullSafetyHelper.safeList<dynamic>(json['validation_metadata']),
      gateAction: NullSafetyHelper.safeString(json['gate_action']),
      gateEntryTime: NullSafetyHelper.safeString(json['gate_entry_time']),
      requiresEscort: NullSafetyHelper.safeBool(json['requires_escort']),
      escortToAddress: NullSafetyHelper.safeString(json['escort_to_address']),
      securityInstructions: NullSafetyHelper.safeString(json['security_instructions']),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
      updatedAt: NullSafetyHelper.safeString(json['updated_at']),
      statusBadge: NullSafetyHelper.safeMap(json['status_badge']),
      timeSinceValidation: NullSafetyHelper.safeString(json['time_since_validation']),
      validationSummary: NullSafetyHelper.safeMap(json['validation_summary']),
      securityPersonnel: NullSafetyHelper.safeModel(
        json['security_personnel'],
        UserModel.fromJson, // Or UserModel.fromSafeJson if it exists
        null,
      ),
    );
  }

  factory SecurityValidationModel.empty() => const SecurityValidationModel(
        id: null,
        visitorOtpId: null,
        securityPersonnelId: null,
        estateId: null,
        validationMethod: null,
        validationStatus: null,
        otpStatusAtValidation: null,
        validatedAt: null,
        denialReason: null,
        securityNotes: null,
        validationMetadata: null,
        gateAction: null,
        gateEntryTime: null,
        requiresEscort: null,
        escortToAddress: null,
        securityInstructions: null,
        createdAt: null,
        updatedAt: null,
        statusBadge: null,
        timeSinceValidation: null,
        validationSummary: null,
        securityPersonnel: null,
      );
}