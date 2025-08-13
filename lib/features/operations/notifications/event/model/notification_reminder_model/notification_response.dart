import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'notification_data.dart';

part 'notification_response.freezed.dart';
part 'notification_response.g.dart';

@freezed
class NotificationResponse with _$NotificationResponse {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory NotificationResponse({
    @JsonKey(name: 'status') required bool? status,
    @JsonKey(name: 'message') required String? message,
    @JsonKey(name: 'code') required int? code,
    @JsonKey(name: 'data') required NotificationData? data,
  }) = _NotificationResponse;

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

  factory NotificationResponse.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return NotificationResponse(
        status: null,
        message: null,
        code: null,
        data: null,
      );
    }
    return NotificationResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: NullSafetyHelper.safeInt(json['code']),
      data: NotificationData.safeFromJson(json['data']),
    );
  }
}