// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationsImpl _$$NotificationsImplFromJson(Map<String, dynamic> json) =>
    _$NotificationsImpl(
      email: json['email'] == null
          ? null
          : Community.fromJson(json['email'] as Map<String, dynamic>),
      sms: json['sms'] == null
          ? null
          : Community.fromJson(json['sms'] as Map<String, dynamic>),
      push: json['push'] == null
          ? null
          : Community.fromJson(json['push'] as Map<String, dynamic>),
      payments: json['payments'] == null
          ? null
          : Community.fromJson(json['payments'] as Map<String, dynamic>),
      security: json['security'] == null
          ? null
          : Community.fromJson(json['security'] as Map<String, dynamic>),
      community: json['community'] == null
          ? null
          : Community.fromJson(json['community'] as Map<String, dynamic>),
      maintenance: json['maintenance'] == null
          ? null
          : Community.fromJson(json['maintenance'] as Map<String, dynamic>),
      paymentReminders: json['payment_reminders'] == null
          ? null
          : Community.fromJson(
              json['payment_reminders'] as Map<String, dynamic>),
      communityUpdates: json['community_updates'] == null
          ? null
          : Community.fromJson(
              json['community_updates'] as Map<String, dynamic>),
      maintenanceAlerts: json['maintenance_alerts'] == null
          ? null
          : Community.fromJson(
              json['maintenance_alerts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NotificationsImplToJson(_$NotificationsImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'sms': instance.sms,
      'push': instance.push,
      'payments': instance.payments,
      'security': instance.security,
      'community': instance.community,
      'maintenance': instance.maintenance,
      'payment_reminders': instance.paymentReminders,
      'community_updates': instance.communityUpdates,
      'maintenance_alerts': instance.maintenanceAlerts,
    };
