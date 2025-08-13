// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_visibility.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileVisibility _$ProfileVisibilityFromJson(Map<String, dynamic> json) {
  return _ProfileVisibility.fromJson(json);
}

/// @nodoc
mixin _$ProfileVisibility {
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get key => throw _privateConstructorUsedError;
  bool? get value => throw _privateConstructorUsedError;

  /// Serializes this ProfileVisibility to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileVisibility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileVisibilityCopyWith<ProfileVisibility> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileVisibilityCopyWith<$Res> {
  factory $ProfileVisibilityCopyWith(
          ProfileVisibility value, $Res Function(ProfileVisibility) then) =
      _$ProfileVisibilityCopyWithImpl<$Res, ProfileVisibility>;
  @useResult
  $Res call(
      {String? name,
      String? description,
      String? type,
      String? key,
      bool? value});
}

/// @nodoc
class _$ProfileVisibilityCopyWithImpl<$Res, $Val extends ProfileVisibility>
    implements $ProfileVisibilityCopyWith<$Res> {
  _$ProfileVisibilityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileVisibility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? key = freezed,
    Object? value = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileVisibilityImplCopyWith<$Res>
    implements $ProfileVisibilityCopyWith<$Res> {
  factory _$$ProfileVisibilityImplCopyWith(_$ProfileVisibilityImpl value,
          $Res Function(_$ProfileVisibilityImpl) then) =
      __$$ProfileVisibilityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      String? description,
      String? type,
      String? key,
      bool? value});
}

/// @nodoc
class __$$ProfileVisibilityImplCopyWithImpl<$Res>
    extends _$ProfileVisibilityCopyWithImpl<$Res, _$ProfileVisibilityImpl>
    implements _$$ProfileVisibilityImplCopyWith<$Res> {
  __$$ProfileVisibilityImplCopyWithImpl(_$ProfileVisibilityImpl _value,
      $Res Function(_$ProfileVisibilityImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileVisibility
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? description = freezed,
    Object? type = freezed,
    Object? key = freezed,
    Object? value = freezed,
  }) {
    return _then(_$ProfileVisibilityImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileVisibilityImpl implements _ProfileVisibility {
  const _$ProfileVisibilityImpl(
      {this.name, this.description, this.type, this.key, this.value});

  factory _$ProfileVisibilityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileVisibilityImplFromJson(json);

  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? type;
  @override
  final String? key;
  @override
  final bool? value;

  @override
  String toString() {
    return 'ProfileVisibility(name: $name, description: $description, type: $type, key: $key, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileVisibilityImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.value, value) || other.value == value));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, description, type, key, value);

  /// Create a copy of ProfileVisibility
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileVisibilityImplCopyWith<_$ProfileVisibilityImpl> get copyWith =>
      __$$ProfileVisibilityImplCopyWithImpl<_$ProfileVisibilityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileVisibilityImplToJson(
      this,
    );
  }
}

abstract class _ProfileVisibility implements ProfileVisibility {
  const factory _ProfileVisibility(
      {final String? name,
      final String? description,
      final String? type,
      final String? key,
      final bool? value}) = _$ProfileVisibilityImpl;

  factory _ProfileVisibility.fromJson(Map<String, dynamic> json) =
      _$ProfileVisibilityImpl.fromJson;

  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get type;
  @override
  String? get key;
  @override
  bool? get value;

  /// Create a copy of ProfileVisibility
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileVisibilityImplCopyWith<_$ProfileVisibilityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
