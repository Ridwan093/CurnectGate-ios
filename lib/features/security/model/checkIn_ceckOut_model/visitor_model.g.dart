// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visitor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VisitorModelImpl _$$VisitorModelImplFromJson(Map<String, dynamic> json) =>
    _$VisitorModelImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      estateId: (json['estate_id'] as num?)?.toInt(),
      propertyId: (json['property_id'] as num?)?.toInt(),
      visitorOtpId: (json['visitor_otp_id'] as num?)?.toInt(),
      loggedBy: json['logged_by'] == null
          ? null
          : UserModel.fromJson(json['logged_by'] as Map<String, dynamic>),
      checkedOutBy: json['checked_out_by'] == null
          ? null
          : UserModel.fromJson(json['checked_out_by'] as Map<String, dynamic>),
      name: json['name'] as String?,
      code: json['code'] as String?,
      numberOfGuest: json['number_of_guest'] as String?,
      vehicleNumber: json['vehicle_number'] as String?,
      phoneNumber: json['phone_number'] as String?,
      expectedArrival: json['expected_arrival'] as String?,
      expectedDurationMinutes:
          (json['expected_duration_minutes'] as num?)?.toInt(),
      purpose: json['purpose'] as String?,
      destinationAddress: json['destination_address'] as String?,
      securityInstructions: json['security_instructions'] as String?,
      escortRequired: json['escort_required'] as bool?,
      expectedTime: json['expected_time'] as String?,
      checkin: json['checkin'] as String?,
      checkout: json['checkout'] as String?,
      checkoutNotes: json['checkout_notes'] as String?,
      checkoutMethod: json['checkout_method'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      visitDuration: (json['visit_duration'] as num?)?.toInt(),
      visitDurationFormatted: json['visit_duration_formatted'] as String?,
      isCurrentlyVisiting: json['is_currently_visiting'] as bool?,
      checkoutStatus: json['checkout_status'] as String?,
      visitorOtp: json['visitor_otp'] == null
          ? null
          : VisitorOtpModel.fromJson(
              json['visitor_otp'] as Map<String, dynamic>),
      property: json['property'] == null
          ? null
          : PropertyModel.fromJson(json['property'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VisitorModelImplToJson(_$VisitorModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'estate_id': instance.estateId,
      'property_id': instance.propertyId,
      'visitor_otp_id': instance.visitorOtpId,
      'logged_by': instance.loggedBy?.toJson(),
      'checked_out_by': instance.checkedOutBy?.toJson(),
      'name': instance.name,
      'code': instance.code,
      'number_of_guest': instance.numberOfGuest,
      'vehicle_number': instance.vehicleNumber,
      'phone_number': instance.phoneNumber,
      'expected_arrival': instance.expectedArrival,
      'expected_duration_minutes': instance.expectedDurationMinutes,
      'purpose': instance.purpose,
      'destination_address': instance.destinationAddress,
      'security_instructions': instance.securityInstructions,
      'escort_required': instance.escortRequired,
      'expected_time': instance.expectedTime,
      'checkin': instance.checkin,
      'checkout': instance.checkout,
      'checkout_notes': instance.checkoutNotes,
      'checkout_method': instance.checkoutMethod,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'visit_duration': instance.visitDuration,
      'visit_duration_formatted': instance.visitDurationFormatted,
      'is_currently_visiting': instance.isCurrentlyVisiting,
      'checkout_status': instance.checkoutStatus,
      'visitor_otp': instance.visitorOtp?.toJson(),
      'property': instance.property?.toJson(),
    };
