import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder_household_member.freezed.dart';
part 'reminder_household_member.g.dart';

@freezed
class ReminderHouseholdMember with _$ReminderHouseholdMember {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ReminderHouseholdMember({
    int? id,
    String? firstname,
    String? lastname,
    String? email,
    String? phone,
    String? role,
    dynamic avatar,
  }) = _ReminderHouseholdMember;

  factory ReminderHouseholdMember.fromJson(Map<String, dynamic> json) =>
      _$ReminderHouseholdMemberFromJson(json);

  factory ReminderHouseholdMember.fromSafeJson(Map<String, dynamic> json) {
    return ReminderHouseholdMember(
      id: NullSafetyHelper.safeInt(json['id']),
      firstname: NullSafetyHelper.safeString(json['firstname']),
      lastname: NullSafetyHelper.safeString(json['lastname']),
      email: NullSafetyHelper.safeString(json['email']),
      phone: NullSafetyHelper.safeString(json['phone']),
      role: NullSafetyHelper.safeString(json['role']),
      avatar: json['avatar'],
    );
  }

  factory ReminderHouseholdMember.empty() => const ReminderHouseholdMember(
    id: null,
    firstname: null,
    lastname: null,
    email: null,
    phone: null,
    role: null,
    avatar: null,
  );
}
