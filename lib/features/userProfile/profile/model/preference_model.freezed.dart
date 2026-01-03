// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preference_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Preference _$PreferenceFromJson(Map<String, dynamic> json) {
  return _Preference.fromJson(json);
}

/// @nodoc
mixin _$Preference {
  String get key => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<Option> get options => throw _privateConstructorUsedError;

  /// Serializes this Preference to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Preference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreferenceCopyWith<Preference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferenceCopyWith<$Res> {
  factory $PreferenceCopyWith(
          Preference value, $Res Function(Preference) then) =
      _$PreferenceCopyWithImpl<$Res, Preference>;
  @useResult
  $Res call(
      {String key,
      String name,
      String type,
      String value,
      String description,
      List<Option> options});
}

/// @nodoc
class _$PreferenceCopyWithImpl<$Res, $Val extends Preference>
    implements $PreferenceCopyWith<$Res> {
  _$PreferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Preference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? type = null,
    Object? value = null,
    Object? description = null,
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferenceImplCopyWith<$Res>
    implements $PreferenceCopyWith<$Res> {
  factory _$$PreferenceImplCopyWith(
          _$PreferenceImpl value, $Res Function(_$PreferenceImpl) then) =
      __$$PreferenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String key,
      String name,
      String type,
      String value,
      String description,
      List<Option> options});
}

/// @nodoc
class __$$PreferenceImplCopyWithImpl<$Res>
    extends _$PreferenceCopyWithImpl<$Res, _$PreferenceImpl>
    implements _$$PreferenceImplCopyWith<$Res> {
  __$$PreferenceImplCopyWithImpl(
      _$PreferenceImpl _value, $Res Function(_$PreferenceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Preference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = null,
    Object? name = null,
    Object? type = null,
    Object? value = null,
    Object? description = null,
    Object? options = null,
  }) {
    return _then(_$PreferenceImpl(
      key: null == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      options: null == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<Option>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PreferenceImpl implements _Preference {
  const _$PreferenceImpl(
      {this.key = '',
      this.name = '',
      this.type = '',
      this.value = '',
      this.description = '',
      final List<Option> options = const []})
      : _options = options;

  factory _$PreferenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferenceImplFromJson(json);

  @override
  @JsonKey()
  final String key;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final String description;
  final List<Option> _options;
  @override
  @JsonKey()
  List<Option> get options {
    if (_options is EqualUnmodifiableListView) return _options;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_options);
  }

  @override
  String toString() {
    return 'Preference(key: $key, name: $name, type: $type, value: $value, description: $description, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferenceImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._options, _options));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, name, type, value,
      description, const DeepCollectionEquality().hash(_options));

  /// Create a copy of Preference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferenceImplCopyWith<_$PreferenceImpl> get copyWith =>
      __$$PreferenceImplCopyWithImpl<_$PreferenceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferenceImplToJson(
      this,
    );
  }
}

abstract class _Preference implements Preference {
  const factory _Preference(
      {final String key,
      final String name,
      final String type,
      final String value,
      final String description,
      final List<Option> options}) = _$PreferenceImpl;

  factory _Preference.fromJson(Map<String, dynamic> json) =
      _$PreferenceImpl.fromJson;

  @override
  String get key;
  @override
  String get name;
  @override
  String get type;
  @override
  String get value;
  @override
  String get description;
  @override
  List<Option> get options;

  /// Create a copy of Preference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreferenceImplCopyWith<_$PreferenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
