// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) {
  return _UserSettings.fromJson(json);
}

/// @nodoc
mixin _$UserSettings {
  @JsonKey(name: 'privacy', defaultValue: PrivacySettings.empty)
  PrivacySettings get privacy => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_name')
  String? get bankName => throw _privateConstructorUsedError;
  @JsonKey(name: 'preferences', defaultValue: PrivacySettings.empty)
  PrivacySettings get preferences => throw _privateConstructorUsedError;
  @JsonKey(name: 'notifications', defaultValue: Notifications.empty)
  Notifications get notifications => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_account_name')
  String? get bankAccountName => throw _privateConstructorUsedError;
  @JsonKey(name: 'bank_account_number')
  String? get bankAccountNumber => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'household_permissions', defaultValue: HouseholdPermissions.empty)
  HouseholdPermissions get householdPermissions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'preferred_payment_method', defaultValue: '')
  String get preferredPaymentMethod => throw _privateConstructorUsedError;

  /// Serializes this UserSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSettingsCopyWith<UserSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsCopyWith<$Res> {
  factory $UserSettingsCopyWith(
          UserSettings value, $Res Function(UserSettings) then) =
      _$UserSettingsCopyWithImpl<$Res, UserSettings>;
  @useResult
  $Res call(
      {@JsonKey(name: 'privacy', defaultValue: PrivacySettings.empty)
      PrivacySettings privacy,
      @JsonKey(name: 'bank_name') String? bankName,
      @JsonKey(name: 'preferences', defaultValue: PrivacySettings.empty)
      PrivacySettings preferences,
      @JsonKey(name: 'notifications', defaultValue: Notifications.empty)
      Notifications notifications,
      @JsonKey(name: 'bank_account_name') String? bankAccountName,
      @JsonKey(name: 'bank_account_number') String? bankAccountNumber,
      @JsonKey(
          name: 'household_permissions',
          defaultValue: HouseholdPermissions.empty)
      HouseholdPermissions householdPermissions,
      @JsonKey(name: 'preferred_payment_method', defaultValue: '')
      String preferredPaymentMethod});

  $PrivacySettingsCopyWith<$Res> get privacy;
  $PrivacySettingsCopyWith<$Res> get preferences;
  $NotificationsCopyWith<$Res> get notifications;
  $HouseholdPermissionsCopyWith<$Res> get householdPermissions;
}

/// @nodoc
class _$UserSettingsCopyWithImpl<$Res, $Val extends UserSettings>
    implements $UserSettingsCopyWith<$Res> {
  _$UserSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privacy = null,
    Object? bankName = freezed,
    Object? preferences = null,
    Object? notifications = null,
    Object? bankAccountName = freezed,
    Object? bankAccountNumber = freezed,
    Object? householdPermissions = null,
    Object? preferredPaymentMethod = null,
  }) {
    return _then(_value.copyWith(
      privacy: null == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as PrivacySettings,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as PrivacySettings,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as Notifications,
      bankAccountName: freezed == bankAccountName
          ? _value.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountNumber: freezed == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      householdPermissions: null == householdPermissions
          ? _value.householdPermissions
          : householdPermissions // ignore: cast_nullable_to_non_nullable
              as HouseholdPermissions,
      preferredPaymentMethod: null == preferredPaymentMethod
          ? _value.preferredPaymentMethod
          : preferredPaymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrivacySettingsCopyWith<$Res> get privacy {
    return $PrivacySettingsCopyWith<$Res>(_value.privacy, (value) {
      return _then(_value.copyWith(privacy: value) as $Val);
    });
  }

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PrivacySettingsCopyWith<$Res> get preferences {
    return $PrivacySettingsCopyWith<$Res>(_value.preferences, (value) {
      return _then(_value.copyWith(preferences: value) as $Val);
    });
  }

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NotificationsCopyWith<$Res> get notifications {
    return $NotificationsCopyWith<$Res>(_value.notifications, (value) {
      return _then(_value.copyWith(notifications: value) as $Val);
    });
  }

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HouseholdPermissionsCopyWith<$Res> get householdPermissions {
    return $HouseholdPermissionsCopyWith<$Res>(_value.householdPermissions,
        (value) {
      return _then(_value.copyWith(householdPermissions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserSettingsImplCopyWith<$Res>
    implements $UserSettingsCopyWith<$Res> {
  factory _$$UserSettingsImplCopyWith(
          _$UserSettingsImpl value, $Res Function(_$UserSettingsImpl) then) =
      __$$UserSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'privacy', defaultValue: PrivacySettings.empty)
      PrivacySettings privacy,
      @JsonKey(name: 'bank_name') String? bankName,
      @JsonKey(name: 'preferences', defaultValue: PrivacySettings.empty)
      PrivacySettings preferences,
      @JsonKey(name: 'notifications', defaultValue: Notifications.empty)
      Notifications notifications,
      @JsonKey(name: 'bank_account_name') String? bankAccountName,
      @JsonKey(name: 'bank_account_number') String? bankAccountNumber,
      @JsonKey(
          name: 'household_permissions',
          defaultValue: HouseholdPermissions.empty)
      HouseholdPermissions householdPermissions,
      @JsonKey(name: 'preferred_payment_method', defaultValue: '')
      String preferredPaymentMethod});

  @override
  $PrivacySettingsCopyWith<$Res> get privacy;
  @override
  $PrivacySettingsCopyWith<$Res> get preferences;
  @override
  $NotificationsCopyWith<$Res> get notifications;
  @override
  $HouseholdPermissionsCopyWith<$Res> get householdPermissions;
}

/// @nodoc
class __$$UserSettingsImplCopyWithImpl<$Res>
    extends _$UserSettingsCopyWithImpl<$Res, _$UserSettingsImpl>
    implements _$$UserSettingsImplCopyWith<$Res> {
  __$$UserSettingsImplCopyWithImpl(
      _$UserSettingsImpl _value, $Res Function(_$UserSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privacy = null,
    Object? bankName = freezed,
    Object? preferences = null,
    Object? notifications = null,
    Object? bankAccountName = freezed,
    Object? bankAccountNumber = freezed,
    Object? householdPermissions = null,
    Object? preferredPaymentMethod = null,
  }) {
    return _then(_$UserSettingsImpl(
      privacy: null == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as PrivacySettings,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      preferences: null == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as PrivacySettings,
      notifications: null == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as Notifications,
      bankAccountName: freezed == bankAccountName
          ? _value.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountNumber: freezed == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      householdPermissions: null == householdPermissions
          ? _value.householdPermissions
          : householdPermissions // ignore: cast_nullable_to_non_nullable
              as HouseholdPermissions,
      preferredPaymentMethod: null == preferredPaymentMethod
          ? _value.preferredPaymentMethod
          : preferredPaymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$UserSettingsImpl implements _UserSettings {
  const _$UserSettingsImpl(
      {@JsonKey(name: 'privacy', defaultValue: PrivacySettings.empty)
      required this.privacy,
      @JsonKey(name: 'bank_name') this.bankName,
      @JsonKey(name: 'preferences', defaultValue: PrivacySettings.empty)
      required this.preferences,
      @JsonKey(name: 'notifications', defaultValue: Notifications.empty)
      required this.notifications,
      @JsonKey(name: 'bank_account_name') this.bankAccountName,
      @JsonKey(name: 'bank_account_number') this.bankAccountNumber,
      @JsonKey(
          name: 'household_permissions',
          defaultValue: HouseholdPermissions.empty)
      required this.householdPermissions,
      @JsonKey(name: 'preferred_payment_method', defaultValue: '')
      required this.preferredPaymentMethod});

  factory _$UserSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSettingsImplFromJson(json);

  @override
  @JsonKey(name: 'privacy', defaultValue: PrivacySettings.empty)
  final PrivacySettings privacy;
  @override
  @JsonKey(name: 'bank_name')
  final String? bankName;
  @override
  @JsonKey(name: 'preferences', defaultValue: PrivacySettings.empty)
  final PrivacySettings preferences;
  @override
  @JsonKey(name: 'notifications', defaultValue: Notifications.empty)
  final Notifications notifications;
  @override
  @JsonKey(name: 'bank_account_name')
  final String? bankAccountName;
  @override
  @JsonKey(name: 'bank_account_number')
  final String? bankAccountNumber;
  @override
  @JsonKey(
      name: 'household_permissions', defaultValue: HouseholdPermissions.empty)
  final HouseholdPermissions householdPermissions;
  @override
  @JsonKey(name: 'preferred_payment_method', defaultValue: '')
  final String preferredPaymentMethod;

  @override
  String toString() {
    return 'UserSettings(privacy: $privacy, bankName: $bankName, preferences: $preferences, notifications: $notifications, bankAccountName: $bankAccountName, bankAccountNumber: $bankAccountNumber, householdPermissions: $householdPermissions, preferredPaymentMethod: $preferredPaymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingsImpl &&
            (identical(other.privacy, privacy) || other.privacy == privacy) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.preferences, preferences) ||
                other.preferences == preferences) &&
            (identical(other.notifications, notifications) ||
                other.notifications == notifications) &&
            (identical(other.bankAccountName, bankAccountName) ||
                other.bankAccountName == bankAccountName) &&
            (identical(other.bankAccountNumber, bankAccountNumber) ||
                other.bankAccountNumber == bankAccountNumber) &&
            (identical(other.householdPermissions, householdPermissions) ||
                other.householdPermissions == householdPermissions) &&
            (identical(other.preferredPaymentMethod, preferredPaymentMethod) ||
                other.preferredPaymentMethod == preferredPaymentMethod));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      privacy,
      bankName,
      preferences,
      notifications,
      bankAccountName,
      bankAccountNumber,
      householdPermissions,
      preferredPaymentMethod);

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingsImplCopyWith<_$UserSettingsImpl> get copyWith =>
      __$$UserSettingsImplCopyWithImpl<_$UserSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSettingsImplToJson(
      this,
    );
  }
}

abstract class _UserSettings implements UserSettings {
  const factory _UserSettings(
      {@JsonKey(name: 'privacy', defaultValue: PrivacySettings.empty)
      required final PrivacySettings privacy,
      @JsonKey(name: 'bank_name') final String? bankName,
      @JsonKey(name: 'preferences', defaultValue: PrivacySettings.empty)
      required final PrivacySettings preferences,
      @JsonKey(name: 'notifications', defaultValue: Notifications.empty)
      required final Notifications notifications,
      @JsonKey(name: 'bank_account_name') final String? bankAccountName,
      @JsonKey(name: 'bank_account_number') final String? bankAccountNumber,
      @JsonKey(
          name: 'household_permissions',
          defaultValue: HouseholdPermissions.empty)
      required final HouseholdPermissions householdPermissions,
      @JsonKey(name: 'preferred_payment_method', defaultValue: '')
      required final String preferredPaymentMethod}) = _$UserSettingsImpl;

  factory _UserSettings.fromJson(Map<String, dynamic> json) =
      _$UserSettingsImpl.fromJson;

  @override
  @JsonKey(name: 'privacy', defaultValue: PrivacySettings.empty)
  PrivacySettings get privacy;
  @override
  @JsonKey(name: 'bank_name')
  String? get bankName;
  @override
  @JsonKey(name: 'preferences', defaultValue: PrivacySettings.empty)
  PrivacySettings get preferences;
  @override
  @JsonKey(name: 'notifications', defaultValue: Notifications.empty)
  Notifications get notifications;
  @override
  @JsonKey(name: 'bank_account_name')
  String? get bankAccountName;
  @override
  @JsonKey(name: 'bank_account_number')
  String? get bankAccountNumber;
  @override
  @JsonKey(
      name: 'household_permissions', defaultValue: HouseholdPermissions.empty)
  HouseholdPermissions get householdPermissions;
  @override
  @JsonKey(name: 'preferred_payment_method', defaultValue: '')
  String get preferredPaymentMethod;

  /// Create a copy of UserSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSettingsImplCopyWith<_$UserSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
