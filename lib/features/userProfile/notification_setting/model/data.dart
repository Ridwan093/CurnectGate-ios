import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'notifications.dart';

part 'data.freezed.dart';
part 'data.g.dart';

@freezed
class Data with _$Data {
  @JsonSerializable(explicitToJson: true)
  const factory Data({
    Notifications? notifications,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  factory Data.safeFromJson(Map<String, dynamic>? json) => Data(
        notifications: NullSafetyHelper.safeModel<Notifications>(
          json?['notifications'],
          Notifications.fromJson,
          null,
        ),
      );
}
