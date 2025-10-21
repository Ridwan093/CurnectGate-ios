// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermitImpl _$$PermitImplFromJson(Map<String, dynamic> json) => _$PermitImpl(
      id: (json['id'] as num?)?.toInt(),
      estateId: (json['estate_id'] as num?)?.toInt(),
      propertyId: (json['property_id'] as num?)?.toInt(),
      residentId: (json['resident_id'] as num?)?.toInt(),
      visitorOtpId: (json['visitor_otp_id'] as num?)?.toInt(),
      guestPhoneNumber: json['guest_phone_number'] as String?,
      guestName: json['guest_name'] as String?,
      itemsDescription: json['items_description'] as String?,
      estimatedValue: json['estimated_value'],
      status: json['status'] as String?,
      usedAt: json['used_at'],
      usedBy: json['used_by'],
      revokedAt: json['revoked_at'],
      revokedBy: json['revoked_by'] == null
          ? null
          : User.fromJson(json['revoked_by'] as Map<String, dynamic>),
      revocationReason: json['revocation_reason'] as String?,
      isResolved: json['is_resolved'] as bool?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      statusBadge: json['status_badge'] == null
          ? null
          : StatusBadge.fromJson(json['status_badge'] as Map<String, dynamic>),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => PermitItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      visitorOtp: json['visitor_otp'] == null
          ? null
          : VisitorOtp.fromJson(json['visitor_otp'] as Map<String, dynamic>),
      property: json['property'] == null
          ? null
          : Property.fromJson(json['property'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PermitImplToJson(_$PermitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'estate_id': instance.estateId,
      'property_id': instance.propertyId,
      'resident_id': instance.residentId,
      'visitor_otp_id': instance.visitorOtpId,
      'guest_phone_number': instance.guestPhoneNumber,
      'guest_name': instance.guestName,
      'items_description': instance.itemsDescription,
      'estimated_value': instance.estimatedValue,
      'status': instance.status,
      'used_at': instance.usedAt,
      'used_by': instance.usedBy,
      'revoked_at': instance.revokedAt,
      'revoked_by': instance.revokedBy?.toJson(),
      'revocation_reason': instance.revocationReason,
      'is_resolved': instance.isResolved,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'status_badge': instance.statusBadge?.toJson(),
      'items': instance.items?.map((e) => e.toJson()).toList(),
      'visitor_otp': instance.visitorOtp?.toJson(),
      'property': instance.property?.toJson(),
    };
