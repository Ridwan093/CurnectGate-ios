// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preferences_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PreferencesSettings _$PreferencesSettingsFromJson(Map<String, dynamic> json) {
  return _PreferencesSettings.fromJson(json);
}

/// @nodoc
mixin _$PreferencesSettings {
  @JsonKey(defaultValue: [])
  List<PreferenceItem>? get items => throw _privateConstructorUsedError;

  /// Serializes this PreferencesSettings to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreferencesSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreferencesSettingsCopyWith<PreferencesSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferencesSettingsCopyWith<$Res> {
  factory $PreferencesSettingsCopyWith(
          PreferencesSettings value, $Res Function(PreferencesSettings) then) =
      _$PreferencesSettingsCopyWithImpl<$Res, PreferencesSettings>;
  @useResult
  $Res call({@JsonKey(defaultValue: []) List<PreferenceItem>? items});
}

/// @nodoc
class _$PreferencesSettingsCopyWithImpl<$Res, $Val extends PreferencesSettings>
    implements $PreferencesSettingsCopyWith<$Res> {
  _$PreferencesSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreferencesSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_value.copyWith(
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PreferenceItem>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferencesSettingsImplCopyWith<$Res>
    implements $PreferencesSettingsCopyWith<$Res> {
  factory _$$PreferencesSettingsImplCopyWith(_$PreferencesSettingsImpl value,
          $Res Function(_$PreferencesSettingsImpl) then) =
      __$$PreferencesSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(defaultValue: []) List<PreferenceItem>? items});
}

/// @nodoc
class __$$PreferencesSettingsImplCopyWithImpl<$Res>
    extends _$PreferencesSettingsCopyWithImpl<$Res, _$PreferencesSettingsImpl>
    implements _$$PreferencesSettingsImplCopyWith<$Res> {
  __$$PreferencesSettingsImplCopyWithImpl(_$PreferencesSettingsImpl _value,
      $Res Function(_$PreferencesSettingsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PreferencesSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = freezed,
  }) {
    return _then(_$PreferencesSettingsImpl(
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PreferenceItem>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PreferencesSettingsImpl implements _PreferencesSettings {
  const _$PreferencesSettingsImpl(
      {@JsonKey(defaultValue: []) final List<PreferenceItem>? items})
      : _items = items;

  factory _$PreferencesSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferencesSettingsImplFromJson(json);

  final List<PreferenceItem>? _items;
  @override
  @JsonKey(defaultValue: [])
  List<PreferenceItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PreferencesSettings(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferencesSettingsImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of PreferencesSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferencesSettingsImplCopyWith<_$PreferencesSettingsImpl> get copyWith =>
      __$$PreferencesSettingsImplCopyWithImpl<_$PreferencesSettingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferencesSettingsImplToJson(
      this,
    );
  }
}

abstract class _PreferencesSettings implements PreferencesSettings {
  const factory _PreferencesSettings(
          {@JsonKey(defaultValue: []) final List<PreferenceItem>? items}) =
      _$PreferencesSettingsImpl;

  factory _PreferencesSettings.fromJson(Map<String, dynamic> json) =
      _$PreferencesSettingsImpl.fromJson;

  @override
  @JsonKey(defaultValue: [])
  List<PreferenceItem>? get items;

  /// Create a copy of PreferencesSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreferencesSettingsImplCopyWith<_$PreferencesSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
