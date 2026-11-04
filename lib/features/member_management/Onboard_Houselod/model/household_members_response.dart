import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'household_data.dart';

part 'household_members_response.freezed.dart';
part 'household_members_response.g.dart';

@freezed
class HouseholdMembersResponse with _$HouseholdMembersResponse {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory HouseholdMembersResponse({
    @JsonKey(name: 'status') bool? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'code') int? code,
    @JsonKey(name: 'data') HouseholdData? data,
  }) = _HouseholdMembersResponse;

  factory HouseholdMembersResponse.fromJson(Map<String, dynamic> json) =>
      _$HouseholdMembersResponseFromJson(json);

  factory HouseholdMembersResponse.safeFromJson(Map<String, dynamic>? json) {
    return HouseholdMembersResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: HouseholdData.safeFromJson(json?['data']),
    );
  }

  factory HouseholdMembersResponse.empty() =>  HouseholdMembersResponse(
    status: false,
    message: "",
    code: 0,
    data: HouseholdData.empty(),
  );
}