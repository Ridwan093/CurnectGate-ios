import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'community.dart';

part 'notifications.freezed.dart';
part 'notifications.g.dart';

@freezed
class Notifications with _$Notifications {
  const factory Notifications({
    required Community? email,
    required Community? sms,
    required Community? push,
    required Community? payments,
    required Community? security,
    required Community? community,
    required Community? maintenance,
    @JsonKey(name: 'payment_reminders') required Community? paymentReminders,
    @JsonKey(name: 'community_updates') required Community? communityUpdates,
    @JsonKey(name: 'maintenance_alerts') required Community? maintenanceAlerts,
  }) = _Notifications;

  factory Notifications.fromJson(Map<String, dynamic> json) =>
      _$NotificationsFromJson(json);

  factory Notifications.safeFromJson(Map<String, dynamic>? json) => Notifications(
        email: NullSafetyHelper.safeModel(json?['email'], Community.fromJson, null),
        sms: NullSafetyHelper.safeModel(json?['sms'], Community.fromJson, null),
        push: NullSafetyHelper.safeModel(json?['push'], Community.fromJson, null),
        payments: NullSafetyHelper.safeModel(json?['payments'], Community.fromJson, null),
        security: NullSafetyHelper.safeModel(json?['security'], Community.fromJson, null),
        community: NullSafetyHelper.safeModel(json?['community'], Community.fromJson, null),
        maintenance: NullSafetyHelper.safeModel(json?['maintenance'], Community.fromJson, null),
        paymentReminders: NullSafetyHelper.safeModel(json?['payment_reminders'], Community.fromJson, null),
        communityUpdates: NullSafetyHelper.safeModel(json?['community_updates'], Community.fromJson, null),
        maintenanceAlerts: NullSafetyHelper.safeModel(json?['maintenance_alerts'], Community.fromJson, null),
      );
}
