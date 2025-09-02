// reminder_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder_model.freezed.dart';
part 'reminder_model.g.dart';

@freezed
class ReminderModel with _$ReminderModel {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ReminderModel({
    int? id,
    String? title,
    String? description,
    String? category,
    String? reminderType,
    String? reminderDatetime,
    String? notificationMethod,
    String? status,
    bool? isSharedWithHousehold,
    String? snoozeUntil,
    int? snoozeCount,
    bool? hasFired,
    String? lastFiredAt,
    bool? isDue,
    bool? isUpcoming,
    bool? isSnoozed,
    bool? isRecurring,
    String? createdAt,
  }) = _ReminderModel;

  factory ReminderModel.fromJson(Map<String, dynamic> json) =>
      _$ReminderModelFromJson(json);

  factory ReminderModel.fromSafeJson(Map<String, dynamic> json) {
    return ReminderModel(
      id: NullSafetyHelper.safeInt(json['id']),
      title: NullSafetyHelper.safeString(json['title']),
      description: NullSafetyHelper.safeString(json['description']),
      category: NullSafetyHelper.safeString(json['category']),
      reminderType: NullSafetyHelper.safeString(json['reminder_type']),
      reminderDatetime: NullSafetyHelper.safeString(json['reminder_datetime']),
      notificationMethod: NullSafetyHelper.safeString(json['notification_method']),
      status: NullSafetyHelper.safeString(json['status']),
      isSharedWithHousehold: NullSafetyHelper.safeBool(json['is_shared_with_household']),
      snoozeUntil: NullSafetyHelper.safeString(json['snooze_until']),
      snoozeCount: NullSafetyHelper.safeInt(json['snooze_count']),
      hasFired: NullSafetyHelper.safeBool(json['has_fired']),
      lastFiredAt: NullSafetyHelper.safeString(json['last_fired_at']),
      isDue: NullSafetyHelper.safeBool(json['is_due']),
      isUpcoming: NullSafetyHelper.safeBool(json['is_upcoming']),
      isSnoozed: NullSafetyHelper.safeBool(json['is_snoozed']),
      isRecurring: NullSafetyHelper.safeBool(json['is_recurring']),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
    );
  }

  factory ReminderModel.empty() => const ReminderModel(
    id: null,
    title: null,
    description: null,
    category: null,
    reminderType: null,
    reminderDatetime: null,
    notificationMethod: null,
    status: null,
    isSharedWithHousehold: null,
    snoozeUntil: null,
    snoozeCount: null,
    hasFired: null,
    lastFiredAt: null,
    isDue: null,
    isUpcoming: null,
    isSnoozed: null,
    isRecurring: null,
    createdAt: null,
  );
}