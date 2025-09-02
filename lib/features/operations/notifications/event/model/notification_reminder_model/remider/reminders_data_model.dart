// reminders_data_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'reminder_model.dart';

part 'reminders_data_model.freezed.dart';
part 'reminders_data_model.g.dart';

@freezed
class RemindersData with _$RemindersData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory RemindersData({List<ReminderModel>? reminders, int? count}) =
      _RemindersData;

  factory RemindersData.fromJson(Map<String, dynamic> json) =>
      _$RemindersDataFromJson(json);

  factory RemindersData.fromSafeJson(Map<String, dynamic> json) {
    return RemindersData(
      reminders: _reminderFromJson(json['reminders']),
      count: NullSafetyHelper.safeInt(json['count']),
    );
  }

  // Helper method to safely convert a list to List<VisitorModel>
  static List<ReminderModel>? _reminderFromJson(dynamic value) {
    if (value == null) return null;
    if (value is! List) return <ReminderModel>[];

    return value
        .map(
          (item) => NullSafetyHelper.safeModel(
            item,
            ReminderModel.fromSafeJson, // Use fromSafeJson for nested safety
            ReminderModel.empty(),
          ),
        )
        .whereType<ReminderModel>() // Filter out nulls
        .toList();
  }

  factory RemindersData.empty() =>
      const RemindersData(reminders: null, count: null);
}
