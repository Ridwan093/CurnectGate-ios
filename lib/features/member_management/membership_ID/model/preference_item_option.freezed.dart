// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'preference_item_option.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PreferenceItemOption _$PreferenceItemOptionFromJson(Map<String, dynamic> json) {
  return _PreferenceItemOption.fromJson(json);
}

/// @nodoc
mixin _$PreferenceItemOption {
  String? get key => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  /// Serializes this PreferenceItemOption to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PreferenceItemOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PreferenceItemOptionCopyWith<PreferenceItemOption> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PreferenceItemOptionCopyWith<$Res> {
  factory $PreferenceItemOptionCopyWith(PreferenceItemOption value,
          $Res Function(PreferenceItemOption) then) =
      _$PreferenceItemOptionCopyWithImpl<$Res, PreferenceItemOption>;
  @useResult
  $Res call({String? key, String? name});
}

/// @nodoc
class _$PreferenceItemOptionCopyWithImpl<$Res,
        $Val extends PreferenceItemOption>
    implements $PreferenceItemOptionCopyWith<$Res> {
  _$PreferenceItemOptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PreferenceItemOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? name = freezed,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PreferenceItemOptionImplCopyWith<$Res>
    implements $PreferenceItemOptionCopyWith<$Res> {
  factory _$$PreferenceItemOptionImplCopyWith(_$PreferenceItemOptionImpl value,
          $Res Function(_$PreferenceItemOptionImpl) then) =
      __$$PreferenceItemOptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? key, String? name});
}

/// @nodoc
class __$$PreferenceItemOptionImplCopyWithImpl<$Res>
    extends _$PreferenceItemOptionCopyWithImpl<$Res, _$PreferenceItemOptionImpl>
    implements _$$PreferenceItemOptionImplCopyWith<$Res> {
  __$$PreferenceItemOptionImplCopyWithImpl(_$PreferenceItemOptionImpl _value,
      $Res Function(_$PreferenceItemOptionImpl) _then)
      : super(_value, _then);

  /// Create a copy of PreferenceItemOption
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? name = freezed,
  }) {
    return _then(_$PreferenceItemOptionImpl(
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PreferenceItemOptionImpl implements _PreferenceItemOption {
  const _$PreferenceItemOptionImpl({this.key, this.name});

  factory _$PreferenceItemOptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PreferenceItemOptionImplFromJson(json);

  @override
  final String? key;
  @override
  final String? name;

  @override
  String toString() {
    return 'PreferenceItemOption(key: $key, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PreferenceItemOptionImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, key, name);

  /// Create a copy of PreferenceItemOption
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PreferenceItemOptionImplCopyWith<_$PreferenceItemOptionImpl>
      get copyWith =>
          __$$PreferenceItemOptionImplCopyWithImpl<_$PreferenceItemOptionImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PreferenceItemOptionImplToJson(
      this,
    );
  }
}

abstract class _PreferenceItemOption implements PreferenceItemOption {
  const factory _PreferenceItemOption({final String? key, final String? name}) =
      _$PreferenceItemOptionImpl;

  factory _PreferenceItemOption.fromJson(Map<String, dynamic> json) =
      _$PreferenceItemOptionImpl.fromJson;

  @override
  String? get key;
  @override
  String? get name;

  /// Create a copy of PreferenceItemOption
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PreferenceItemOptionImplCopyWith<_$PreferenceItemOptionImpl>
      get copyWith => throw _privateConstructorUsedError;
}
