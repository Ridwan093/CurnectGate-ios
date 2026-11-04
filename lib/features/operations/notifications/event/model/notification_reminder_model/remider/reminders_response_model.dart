// reminders_response_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'reminders_data_model.dart';

part 'reminders_response_model.freezed.dart';
part 'reminders_response_model.g.dart';

@freezed
class RemindersResponseModel with _$RemindersResponseModel {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory RemindersResponseModel({
    bool? status,
    String? message,
    int? code,
    RemindersData? data,
  }) = _RemindersResponseModel;

  factory RemindersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RemindersResponseModelFromJson(json);

  factory RemindersResponseModel.fromSafeJson(Map<String, dynamic> json) {
    return RemindersResponseModel(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: NullSafetyHelper.safeModel(
        json['data'],
        RemindersData.fromJson,
        RemindersData.empty(),
      ),
    );
  }

  factory RemindersResponseModel.empty() => const RemindersResponseModel(
    status: null,
    message: null,
    code: null,
    data: null,
  );
}