// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderModelImpl _$$ReminderModelImplFromJson(Map<String, dynamic> json) =>
    _$ReminderModelImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      reminderType: json['reminder_type'] as String?,
      reminderDatetime: json['reminder_datetime'] as String?,
      notificationMethod: json['notification_method'] as String?,
      status: json['status'] as String?,
      isSharedWithHousehold: json['is_shared_with_household'] as bool?,
      snoozeUntil: json['snooze_until'] as String?,
      snoozeCount: (json['snooze_count'] as num?)?.toInt(),
      hasFired: json['has_fired'] as bool?,
      lastFiredAt: json['last_fired_at'] as String?,
      isDue: json['is_due'] as bool?,
      isUpcoming: json['is_upcoming'] as bool?,
      isSnoozed: json['is_snoozed'] as bool?,
      isRecurring: json['is_recurring'] as bool?,
      createdAt: json['created_at'] as String?,
    );

Map<String, dynamic> _$$ReminderModelImplToJson(_$ReminderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'reminder_type': instance.reminderType,
      'reminder_datetime': instance.reminderDatetime,
      'notification_method': instance.notificationMethod,
      'status': instance.status,
      'is_shared_with_household': instance.isSharedWithHousehold,
      'snooze_until': instance.snoozeUntil,
      'snooze_count': instance.snoozeCount,
      'has_fired': instance.hasFired,
      'last_fired_at': instance.lastFiredAt,
      'is_due': instance.isDue,
      'is_upcoming': instance.isUpcoming,
      'is_snoozed': instance.isSnoozed,
      'is_recurring': instance.isRecurring,
      'created_at': instance.createdAt,
    };
