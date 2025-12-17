import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'voting_settings_item.freezed.dart';
part 'voting_settings_item.g.dart';

@freezed
class VotingSettingsItem with _$VotingSettingsItem {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory VotingSettingsItem({
    int? id,
    int? estateId,
    bool? votingEnabled,
    bool? requireAdminApproval,
    bool? allowAnonymousVoting,
    bool? allowEarlyResults,
    int? minimumParticipationPercentage,
    List<String>? allowedPollTypes,
    List<String>? defaultEligibleRoles,
    int? maxActivePolls,
    int? pollDurationMinHours,
    int? pollDurationMaxDays,
    bool? sendNotifications,
    bool? sendReminders,
    int? reminderHoursBeforeClose,
    List<String>? notificationChannels,
    String? votingRules,
    String? disclaimerText,
    dynamic advancedSettings,
    String? createdAt,
    String? updatedAt,
  }) = _VotingSettingsItem;

  factory VotingSettingsItem.fromJson(Map<String, dynamic> json) =>
      _$VotingSettingsItemFromJson(json);

  factory VotingSettingsItem.safeFromJson(Map<String, dynamic>? json) {
    return VotingSettingsItem(
      id: NullSafetyHelper.safeInt(json?['id']),
      estateId: NullSafetyHelper.safeInt(json?['estate_id']),
      votingEnabled: NullSafetyHelper.safeBool(json?['voting_enabled']),
      requireAdminApproval: NullSafetyHelper.safeBool(json?['require_admin_approval']),
      allowAnonymousVoting: NullSafetyHelper.safeBool(json?['allow_anonymous_voting']),
      allowEarlyResults: NullSafetyHelper.safeBool(json?['allow_early_results']),
      minimumParticipationPercentage: NullSafetyHelper.safeInt(json?['minimum_participation_percentage']),
      allowedPollTypes: (NullSafetyHelper.safeList(json?['allowed_poll_types'])).map((e) => e.toString()).toList(),
      defaultEligibleRoles: (NullSafetyHelper.safeList(json?['default_eligible_roles']) ).map((e) => e.toString()).toList(),
      maxActivePolls: NullSafetyHelper.safeInt(json?['max_active_polls']),
      pollDurationMinHours: NullSafetyHelper.safeInt(json?['poll_duration_min_hours']),
      pollDurationMaxDays: NullSafetyHelper.safeInt(json?['poll_duration_max_days']),
      sendNotifications: NullSafetyHelper.safeBool(json?['send_notifications']),
      sendReminders: NullSafetyHelper.safeBool(json?['send_reminders']),
      reminderHoursBeforeClose: NullSafetyHelper.safeInt(json?['reminder_hours_before_close']),
      notificationChannels: (NullSafetyHelper.safeList(json?['notification_channels'])).map((e) => e.toString()).toList(),
      votingRules: NullSafetyHelper.safeString(json?['voting_rules']),
      disclaimerText: NullSafetyHelper.safeString(json?['disclaimer_text']),
      advancedSettings: json?['advanced_settings'],
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
    );
  }

  factory VotingSettingsItem.empty() => const VotingSettingsItem(
        id: 0,
        estateId: 0,
        votingEnabled: false,
        requireAdminApproval: false,
        allowAnonymousVoting: false,
        allowEarlyResults: false,
        minimumParticipationPercentage: 0,
        allowedPollTypes: [],
        defaultEligibleRoles: [],
        maxActivePolls: 0,
        pollDurationMinHours: 0,
        pollDurationMaxDays: 0,
        sendNotifications: false,
        sendReminders: false,
        reminderHoursBeforeClose: 0,
        notificationChannels: [],
        votingRules: '',
        disclaimerText: '',
        advancedSettings: null,
        createdAt: '',
        updatedAt: '',
      );
}
