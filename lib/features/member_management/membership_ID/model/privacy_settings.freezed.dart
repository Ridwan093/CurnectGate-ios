// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrivacySettings _$PrivacySettingsFromJson(Map<String, dynamic> json) {
  return _PrivacySettings.fromJson(json);
}

/// @nodoc
mixin _$PrivacySettings {
  @JsonKey(name: 'show_email', defaultValue: false)
  bool? get showEmail => throw _privateConstructorUsedError;
  @JsonKey(name: 'show_phone', defaultValue: false)
  bool? get showPhone => throw _privateConstructorUsedError;
  @JsonKey(name: 'profile_visibility', defaultValue: false)
  bool? get profileVisibility => throw _privateConstructorUsedError;

  /// Serializes this PrivacySettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivacySettingsCopyWith<PrivacySettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacySettingsCopyWith<$Res> {
  factory $PrivacySettingsCopyWith(
          PrivacySettings value, $Res Function(PrivacySettings) then) =
      _$PrivacySettingsCopyWithImpl<$Res, PrivacySettings>;
  @useResult
  $Res call(
      {@JsonKey(name: 'show_email', defaultValue: false) bool? showEmail,
      @JsonKey(name: 'show_phone', defaultValue: false) bool? showPhone,
      @JsonKey(name: 'profile_visibility', defaultValue: false)
      bool? profileVisibility});
}

/// @nodoc
class _$PrivacySettingsCopyWithImpl<$Res, $Val extends PrivacySettings>
    implements $PrivacySettingsCopyWith<$Res> {
  _$PrivacySettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showEmail = freezed,
    Object? showPhone = freezed,
    Object? profileVisibility = freezed,
  }) {
    return _then(_value.copyWith(
      showEmail: freezed == showEmail
          ? _value.showEmail
          : showEmail // ignore: cast_nullable_to_non_nullable
              as bool?,
      showPhone: freezed == showPhone
          ? _value.showPhone
          : showPhone // ignore: cast_nullable_to_non_nullable
              as bool?,
      profileVisibility: freezed == profileVisibility
          ? _value.profileVisibility
          : profileVisibility // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivacySettingsImplCopyWith<$Res>
    implements $PrivacySettingsCopyWith<$Res> {
  factory _$$PrivacySettingsImplCopyWith(_$PrivacySettingsImpl value,
          $Res Function(_$PrivacySettingsImpl) then) =
      __$$PrivacySettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'show_email', defaultValue: false) bool? showEmail,
      @JsonKey(name: 'show_phone', defaultValue: false) bool? showPhone,
      @JsonKey(name: 'profile_visibility', defaultValue: false)
      bool? profileVisibility});
}

/// @nodoc
class __$$PrivacySettingsImplCopyWithImpl<$Res>
    extends _$PrivacySettingsCopyWithImpl<$Res, _$PrivacySettingsImpl>
    implements _$$PrivacySettingsImplCopyWith<$Res> {
  __$$PrivacySettingsImplCopyWithImpl(
      _$PrivacySettingsImpl _value, $Res Function(_$PrivacySettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showEmail = freezed,
    Object? showPhone = freezed,
    Object? profileVisibility = freezed,
  }) {
    return _then(_$PrivacySettingsImpl(
      showEmail: freezed == showEmail
          ? _value.showEmail
          : showEmail // ignore: cast_nullable_to_non_nullable
              as bool?,
      showPhone: freezed == showPhone
          ? _value.showPhone
          : showPhone // ignore: cast_nullable_to_non_nullable
              as bool?,
      profileVisibility: freezed == profileVisibility
          ? _value.profileVisibility
          : profileVisibility // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, nullable: true, createToJson: true)
class _$PrivacySettingsImpl implements _PrivacySettings {
  const _$PrivacySettingsImpl(
      {@JsonKey(name: 'show_email', defaultValue: false) this.showEmail,
      @JsonKey(name: 'show_phone', defaultValue: false) this.showPhone,
      @JsonKey(name: 'profile_visibility', defaultValue: false)
      this.profileVisibility});

  factory _$PrivacySettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacySettingsImplFromJson(json);

  @override
  @JsonKey(name: 'show_email', defaultValue: false)
  final bool? showEmail;
  @override
  @JsonKey(name: 'show_phone', defaultValue: false)
  final bool? showPhone;
  @override
  @JsonKey(name: 'profile_visibility', defaultValue: false)
  final bool? profileVisibility;

  @override
  String toString() {
    return 'PrivacySettings(showEmail: $showEmail, showPhone: $showPhone, profileVisibility: $profileVisibility)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacySettingsImpl &&
            (identical(other.showEmail, showEmail) ||
                other.showEmail == showEmail) &&
            (identical(other.showPhone, showPhone) ||
                other.showPhone == showPhone) &&
            (identical(other.profileVisibility, profileVisibility) ||
                other.profileVisibility == profileVisibility));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, showEmail, showPhone, profileVisibility);

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacySettingsImplCopyWith<_$PrivacySettingsImpl> get copyWith =>
      __$$PrivacySettingsImplCopyWithImpl<_$PrivacySettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacySettingsImplToJson(
      this,
    );
  }
}

abstract class _PrivacySettings implements PrivacySettings {
  const factory _PrivacySettings(
      {@JsonKey(name: 'show_email', defaultValue: false) final bool? showEmail,
      @JsonKey(name: 'show_phone', defaultValue: false) final bool? showPhone,
      @JsonKey(name: 'profile_visibility', defaultValue: false)
      final bool? profileVisibility}) = _$PrivacySettingsImpl;

  factory _PrivacySettings.fromJson(Map<String, dynamic> json) =
      _$PrivacySettingsImpl.fromJson;

  @override
  @JsonKey(name: 'show_email', defaultValue: false)
  bool? get showEmail;
  @override
  @JsonKey(name: 'show_phone', defaultValue: false)
  bool? get showPhone;
  @override
  @JsonKey(name: 'profile_visibility', defaultValue: false)
  bool? get profileVisibility;

  /// Create a copy of PrivacySettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivacySettingsImplCopyWith<_$PrivacySettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
