import 'package:freezed_annotation/freezed_annotation.dart';

import 'reminder_household_member.dart';

part 'reminder_household_data.freezed.dart';
part 'reminder_household_data.g.dart';

@freezed
class ReminderHouseholdData with _$ReminderHouseholdData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ReminderHouseholdData({
    List<ReminderHouseholdMember>? members,
  }) = _ReminderHouseholdData;

  factory ReminderHouseholdData.fromJson(Map<String, dynamic> json) =>
      _$ReminderHouseholdDataFromJson(json);

  factory ReminderHouseholdData.fromSafeJson(Map<String, dynamic> json) {
    List<ReminderHouseholdMember>? parseMembers(dynamic data) {
      if (data == null) return null;
      if (data is List) {
        return data
            .map((e) {
              if (e is Map<String, dynamic>) {
                return ReminderHouseholdMember.fromSafeJson(e);
              }
              return null;
            })
            .whereType<ReminderHouseholdMember>()
            .toList();
      }
      return null;
    }

    return ReminderHouseholdData(
      members: parseMembers(json['members']),
    );
  }

  factory ReminderHouseholdData.empty() => const ReminderHouseholdData(
    members: null,
  );
}
