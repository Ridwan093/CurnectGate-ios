import 'package:freezed_annotation/freezed_annotation.dart';


part 'notification_model.freezed.dart';
part 'notification_model.g.dart';

@freezed
class AppNotification with _$AppNotification {
  const factory AppNotification({
    @Default('') String key,
    @Default('') String name,
    @Default('') String type,
    @Default(false) bool value,
    @Default('') String description,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) =>
      _$AppNotificationFromJson(json);


}
