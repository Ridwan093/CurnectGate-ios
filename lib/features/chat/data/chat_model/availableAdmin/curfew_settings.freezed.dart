// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curfew_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurfewSettings _$CurfewSettingsFromJson(Map<String, dynamic> json) {
  return _CurfewSettings.fromJson(json);
}

/// @nodoc
mixin _$CurfewSettings {
  bool? get enabled => throw _privateConstructorUsedError;
  List<CurfewRestriction>? get restrictions =>
      throw _privateConstructorUsedError;

  /// Serializes this CurfewSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurfewSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurfewSettingsCopyWith<CurfewSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurfewSettingsCopyWith<$Res> {
  factory $CurfewSettingsCopyWith(
          CurfewSettings value, $Res Function(CurfewSettings) then) =
      _$CurfewSettingsCopyWithImpl<$Res, CurfewSettings>;
  @useResult
  $Res call({bool? enabled, List<CurfewRestriction>? restrictions});
}

/// @nodoc
class _$CurfewSettingsCopyWithImpl<$Res, $Val extends CurfewSettings>
    implements $CurfewSettingsCopyWith<$Res> {
  _$CurfewSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurfewSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = freezed,
    Object? restrictions = freezed,
  }) {
    return _then(_value.copyWith(
      enabled: freezed == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      restrictions: freezed == restrictions
          ? _value.restrictions
          : restrictions // ignore: cast_nullable_to_non_nullable
              as List<CurfewRestriction>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurfewSettingsImplCopyWith<$Res>
    implements $CurfewSettingsCopyWith<$Res> {
  factory _$$CurfewSettingsImplCopyWith(_$CurfewSettingsImpl value,
          $Res Function(_$CurfewSettingsImpl) then) =
      __$$CurfewSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? enabled, List<CurfewRestriction>? restrictions});
}

/// @nodoc
class __$$CurfewSettingsImplCopyWithImpl<$Res>
    extends _$CurfewSettingsCopyWithImpl<$Res, _$CurfewSettingsImpl>
    implements _$$CurfewSettingsImplCopyWith<$Res> {
  __$$CurfewSettingsImplCopyWithImpl(
      _$CurfewSettingsImpl _value, $Res Function(_$CurfewSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurfewSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = freezed,
    Object? restrictions = freezed,
  }) {
    return _then(_$CurfewSettingsImpl(
      enabled: freezed == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      restrictions: freezed == restrictions
          ? _value._restrictions
          : restrictions // ignore: cast_nullable_to_non_nullable
              as List<CurfewRestriction>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CurfewSettingsImpl implements _CurfewSettings {
  const _$CurfewSettingsImpl(
      {this.enabled, final List<CurfewRestriction>? restrictions})
      : _restrictions = restrictions;

  factory _$CurfewSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurfewSettingsImplFromJson(json);

  @override
  final bool? enabled;
  final List<CurfewRestriction>? _restrictions;
  @override
  List<CurfewRestriction>? get restrictions {
    final value = _restrictions;
    if (value == null) return null;
    if (_restrictions is EqualUnmodifiableListView) return _restrictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'CurfewSettings(enabled: $enabled, restrictions: $restrictions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurfewSettingsImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            const DeepCollectionEquality()
                .equals(other._restrictions, _restrictions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, enabled, const DeepCollectionEquality().hash(_restrictions));

  /// Create a copy of CurfewSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurfewSettingsImplCopyWith<_$CurfewSettingsImpl> get copyWith =>
      __$$CurfewSettingsImplCopyWithImpl<_$CurfewSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurfewSettingsImplToJson(
      this,
    );
  }
}

abstract class _CurfewSettings implements CurfewSettings {
  const factory _CurfewSettings(
      {final bool? enabled,
      final List<CurfewRestriction>? restrictions}) = _$CurfewSettingsImpl;

  factory _CurfewSettings.fromJson(Map<String, dynamic> json) =
      _$CurfewSettingsImpl.fromJson;

  @override
  bool? get enabled;
  @override
  List<CurfewRestriction>? get restrictions;

  /// Create a copy of CurfewSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurfewSettingsImplCopyWith<_$CurfewSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
