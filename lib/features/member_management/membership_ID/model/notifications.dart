import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'notifications.freezed.dart';
part 'notifications.g.dart';

@freezed
class Notifications with _$Notifications {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Notifications({
    @JsonKey(name: 'sms') bool? sms,
    @JsonKey(name: 'push') bool? push,
    @JsonKey(name: 'email') bool? email,
    @JsonKey(name: 'payments') bool? payments,
    @JsonKey(name: 'security') bool? security,
    @JsonKey(name: 'community') bool? community,
    @JsonKey(name: 'maintenance') bool? maintenance,
    @JsonKey(name: 'community_updates') bool? communityUpdates,
    @JsonKey(name: 'payment_reminders') bool? paymentReminders,
    @JsonKey(name: 'maintenance_alerts') bool? maintenanceAlerts,
  }) = _Notifications;

  factory Notifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsFromJson(json);

  factory Notifications.safeFromJson(Map<String, dynamic>? json) {
    return Notifications(
      sms: NullSafetyHelper.safeBool(json?['sms']),
      push: NullSafetyHelper.safeBool(json?['push']),
      email: NullSafetyHelper.safeBool(json?['email']),
      payments: NullSafetyHelper.safeBool(json?['payments']),
      security: NullSafetyHelper.safeBool(json?['security']),
      community: NullSafetyHelper.safeBool(json?['community']),
      maintenance: NullSafetyHelper.safeBool(json?['maintenance']),
      communityUpdates: NullSafetyHelper.safeBool(json?['community_updates']),
      paymentReminders: NullSafetyHelper.safeBool(json?['payment_reminders']),
      maintenanceAlerts: NullSafetyHelper.safeBool(json?['maintenance_alerts']),
    );
  }

  factory Notifications.empty() => const Notifications(
    sms: false,
    push: false,
    email: false,
    payments: false,
    security: false,
    community: false,
    maintenance: false,
    communityUpdates: false,
    paymentReminders: false,
    maintenanceAlerts: false,
  );

  factory Notifications.withDefaults() => const Notifications(
    sms: false,
    push: false,
    email: false,
    payments: false,
    security: false,
    community: false,
    maintenance: false,
    communityUpdates: false,
    paymentReminders: false,
    maintenanceAlerts: false,
  );
}
