import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_model.dart';
import 'visitor_otp_model.dart';
import 'property_model.dart';

part 'visitor_model.freezed.dart';
part 'visitor_model.g.dart';

@freezed

class VisitorModel with _$VisitorModel {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory VisitorModel({
    int? id,
    int? userId,
    int? estateId,
    int? propertyId,
    int? visitorOtpId,
    UserModel? loggedBy,
    UserModel? checkedOutBy,
    String? name,
    String? code,
    String? numberOfGuest,
    String? vehicleNumber,
    String? phoneNumber,
    String? expectedArrival,
    int? expectedDurationMinutes,
    String? purpose,
    String? destinationAddress,
    String? securityInstructions,
    bool? escortRequired,
    String? expectedTime,
    String? checkin,
    String? checkout,
    String? checkoutNotes,
    String? checkoutMethod,
    String? status,
    String? createdAt,
    String? updatedAt,
    int? visitDuration,
    String? visitDurationFormatted,
    bool? isCurrentlyVisiting,
    String? checkoutStatus,
    VisitorOtpModel? visitorOtp,
    PropertyModel? property,
  }) = _VisitorModel;

  factory VisitorModel.fromJson(Map<String, dynamic> json) => _$VisitorModelFromJson(json);

  factory VisitorModel.fromSafeJson(Map<String, dynamic> json) {
    return VisitorModel(
      id: NullSafetyHelper.safeInt(json['id']),
      userId: NullSafetyHelper.safeInt(json['user_id']),
      estateId: NullSafetyHelper.safeInt(json['estate_id']),
      propertyId: NullSafetyHelper.safeInt(json['property_id']),
      visitorOtpId: NullSafetyHelper.safeInt(json['visitor_otp_id']),
      loggedBy: NullSafetyHelper.safeModel(json['logged_by'], UserModel.fromJson, UserModel.empty()),
      checkedOutBy: NullSafetyHelper.safeModel(json['checked_out_by'], UserModel.fromJson, UserModel.empty()),
      name: NullSafetyHelper.safeString(json['name']),
      code: NullSafetyHelper.safeString(json['code']),
      numberOfGuest: NullSafetyHelper.safeString(json['number_of_guest']),
      vehicleNumber: NullSafetyHelper.safeString(json['vehicle_number']),
      phoneNumber: NullSafetyHelper.safeString(json['phone_number']),
      expectedArrival: NullSafetyHelper.safeString(json['expected_arrival']),
      expectedDurationMinutes: NullSafetyHelper.safeInt(json['expected_duration_minutes']),
      purpose: NullSafetyHelper.safeString(json['purpose']),
      destinationAddress: NullSafetyHelper.safeString(json['destination_address']),
      securityInstructions: NullSafetyHelper.safeString(json['security_instructions']),
      escortRequired: NullSafetyHelper.safeBool(json['escort_required']),
      expectedTime: NullSafetyHelper.safeString(json['expected_time']),
      checkin: NullSafetyHelper.safeString(json['checkin']),
      checkout: NullSafetyHelper.safeString(json['checkout']),
      checkoutNotes: NullSafetyHelper.safeString(json['checkout_notes']),
      checkoutMethod: NullSafetyHelper.safeString(json['checkout_method']),
      status: NullSafetyHelper.safeString(json['status']),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
      updatedAt: NullSafetyHelper.safeString(json['updated_at']),
      visitDuration: NullSafetyHelper.safeInt(json['visit_duration']),
      visitDurationFormatted: NullSafetyHelper.safeString(json['visit_duration_formatted']),
      isCurrentlyVisiting: NullSafetyHelper.safeBool(json['is_currently_visiting']),
      checkoutStatus: NullSafetyHelper.safeString(json['checkout_status']),
      visitorOtp: NullSafetyHelper.safeModel(json['visitor_otp'], VisitorOtpModel.fromSafeJson,VisitorOtpModel.empty()),
      property: NullSafetyHelper.safeModel(json['property'], PropertyModel.fromJson, PropertyModel.empty()),
    );
  }

  factory VisitorModel.empty() => const VisitorModel(
    id: null,
    userId: null,
    estateId: null,
    propertyId: null,
    visitorOtpId: null,
    loggedBy: null,
    checkedOutBy: null,
    name: null,
    code: null,
    numberOfGuest: null,
    vehicleNumber: null,
    phoneNumber: null,
    expectedArrival: null,
    expectedDurationMinutes: null,
    purpose: null,
    destinationAddress: null,
    securityInstructions: null,
    escortRequired: null,
    expectedTime: null,
    checkin: null,
    checkout: null,
    checkoutNotes: null,
    checkoutMethod: null,
    status: null,
    createdAt: null,
    updatedAt: null,
    visitDuration: null,
    visitDurationFormatted: null,
    isCurrentlyVisiting: null,
    checkoutStatus: null,
    visitorOtp: null,
    property: null,
  );
}