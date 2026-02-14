// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chairperson_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChairpersonSettings _$ChairpersonSettingsFromJson(Map<String, dynamic> json) {
  return _ChairpersonSettings.fromJson(json);
}

/// @nodoc
mixin _$ChairpersonSettings {
  List<PrivacySetting>? get privacy => throw _privateConstructorUsedError;
  List<PreferenceSetting>? get preferences =>
      throw _privateConstructorUsedError;
  List<NotificationSetting>? get notifications =>
      throw _privateConstructorUsedError;
  String? get bankName => throw _privateConstructorUsedError;
  String? get bankAccountName => throw _privateConstructorUsedError;
  String? get bankAccountNumber => throw _privateConstructorUsedError;
  HouseholdPermissions? get householdPermissions =>
      throw _privateConstructorUsedError;
  String? get preferredPaymentMethod => throw _privateConstructorUsedError;

  /// Serializes this ChairpersonSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChairpersonSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChairpersonSettingsCopyWith<ChairpersonSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChairpersonSettingsCopyWith<$Res> {
  factory $ChairpersonSettingsCopyWith(
          ChairpersonSettings value, $Res Function(ChairpersonSettings) then) =
      _$ChairpersonSettingsCopyWithImpl<$Res, ChairpersonSettings>;
  @useResult
  $Res call(
      {List<PrivacySetting>? privacy,
      List<PreferenceSetting>? preferences,
      List<NotificationSetting>? notifications,
      String? bankName,
      String? bankAccountName,
      String? bankAccountNumber,
      HouseholdPermissions? householdPermissions,
      String? preferredPaymentMethod});

  $HouseholdPermissionsCopyWith<$Res>? get householdPermissions;
}

/// @nodoc
class _$ChairpersonSettingsCopyWithImpl<$Res, $Val extends ChairpersonSettings>
    implements $ChairpersonSettingsCopyWith<$Res> {
  _$ChairpersonSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChairpersonSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privacy = freezed,
    Object? preferences = freezed,
    Object? notifications = freezed,
    Object? bankName = freezed,
    Object? bankAccountName = freezed,
    Object? bankAccountNumber = freezed,
    Object? householdPermissions = freezed,
    Object? preferredPaymentMethod = freezed,
  }) {
    return _then(_value.copyWith(
      privacy: freezed == privacy
          ? _value.privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as List<PrivacySetting>?,
      preferences: freezed == preferences
          ? _value.preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as List<PreferenceSetting>?,
      notifications: freezed == notifications
          ? _value.notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationSetting>?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountName: freezed == bankAccountName
          ? _value.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountNumber: freezed == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      householdPermissions: freezed == householdPermissions
          ? _value.householdPermissions
          : householdPermissions // ignore: cast_nullable_to_non_nullable
              as HouseholdPermissions?,
      preferredPaymentMethod: freezed == preferredPaymentMethod
          ? _value.preferredPaymentMethod
          : preferredPaymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of ChairpersonSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HouseholdPermissionsCopyWith<$Res>? get householdPermissions {
    if (_value.householdPermissions == null) {
      return null;
    }

    return $HouseholdPermissionsCopyWith<$Res>(_value.householdPermissions!,
        (value) {
      return _then(_value.copyWith(householdPermissions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ChairpersonSettingsImplCopyWith<$Res>
    implements $ChairpersonSettingsCopyWith<$Res> {
  factory _$$ChairpersonSettingsImplCopyWith(_$ChairpersonSettingsImpl value,
          $Res Function(_$ChairpersonSettingsImpl) then) =
      __$$ChairpersonSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<PrivacySetting>? privacy,
      List<PreferenceSetting>? preferences,
      List<NotificationSetting>? notifications,
      String? bankName,
      String? bankAccountName,
      String? bankAccountNumber,
      HouseholdPermissions? householdPermissions,
      String? preferredPaymentMethod});

  @override
  $HouseholdPermissionsCopyWith<$Res>? get householdPermissions;
}

/// @nodoc
class __$$ChairpersonSettingsImplCopyWithImpl<$Res>
    extends _$ChairpersonSettingsCopyWithImpl<$Res, _$ChairpersonSettingsImpl>
    implements _$$ChairpersonSettingsImplCopyWith<$Res> {
  __$$ChairpersonSettingsImplCopyWithImpl(_$ChairpersonSettingsImpl _value,
      $Res Function(_$ChairpersonSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChairpersonSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? privacy = freezed,
    Object? preferences = freezed,
    Object? notifications = freezed,
    Object? bankName = freezed,
    Object? bankAccountName = freezed,
    Object? bankAccountNumber = freezed,
    Object? householdPermissions = freezed,
    Object? preferredPaymentMethod = freezed,
  }) {
    return _then(_$ChairpersonSettingsImpl(
      privacy: freezed == privacy
          ? _value._privacy
          : privacy // ignore: cast_nullable_to_non_nullable
              as List<PrivacySetting>?,
      preferences: freezed == preferences
          ? _value._preferences
          : preferences // ignore: cast_nullable_to_non_nullable
              as List<PreferenceSetting>?,
      notifications: freezed == notifications
          ? _value._notifications
          : notifications // ignore: cast_nullable_to_non_nullable
              as List<NotificationSetting>?,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountName: freezed == bankAccountName
          ? _value.bankAccountName
          : bankAccountName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankAccountNumber: freezed == bankAccountNumber
          ? _value.bankAccountNumber
          : bankAccountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      householdPermissions: freezed == householdPermissions
          ? _value.householdPermissions
          : householdPermissions // ignore: cast_nullable_to_non_nullable
              as HouseholdPermissions?,
      preferredPaymentMethod: freezed == preferredPaymentMethod
          ? _value.preferredPaymentMethod
          : preferredPaymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ChairpersonSettingsImpl implements _ChairpersonSettings {
  const _$ChairpersonSettingsImpl(
      {final List<PrivacySetting>? privacy,
      final List<PreferenceSetting>? preferences,
      final List<NotificationSetting>? notifications,
      this.bankName,
      this.bankAccountName,
      this.bankAccountNumber,
      this.householdPermissions,
      this.preferredPaymentMethod})
      : _privacy = privacy,
        _preferences = preferences,
        _notifications = notifications;

  factory _$ChairpersonSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChairpersonSettingsImplFromJson(json);

  final List<PrivacySetting>? _privacy;
  @override
  List<PrivacySetting>? get privacy {
    final value = _privacy;
    if (value == null) return null;
    if (_privacy is EqualUnmodifiableListView) return _privacy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PreferenceSetting>? _preferences;
  @override
  List<PreferenceSetting>? get preferences {
    final value = _preferences;
    if (value == null) return null;
    if (_preferences is EqualUnmodifiableListView) return _preferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<NotificationSetting>? _notifications;
  @override
  List<NotificationSetting>? get notifications {
    final value = _notifications;
    if (value == null) return null;
    if (_notifications is EqualUnmodifiableListView) return _notifications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? bankName;
  @override
  final String? bankAccountName;
  @override
  final String? bankAccountNumber;
  @override
  final HouseholdPermissions? householdPermissions;
  @override
  final String? preferredPaymentMethod;

  @override
  String toString() {
    return 'ChairpersonSettings(privacy: $privacy, preferences: $preferences, notifications: $notifications, bankName: $bankName, bankAccountName: $bankAccountName, bankAccountNumber: $bankAccountNumber, householdPermissions: $householdPermissions, preferredPaymentMethod: $preferredPaymentMethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChairpersonSettingsImpl &&
            const DeepCollectionEquality().equals(other._privacy, _privacy) &&
            const DeepCollectionEquality()
                .equals(other._preferences, _preferences) &&
            const DeepCollectionEquality()
                .equals(other._notifications, _notifications) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
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
      const DeepCollectionEquality().hash(_privacy),
      const DeepCollectionEquality().hash(_preferences),
      const DeepCollectionEquality().hash(_notifications),
      bankName,
      bankAccountName,
      bankAccountNumber,
      householdPermissions,
      preferredPaymentMethod);

  /// Create a copy of ChairpersonSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChairpersonSettingsImplCopyWith<_$ChairpersonSettingsImpl> get copyWith =>
      __$$ChairpersonSettingsImplCopyWithImpl<_$ChairpersonSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChairpersonSettingsImplToJson(
      this,
    );
  }
}

abstract class _ChairpersonSettings implements ChairpersonSettings {
  const factory _ChairpersonSettings(
      {final List<PrivacySetting>? privacy,
      final List<PreferenceSetting>? preferences,
      final List<NotificationSetting>? notifications,
      final String? bankName,
      final String? bankAccountName,
      final String? bankAccountNumber,
      final HouseholdPermissions? householdPermissions,
      final String? preferredPaymentMethod}) = _$ChairpersonSettingsImpl;

  factory _ChairpersonSettings.fromJson(Map<String, dynamic> json) =
      _$ChairpersonSettingsImpl.fromJson;

  @override
  List<PrivacySetting>? get privacy;
  @override
  List<PreferenceSetting>? get preferences;
  @override
  List<NotificationSetting>? get notifications;
  @override
  String? get bankName;
  @override
  String? get bankAccountName;
  @override
  String? get bankAccountNumber;
  @override
  HouseholdPermissions? get householdPermissions;
  @override
  String? get preferredPaymentMethod;

  /// Create a copy of ChairpersonSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChairpersonSettingsImplCopyWith<_$ChairpersonSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
