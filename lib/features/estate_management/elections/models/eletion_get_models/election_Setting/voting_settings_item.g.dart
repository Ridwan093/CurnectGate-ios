// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voting_settings_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VotingSettingsItemImpl _$$VotingSettingsItemImplFromJson(
        Map<String, dynamic> json) =>
    _$VotingSettingsItemImpl(
      id: (json['id'] as num?)?.toInt(),
      estateId: (json['estate_id'] as num?)?.toInt(),
      votingEnabled: json['voting_enabled'] as bool?,
      requireAdminApproval: json['require_admin_approval'] as bool?,
      allowAnonymousVoting: json['allow_anonymous_voting'] as bool?,
      allowEarlyResults: json['allow_early_results'] as bool?,
      minimumParticipationPercentage:
          (json['minimum_participation_percentage'] as num?)?.toInt(),
      allowedPollTypes: (json['allowed_poll_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      defaultEligibleRoles: (json['default_eligible_roles'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      maxActivePolls: (json['max_active_polls'] as num?)?.toInt(),
      pollDurationMinHours: (json['poll_duration_min_hours'] as num?)?.toInt(),
      pollDurationMaxDays: (json['poll_duration_max_days'] as num?)?.toInt(),
      sendNotifications: json['send_notifications'] as bool?,
      sendReminders: json['send_reminders'] as bool?,
      reminderHoursBeforeClose:
          (json['reminder_hours_before_close'] as num?)?.toInt(),
      notificationChannels: (json['notification_channels'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      votingRules: json['voting_rules'] as String?,
      disclaimerText: json['disclaimer_text'] as String?,
      advancedSettings: json['advanced_settings'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$VotingSettingsItemImplToJson(
        _$VotingSettingsItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'estate_id': instance.estateId,
      'voting_enabled': instance.votingEnabled,
      'require_admin_approval': instance.requireAdminApproval,
      'allow_anonymous_voting': instance.allowAnonymousVoting,
      'allow_early_results': instance.allowEarlyResults,
      'minimum_participation_percentage':
          instance.minimumParticipationPercentage,
      'allowed_poll_types': instance.allowedPollTypes,
      'default_eligible_roles': instance.defaultEligibleRoles,
      'max_active_polls': instance.maxActivePolls,
      'poll_duration_min_hours': instance.pollDurationMinHours,
      'poll_duration_max_days': instance.pollDurationMaxDays,
      'send_notifications': instance.sendNotifications,
      'send_reminders': instance.sendReminders,
      'reminder_hours_before_close': instance.reminderHoursBeforeClose,
      'notification_channels': instance.notificationChannels,
      'voting_rules': instance.votingRules,
      'disclaimer_text': instance.disclaimerText,
      'advanced_settings': instance.advancedSettings,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
