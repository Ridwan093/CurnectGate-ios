// notification_count_response_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'notification_count_data_model.dart';

part 'notification_count_response_model.freezed.dart';
part 'notification_count_response_model.g.dart';

@freezed
class NotificationCountResponse with _$NotificationCountResponse {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory NotificationCountResponse({
    bool? status,
    String? message,
    int? code,
    NotificationCountData? data,
  }) = _NotificationCountResponse;

  factory NotificationCountResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationCountResponseFromJson(json);

  factory NotificationCountResponse.fromSafeJson(Map<String, dynamic> json) {
    return NotificationCountResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: NullSafetyHelper.safeModel(
        json['data'],
        NotificationCountData.fromJson,
        NotificationCountData.empty(),
      ),
    );
  }

  factory NotificationCountResponse.empty() => const NotificationCountResponse(
    status: null,
    message: null,
    code: null,
    data: null,
  );
}