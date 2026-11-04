import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'reminder_household_data.dart';

part 'reminder_household_members_response.freezed.dart';
part 'reminder_household_members_response.g.dart';

@freezed
class ReminderHouseholdMembersResponse with _$ReminderHouseholdMembersResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ReminderHouseholdMembersResponse({
    bool? status,
    String? message,
    int? code,
    ReminderHouseholdData? data,
  }) = _ReminderHouseholdMembersResponse;

  factory ReminderHouseholdMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$ReminderHouseholdMembersResponseFromJson(json);

  factory ReminderHouseholdMembersResponse.fromSafeJson(Map<String, dynamic> json) {
    return ReminderHouseholdMembersResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: NullSafetyHelper.safeModel(
        json['data'],
        ReminderHouseholdData.fromSafeJson,
        ReminderHouseholdData.empty(),
      ),
    );
  }

  factory ReminderHouseholdMembersResponse.empty() => const ReminderHouseholdMembersResponse(
    status: null,
    message: null,
    code: null,
    data: null,
  );
}
