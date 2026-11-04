import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';


import 'preference_data.dart';

part 'get_user_notifications.freezed.dart';
part 'get_user_notifications.g.dart';

@freezed
class GetuserNotifications with _$GetuserNotifications {
    @JsonSerializable(explicitToJson: true)
  const factory GetuserNotifications({
    required bool status,
    required String message,
    required int code,
    required PreferenceData data,
  }) = _GetuserNotifications;

  factory GetuserNotifications.fromJson(Map<String, dynamic> json) =>
      _$GetuserNotificationsFromJson(json);

  factory GetuserNotifications.safeFromJson(Map<String, dynamic>? json) =>
      GetuserNotifications(
        status: NullSafetyHelper.safeBool(json?['status']),
        message: NullSafetyHelper.safeString(json?['message']),
        code: NullSafetyHelper.safeInt(json?['code']),
        data: PreferenceData.safeFromJson(json?['data']),
      );
}
