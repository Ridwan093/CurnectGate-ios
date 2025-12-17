// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'voting_settings_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VotingSettingsItem _$VotingSettingsItemFromJson(Map<String, dynamic> json) {
  return _VotingSettingsItem.fromJson(json);
}

/// @nodoc
mixin _$VotingSettingsItem {
  int? get id => throw _privateConstructorUsedError;
  int? get estateId => throw _privateConstructorUsedError;
  bool? get votingEnabled => throw _privateConstructorUsedError;
  bool? get requireAdminApproval => throw _privateConstructorUsedError;
  bool? get allowAnonymousVoting => throw _privateConstructorUsedError;
  bool? get allowEarlyResults => throw _privateConstructorUsedError;
  int? get minimumParticipationPercentage => throw _privateConstructorUsedError;
  List<String>? get allowedPollTypes => throw _privateConstructorUsedError;
  List<String>? get defaultEligibleRoles => throw _privateConstructorUsedError;
  int? get maxActivePolls => throw _privateConstructorUsedError;
  int? get pollDurationMinHours => throw _privateConstructorUsedError;
  int? get pollDurationMaxDays => throw _privateConstructorUsedError;
  bool? get sendNotifications => throw _privateConstructorUsedError;
  bool? get sendReminders => throw _privateConstructorUsedError;
  int? get reminderHoursBeforeClose => throw _privateConstructorUsedError;
  List<String>? get notificationChannels => throw _privateConstructorUsedError;
  String? get votingRules => throw _privateConstructorUsedError;
  String? get disclaimerText => throw _privateConstructorUsedError;
  dynamic get advancedSettings => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this VotingSettingsItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VotingSettingsItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VotingSettingsItemCopyWith<VotingSettingsItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VotingSettingsItemCopyWith<$Res> {
  factory $VotingSettingsItemCopyWith(
          VotingSettingsItem value, $Res Function(VotingSettingsItem) then) =
      _$VotingSettingsItemCopyWithImpl<$Res, VotingSettingsItem>;
  @useResult
  $Res call(
      {int? id,
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
      String? updatedAt});
}

/// @nodoc
class _$VotingSettingsItemCopyWithImpl<$Res, $Val extends VotingSettingsItem>
    implements $VotingSettingsItemCopyWith<$Res> {
  _$VotingSettingsItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VotingSettingsItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estateId = freezed,
    Object? votingEnabled = freezed,
    Object? requireAdminApproval = freezed,
    Object? allowAnonymousVoting = freezed,
    Object? allowEarlyResults = freezed,
    Object? minimumParticipationPercentage = freezed,
    Object? allowedPollTypes = freezed,
    Object? defaultEligibleRoles = freezed,
    Object? maxActivePolls = freezed,
    Object? pollDurationMinHours = freezed,
    Object? pollDurationMaxDays = freezed,
    Object? sendNotifications = freezed,
    Object? sendReminders = freezed,
    Object? reminderHoursBeforeClose = freezed,
    Object? notificationChannels = freezed,
    Object? votingRules = freezed,
    Object? disclaimerText = freezed,
    Object? advancedSettings = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      votingEnabled: freezed == votingEnabled
          ? _value.votingEnabled
          : votingEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      requireAdminApproval: freezed == requireAdminApproval
          ? _value.requireAdminApproval
          : requireAdminApproval // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowAnonymousVoting: freezed == allowAnonymousVoting
          ? _value.allowAnonymousVoting
          : allowAnonymousVoting // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowEarlyResults: freezed == allowEarlyResults
          ? _value.allowEarlyResults
          : allowEarlyResults // ignore: cast_nullable_to_non_nullable
              as bool?,
      minimumParticipationPercentage: freezed == minimumParticipationPercentage
          ? _value.minimumParticipationPercentage
          : minimumParticipationPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      allowedPollTypes: freezed == allowedPollTypes
          ? _value.allowedPollTypes
          : allowedPollTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      defaultEligibleRoles: freezed == defaultEligibleRoles
          ? _value.defaultEligibleRoles
          : defaultEligibleRoles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      maxActivePolls: freezed == maxActivePolls
          ? _value.maxActivePolls
          : maxActivePolls // ignore: cast_nullable_to_non_nullable
              as int?,
      pollDurationMinHours: freezed == pollDurationMinHours
          ? _value.pollDurationMinHours
          : pollDurationMinHours // ignore: cast_nullable_to_non_nullable
              as int?,
      pollDurationMaxDays: freezed == pollDurationMaxDays
          ? _value.pollDurationMaxDays
          : pollDurationMaxDays // ignore: cast_nullable_to_non_nullable
              as int?,
      sendNotifications: freezed == sendNotifications
          ? _value.sendNotifications
          : sendNotifications // ignore: cast_nullable_to_non_nullable
              as bool?,
      sendReminders: freezed == sendReminders
          ? _value.sendReminders
          : sendReminders // ignore: cast_nullable_to_non_nullable
              as bool?,
      reminderHoursBeforeClose: freezed == reminderHoursBeforeClose
          ? _value.reminderHoursBeforeClose
          : reminderHoursBeforeClose // ignore: cast_nullable_to_non_nullable
              as int?,
      notificationChannels: freezed == notificationChannels
          ? _value.notificationChannels
          : notificationChannels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      votingRules: freezed == votingRules
          ? _value.votingRules
          : votingRules // ignore: cast_nullable_to_non_nullable
              as String?,
      disclaimerText: freezed == disclaimerText
          ? _value.disclaimerText
          : disclaimerText // ignore: cast_nullable_to_non_nullable
              as String?,
      advancedSettings: freezed == advancedSettings
          ? _value.advancedSettings
          : advancedSettings // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VotingSettingsItemImplCopyWith<$Res>
    implements $VotingSettingsItemCopyWith<$Res> {
  factory _$$VotingSettingsItemImplCopyWith(_$VotingSettingsItemImpl value,
          $Res Function(_$VotingSettingsItemImpl) then) =
      __$$VotingSettingsItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
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
      String? updatedAt});
}

/// @nodoc
class __$$VotingSettingsItemImplCopyWithImpl<$Res>
    extends _$VotingSettingsItemCopyWithImpl<$Res, _$VotingSettingsItemImpl>
    implements _$$VotingSettingsItemImplCopyWith<$Res> {
  __$$VotingSettingsItemImplCopyWithImpl(_$VotingSettingsItemImpl _value,
      $Res Function(_$VotingSettingsItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of VotingSettingsItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estateId = freezed,
    Object? votingEnabled = freezed,
    Object? requireAdminApproval = freezed,
    Object? allowAnonymousVoting = freezed,
    Object? allowEarlyResults = freezed,
    Object? minimumParticipationPercentage = freezed,
    Object? allowedPollTypes = freezed,
    Object? defaultEligibleRoles = freezed,
    Object? maxActivePolls = freezed,
    Object? pollDurationMinHours = freezed,
    Object? pollDurationMaxDays = freezed,
    Object? sendNotifications = freezed,
    Object? sendReminders = freezed,
    Object? reminderHoursBeforeClose = freezed,
    Object? notificationChannels = freezed,
    Object? votingRules = freezed,
    Object? disclaimerText = freezed,
    Object? advancedSettings = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$VotingSettingsItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      votingEnabled: freezed == votingEnabled
          ? _value.votingEnabled
          : votingEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      requireAdminApproval: freezed == requireAdminApproval
          ? _value.requireAdminApproval
          : requireAdminApproval // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowAnonymousVoting: freezed == allowAnonymousVoting
          ? _value.allowAnonymousVoting
          : allowAnonymousVoting // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowEarlyResults: freezed == allowEarlyResults
          ? _value.allowEarlyResults
          : allowEarlyResults // ignore: cast_nullable_to_non_nullable
              as bool?,
      minimumParticipationPercentage: freezed == minimumParticipationPercentage
          ? _value.minimumParticipationPercentage
          : minimumParticipationPercentage // ignore: cast_nullable_to_non_nullable
              as int?,
      allowedPollTypes: freezed == allowedPollTypes
          ? _value._allowedPollTypes
          : allowedPollTypes // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      defaultEligibleRoles: freezed == defaultEligibleRoles
          ? _value._defaultEligibleRoles
          : defaultEligibleRoles // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      maxActivePolls: freezed == maxActivePolls
          ? _value.maxActivePolls
          : maxActivePolls // ignore: cast_nullable_to_non_nullable
              as int?,
      pollDurationMinHours: freezed == pollDurationMinHours
          ? _value.pollDurationMinHours
          : pollDurationMinHours // ignore: cast_nullable_to_non_nullable
              as int?,
      pollDurationMaxDays: freezed == pollDurationMaxDays
          ? _value.pollDurationMaxDays
          : pollDurationMaxDays // ignore: cast_nullable_to_non_nullable
              as int?,
      sendNotifications: freezed == sendNotifications
          ? _value.sendNotifications
          : sendNotifications // ignore: cast_nullable_to_non_nullable
              as bool?,
      sendReminders: freezed == sendReminders
          ? _value.sendReminders
          : sendReminders // ignore: cast_nullable_to_non_nullable
              as bool?,
      reminderHoursBeforeClose: freezed == reminderHoursBeforeClose
          ? _value.reminderHoursBeforeClose
          : reminderHoursBeforeClose // ignore: cast_nullable_to_non_nullable
              as int?,
      notificationChannels: freezed == notificationChannels
          ? _value._notificationChannels
          : notificationChannels // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      votingRules: freezed == votingRules
          ? _value.votingRules
          : votingRules // ignore: cast_nullable_to_non_nullable
              as String?,
      disclaimerText: freezed == disclaimerText
          ? _value.disclaimerText
          : disclaimerText // ignore: cast_nullable_to_non_nullable
              as String?,
      advancedSettings: freezed == advancedSettings
          ? _value.advancedSettings
          : advancedSettings // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$VotingSettingsItemImpl implements _VotingSettingsItem {
  const _$VotingSettingsItemImpl(
      {this.id,
      this.estateId,
      this.votingEnabled,
      this.requireAdminApproval,
      this.allowAnonymousVoting,
      this.allowEarlyResults,
      this.minimumParticipationPercentage,
      final List<String>? allowedPollTypes,
      final List<String>? defaultEligibleRoles,
      this.maxActivePolls,
      this.pollDurationMinHours,
      this.pollDurationMaxDays,
      this.sendNotifications,
      this.sendReminders,
      this.reminderHoursBeforeClose,
      final List<String>? notificationChannels,
      this.votingRules,
      this.disclaimerText,
      this.advancedSettings,
      this.createdAt,
      this.updatedAt})
      : _allowedPollTypes = allowedPollTypes,
        _defaultEligibleRoles = defaultEligibleRoles,
        _notificationChannels = notificationChannels;

  factory _$VotingSettingsItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$VotingSettingsItemImplFromJson(json);

  @override
  final int? id;
  @override
  final int? estateId;
  @override
  final bool? votingEnabled;
  @override
  final bool? requireAdminApproval;
  @override
  final bool? allowAnonymousVoting;
  @override
  final bool? allowEarlyResults;
  @override
  final int? minimumParticipationPercentage;
  final List<String>? _allowedPollTypes;
  @override
  List<String>? get allowedPollTypes {
    final value = _allowedPollTypes;
    if (value == null) return null;
    if (_allowedPollTypes is EqualUnmodifiableListView)
      return _allowedPollTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _defaultEligibleRoles;
  @override
  List<String>? get defaultEligibleRoles {
    final value = _defaultEligibleRoles;
    if (value == null) return null;
    if (_defaultEligibleRoles is EqualUnmodifiableListView)
      return _defaultEligibleRoles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? maxActivePolls;
  @override
  final int? pollDurationMinHours;
  @override
  final int? pollDurationMaxDays;
  @override
  final bool? sendNotifications;
  @override
  final bool? sendReminders;
  @override
  final int? reminderHoursBeforeClose;
  final List<String>? _notificationChannels;
  @override
  List<String>? get notificationChannels {
    final value = _notificationChannels;
    if (value == null) return null;
    if (_notificationChannels is EqualUnmodifiableListView)
      return _notificationChannels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? votingRules;
  @override
  final String? disclaimerText;
  @override
  final dynamic advancedSettings;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'VotingSettingsItem(id: $id, estateId: $estateId, votingEnabled: $votingEnabled, requireAdminApproval: $requireAdminApproval, allowAnonymousVoting: $allowAnonymousVoting, allowEarlyResults: $allowEarlyResults, minimumParticipationPercentage: $minimumParticipationPercentage, allowedPollTypes: $allowedPollTypes, defaultEligibleRoles: $defaultEligibleRoles, maxActivePolls: $maxActivePolls, pollDurationMinHours: $pollDurationMinHours, pollDurationMaxDays: $pollDurationMaxDays, sendNotifications: $sendNotifications, sendReminders: $sendReminders, reminderHoursBeforeClose: $reminderHoursBeforeClose, notificationChannels: $notificationChannels, votingRules: $votingRules, disclaimerText: $disclaimerText, advancedSettings: $advancedSettings, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VotingSettingsItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            (identical(other.votingEnabled, votingEnabled) ||
                other.votingEnabled == votingEnabled) &&
            (identical(other.requireAdminApproval, requireAdminApproval) ||
                other.requireAdminApproval == requireAdminApproval) &&
            (identical(other.allowAnonymousVoting, allowAnonymousVoting) ||
                other.allowAnonymousVoting == allowAnonymousVoting) &&
            (identical(other.allowEarlyResults, allowEarlyResults) ||
                other.allowEarlyResults == allowEarlyResults) &&
            (identical(other.minimumParticipationPercentage,
                    minimumParticipationPercentage) ||
                other.minimumParticipationPercentage ==
                    minimumParticipationPercentage) &&
            const DeepCollectionEquality()
                .equals(other._allowedPollTypes, _allowedPollTypes) &&
            const DeepCollectionEquality()
                .equals(other._defaultEligibleRoles, _defaultEligibleRoles) &&
            (identical(other.maxActivePolls, maxActivePolls) ||
                other.maxActivePolls == maxActivePolls) &&
            (identical(other.pollDurationMinHours, pollDurationMinHours) ||
                other.pollDurationMinHours == pollDurationMinHours) &&
            (identical(other.pollDurationMaxDays, pollDurationMaxDays) ||
                other.pollDurationMaxDays == pollDurationMaxDays) &&
            (identical(other.sendNotifications, sendNotifications) ||
                other.sendNotifications == sendNotifications) &&
            (identical(other.sendReminders, sendReminders) ||
                other.sendReminders == sendReminders) &&
            (identical(
                    other.reminderHoursBeforeClose, reminderHoursBeforeClose) ||
                other.reminderHoursBeforeClose == reminderHoursBeforeClose) &&
            const DeepCollectionEquality()
                .equals(other._notificationChannels, _notificationChannels) &&
            (identical(other.votingRules, votingRules) ||
                other.votingRules == votingRules) &&
            (identical(other.disclaimerText, disclaimerText) ||
                other.disclaimerText == disclaimerText) &&
            const DeepCollectionEquality()
                .equals(other.advancedSettings, advancedSettings) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        estateId,
        votingEnabled,
        requireAdminApproval,
        allowAnonymousVoting,
        allowEarlyResults,
        minimumParticipationPercentage,
        const DeepCollectionEquality().hash(_allowedPollTypes),
        const DeepCollectionEquality().hash(_defaultEligibleRoles),
        maxActivePolls,
        pollDurationMinHours,
        pollDurationMaxDays,
        sendNotifications,
        sendReminders,
        reminderHoursBeforeClose,
        const DeepCollectionEquality().hash(_notificationChannels),
        votingRules,
        disclaimerText,
        const DeepCollectionEquality().hash(advancedSettings),
        createdAt,
        updatedAt
      ]);

  /// Create a copy of VotingSettingsItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VotingSettingsItemImplCopyWith<_$VotingSettingsItemImpl> get copyWith =>
      __$$VotingSettingsItemImplCopyWithImpl<_$VotingSettingsItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VotingSettingsItemImplToJson(
      this,
    );
  }
}

abstract class _VotingSettingsItem implements VotingSettingsItem {
  const factory _VotingSettingsItem(
      {final int? id,
      final int? estateId,
      final bool? votingEnabled,
      final bool? requireAdminApproval,
      final bool? allowAnonymousVoting,
      final bool? allowEarlyResults,
      final int? minimumParticipationPercentage,
      final List<String>? allowedPollTypes,
      final List<String>? defaultEligibleRoles,
      final int? maxActivePolls,
      final int? pollDurationMinHours,
      final int? pollDurationMaxDays,
      final bool? sendNotifications,
      final bool? sendReminders,
      final int? reminderHoursBeforeClose,
      final List<String>? notificationChannels,
      final String? votingRules,
      final String? disclaimerText,
      final dynamic advancedSettings,
      final String? createdAt,
      final String? updatedAt}) = _$VotingSettingsItemImpl;

  factory _VotingSettingsItem.fromJson(Map<String, dynamic> json) =
      _$VotingSettingsItemImpl.fromJson;

  @override
  int? get id;
  @override
  int? get estateId;
  @override
  bool? get votingEnabled;
  @override
  bool? get requireAdminApproval;
  @override
  bool? get allowAnonymousVoting;
  @override
  bool? get allowEarlyResults;
  @override
  int? get minimumParticipationPercentage;
  @override
  List<String>? get allowedPollTypes;
  @override
  List<String>? get defaultEligibleRoles;
  @override
  int? get maxActivePolls;
  @override
  int? get pollDurationMinHours;
  @override
  int? get pollDurationMaxDays;
  @override
  bool? get sendNotifications;
  @override
  bool? get sendReminders;
  @override
  int? get reminderHoursBeforeClose;
  @override
  List<String>? get notificationChannels;
  @override
  String? get votingRules;
  @override
  String? get disclaimerText;
  @override
  dynamic get advancedSettings;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of VotingSettingsItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VotingSettingsItemImplCopyWith<_$VotingSettingsItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
