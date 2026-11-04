// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationsImpl _$$NotificationsImplFromJson(Map<String, dynamic> json) =>
    _$NotificationsImpl(
      sms: json['sms'] as bool?,
      push: json['push'] as bool?,
      email: json['email'] as bool?,
      payments: json['payments'] as bool?,
      security: json['security'] as bool?,
      community: json['community'] as bool?,
      maintenance: json['maintenance'] as bool?,
      communityUpdates: json['community_updates'] as bool?,
      paymentReminders: json['payment_reminders'] as bool?,
      maintenanceAlerts: json['maintenance_alerts'] as bool?,
    );

Map<String, dynamic> _$$NotificationsImplToJson(_$NotificationsImpl instance) =>
    <String, dynamic>{
      'sms': instance.sms,
      'push': instance.push,
      'email': instance.email,
      'payments': instance.payments,
      'security': instance.security,
      'community': instance.community,
      'maintenance': instance.maintenance,
      'community_updates': instance.communityUpdates,
      'payment_reminders': instance.paymentReminders,
      'maintenance_alerts': instance.maintenanceAlerts,
    };
