// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preference_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PreferenceItem _$PreferenceItemFromJson(Map<String, dynamic> json) {
  return _PreferenceItem.fromJson(json);
}

/// @nodoc
mixin _$PreferenceItem {
  String? get key => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: [])
  List<PreferenceItemOption>? get options => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this PreferenceItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreferenceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreferenceItemCopyWith<PreferenceItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferenceItemCopyWith<$Res> {
  factory $PreferenceItemCopyWith(
          PreferenceItem value, $Res Function(PreferenceItem) then) =
      _$PreferenceItemCopyWithImpl<$Res, PreferenceItem>;
  @useResult
  $Res call(
      {String? key,
      String? name,
      String? type,
      dynamic value,
      @JsonKey(defaultValue: []) List<PreferenceItemOption>? options,
      String? description});
}

/// @nodoc
class _$PreferenceItemCopyWithImpl<$Res, $Val extends PreferenceItem>
    implements $PreferenceItemCopyWith<$Res> {
  _$PreferenceItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreferenceItem
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
              as dynamic,
      options: freezed == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as List<PreferenceItemOption>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferenceItemImplCopyWith<$Res>
    implements $PreferenceItemCopyWith<$Res> {
  factory _$$PreferenceItemImplCopyWith(_$PreferenceItemImpl value,
          $Res Function(_$PreferenceItemImpl) then) =
      __$$PreferenceItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? key,
      String? name,
      String? type,
      dynamic value,
      @JsonKey(defaultValue: []) List<PreferenceItemOption>? options,
      String? description});
}

/// @nodoc
class __$$PreferenceItemImplCopyWithImpl<$Res>
    extends _$PreferenceItemCopyWithImpl<$Res, _$PreferenceItemImpl>
    implements _$$PreferenceItemImplCopyWith<$Res> {
  __$$PreferenceItemImplCopyWithImpl(
      _$PreferenceItemImpl _value, $Res Function(_$PreferenceItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of PreferenceItem
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
    return _then(_$PreferenceItemImpl(
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
              as dynamic,
      options: freezed == options
          ? _value._options
          : options // ignore: cast_nullable_to_non_nullable
              as List<PreferenceItemOption>?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PreferenceItemImpl implements _PreferenceItem {
  const _$PreferenceItemImpl(
      {this.key,
      this.name,
      this.type,
      this.value,
      @JsonKey(defaultValue: []) final List<PreferenceItemOption>? options,
      this.description})
      : _options = options;

  factory _$PreferenceItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferenceItemImplFromJson(json);

  @override
  final String? key;
  @override
  final String? name;
  @override
  final String? type;
  @override
  final dynamic value;
  final List<PreferenceItemOption>? _options;
  @override
  @JsonKey(defaultValue: [])
  List<PreferenceItemOption>? get options {
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
    return 'PreferenceItem(key: $key, name: $name, type: $type, value: $value, options: $options, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferenceItemImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            const DeepCollectionEquality().equals(other._options, _options) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      key,
      name,
      type,
      const DeepCollectionEquality().hash(value),
      const DeepCollectionEquality().hash(_options),
      description);

  /// Create a copy of PreferenceItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferenceItemImplCopyWith<_$PreferenceItemImpl> get copyWith =>
      __$$PreferenceItemImplCopyWithImpl<_$PreferenceItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferenceItemImplToJson(
      this,
    );
  }
}

abstract class _PreferenceItem implements PreferenceItem {
  const factory _PreferenceItem(
      {final String? key,
      final String? name,
      final String? type,
      final dynamic value,
      @JsonKey(defaultValue: []) final List<PreferenceItemOption>? options,
      final String? description}) = _$PreferenceItemImpl;

  factory _PreferenceItem.fromJson(Map<String, dynamic> json) =
      _$PreferenceItemImpl.fromJson;

  @override
  String? get key;
  @override
  String? get name;
  @override
  String? get type;
  @override
  dynamic get value;
  @override
  @JsonKey(defaultValue: [])
  List<PreferenceItemOption>? get options;
  @override
  String? get description;

  /// Create a copy of PreferenceItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreferenceItemImplCopyWith<_$PreferenceItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
