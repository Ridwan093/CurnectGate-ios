// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preference_setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PreferenceSetting _$PreferenceSettingFromJson(Map<String, dynamic> json) {
  return _PreferenceSetting.fromJson(json);
}

/// @nodoc
mixin _$PreferenceSetting {
  String? get key => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get value => throw _privateConstructorUsedError;
  List<Map<String, dynamic>>? get options => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this PreferenceSetting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreferenceSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreferenceSettingCopyWith<PreferenceSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferenceSettingCopyWith<$Res> {
  factory $PreferenceSettingCopyWith(
          PreferenceSetting value, $Res Function(PreferenceSetting) then) =
      _$PreferenceSettingCopyWithImpl<$Res, PreferenceSetting>;
  @useResult
  $Res call(
      {String? key,
      String? name,
      String? type,
      String? value,
      List<Map<String, dynamic>>? options,
      String? description});
}

/// @nodoc
class _$PreferenceSettingCopyWithImpl<$Res, $Val extends PreferenceSetting>
    implements $PreferenceSettingCopyWith<$Res> {
  _$PreferenceSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreferenceSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? value = freezed,
    Object? options = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferenceSettingImplCopyWith<$Res>
    implements $PreferenceSettingCopyWith<$Res> {
  factory _$$PreferenceSettingImplCopyWith(_$PreferenceSettingImpl value,
          $Res Function(_$PreferenceSettingImpl) then) =
      __$$PreferenceSettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? key,
      String? name,
      String? type,
      String? value,
      List<Map<String, dynamic>>? options,
      String? description});
}

/// @nodoc
class __$$PreferenceSettingImplCopyWithImpl<$Res>
    extends _$PreferenceSettingCopyWithImpl<$Res, _$PreferenceSettingImpl>
    implements _$$PreferenceSettingImplCopyWith<$Res> {
  __$$PreferenceSettingImplCopyWithImpl(_$PreferenceSettingImpl _value,
      $Res Function(_$PreferenceSettingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PreferenceSetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? value = freezed,
    Object? options = freezed,
    Object? description = freezed,
  }) {
    return _then(_$PreferenceSettingImpl(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String?,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PreferenceSettingImpl implements _PreferenceSetting {
  const _$PreferenceSettingImpl(
      {this.key,
      this.name,
      this.type,
      this.value,
      final List<Map<String, dynamic>>? options,
      this.description})
      : _options = options;

  factory _$PreferenceSettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferenceSettingImplFromJson(json);

  @override
  final String? key;
  @override
  final String? name;
  @override
  final String? type;
  @override
  final String? value;
  final List<Map<String, dynamic>>? _options;
  @override
  List<Map<String, dynamic>>? get options {
    final value = _options;
    if (value == null) return null;
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? description;

  @override
  String toString() {
    return 'PreferenceSetting(key: $key, name: $name, type: $type, value: $value, options: $options, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferenceSettingImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, name, type, value,
      const DeepCollectionEquality().hash(_options), description);

  /// Create a copy of PreferenceSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferenceSettingImplCopyWith<_$PreferenceSettingImpl> get copyWith =>
      __$$PreferenceSettingImplCopyWithImpl<_$PreferenceSettingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferenceSettingImplToJson(
      this,
    );
  }
}

abstract class _PreferenceSetting implements PreferenceSetting {
  const factory _PreferenceSetting(
      {final String? key,
      final String? name,
      final String? type,
      final String? value,
      final List<Map<String, dynamic>>? options,
      final String? description}) = _$PreferenceSettingImpl;

  factory _PreferenceSetting.fromJson(Map<String, dynamic> json) =
      _$PreferenceSettingImpl.fromJson;

  @override
  String? get key;
  @override
  String? get name;
  @override
  String? get type;
  @override
  String? get value;
  @override
  List<Map<String, dynamic>>? get options;
  @override
  String? get description;

  /// Create a copy of PreferenceSetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreferenceSettingImplCopyWith<_$PreferenceSettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
