// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_code_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventCodeImpl _$$EventCodeImplFromJson(Map<String, dynamic> json) =>
    _$EventCodeImpl(
      id: (json['id'] as num?)?.toInt(),
      eventCode: json['event_code'] as String?,
      formattedCode: json['formatted_code'] as String?,
      eventTitle: json['event_title'] as String?,
      eventDescription: json['event_description'] as String?,
      eventType: json['event_type'] as String?,
      eventTypeDisplay: json['event_type_display'] as String?,
      status: json['status'] as String?,
      statusDisplay: json['status_display'] as String?,
      statusColor: json['status_color'] as String?,
      requester: json['requester'] == null
          ? null
          : EventRequester.fromJson(json['requester'] as Map<String, dynamic>),
      address: json['address'] as String?,
      eventLocation: json['event_location'] as String?,
      eventStartDate: json['event_start_date'] as String?,
      eventEndDate: json['event_end_date'] as String?,
      eventStartFormatted: json['event_start_formatted'] as String?,
      eventEndFormatted: json['event_end_formatted'] as String?,
      expectedGuests: (json['expected_guests'] as num?)?.toInt(),
      totalGuestsEntered: (json['total_guests_entered'] as num?)?.toInt(),
      totalGuestsDenied: (json['total_guests_denied'] as num?)?.toInt(),
      usageCount: (json['usage_count'] as num?)?.toInt(),
      guestEntryRate: (json['guest_entry_rate'] as num?)?.toInt(),
      qrCodeUrl: json['qr_code_url'] as String?,
      printableQrCodeUrl: json['printable_qr_code_url'] as String?,
      specialInstructions: json['special_instructions'] as String?,
      isActive: json['is_active'] as bool?,
      isExpired: json['is_expired'] as bool?,
      canBeUsed: json['can_be_used'] as bool?,
      isOngoing: json['is_ongoing'] as bool?,
      hasEnded: json['has_ended'] as bool?,
      daysUntilEvent: (json['days_until_event'] as num?)?.toInt(),
      durationHours: (json['duration_hours'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      revocationReason: json['revocation_reason'] as String?,
      adminNotes: json['admin_notes'] as String?,
      isManualGeneration: json['is_manual_generation'] as bool?,
    );

Map<String, dynamic> _$$EventCodeImplToJson(_$EventCodeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'event_code': instance.eventCode,
      'formatted_code': instance.formattedCode,
      'event_title': instance.eventTitle,
      'event_description': instance.eventDescription,
      'event_type': instance.eventType,
      'event_type_display': instance.eventTypeDisplay,
      'status': instance.status,
      'status_display': instance.statusDisplay,
      'status_color': instance.statusColor,
      'requester': instance.requester?.toJson(),
      'address': instance.address,
      'event_location': instance.eventLocation,
      'event_start_date': instance.eventStartDate,
      'event_end_date': instance.eventEndDate,
      'event_start_formatted': instance.eventStartFormatted,
      'event_end_formatted': instance.eventEndFormatted,
      'expected_guests': instance.expectedGuests,
      'total_guests_entered': instance.totalGuestsEntered,
      'total_guests_denied': instance.totalGuestsDenied,
      'usage_count': instance.usageCount,
      'guest_entry_rate': instance.guestEntryRate,
      'qr_code_url': instance.qrCodeUrl,
      'printable_qr_code_url': instance.printableQrCodeUrl,
      'special_instructions': instance.specialInstructions,
      'is_active': instance.isActive,
      'is_expired': instance.isExpired,
      'can_be_used': instance.canBeUsed,
      'is_ongoing': instance.isOngoing,
      'has_ended': instance.hasEnded,
      'days_until_event': instance.daysUntilEvent,
      'duration_hours': instance.durationHours,
      'created_at': instance.createdAt,
      'revocation_reason': instance.revocationReason,
      'admin_notes': instance.adminNotes,
      'is_manual_generation': instance.isManualGeneration,
    };
