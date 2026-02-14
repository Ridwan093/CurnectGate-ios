// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PrivacySetting _$PrivacySettingFromJson(Map<String, dynamic> json) {
  return _PrivacySetting.fromJson(json);
}

/// @nodoc
mixin _$PrivacySetting {
  String? get key => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get value => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this PrivacySetting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PrivacySetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PrivacySettingCopyWith<PrivacySetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PrivacySettingCopyWith<$Res> {
  factory $PrivacySettingCopyWith(
          PrivacySetting value, $Res Function(PrivacySetting) then) =
      _$PrivacySettingCopyWithImpl<$Res, PrivacySetting>;
  @useResult
  $Res call(
      {String? key,
      String? name,
      String? type,
      bool? value,
      String? description});
}

/// @nodoc
class _$PrivacySettingCopyWithImpl<$Res, $Val extends PrivacySetting>
    implements $PrivacySettingCopyWith<$Res> {
  _$PrivacySettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PrivacySetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? value = freezed,
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
              as bool?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PrivacySettingImplCopyWith<$Res>
    implements $PrivacySettingCopyWith<$Res> {
  factory _$$PrivacySettingImplCopyWith(_$PrivacySettingImpl value,
          $Res Function(_$PrivacySettingImpl) then) =
      __$$PrivacySettingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? key,
      String? name,
      String? type,
      bool? value,
      String? description});
}

/// @nodoc
class __$$PrivacySettingImplCopyWithImpl<$Res>
    extends _$PrivacySettingCopyWithImpl<$Res, _$PrivacySettingImpl>
    implements _$$PrivacySettingImplCopyWith<$Res> {
  __$$PrivacySettingImplCopyWithImpl(
      _$PrivacySettingImpl _value, $Res Function(_$PrivacySettingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PrivacySetting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? key = freezed,
    Object? name = freezed,
    Object? type = freezed,
    Object? value = freezed,
    Object? description = freezed,
  }) {
    return _then(_$PrivacySettingImpl(
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
              as bool?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PrivacySettingImpl implements _PrivacySetting {
  const _$PrivacySettingImpl(
      {this.key, this.name, this.type, this.value, this.description});

  factory _$PrivacySettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$PrivacySettingImplFromJson(json);

  @override
  final String? key;
  @override
  final String? name;
  @override
  final String? type;
  @override
  final bool? value;
  @override
  final String? description;

  @override
  String toString() {
    return 'PrivacySetting(key: $key, name: $name, type: $type, value: $value, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrivacySettingImpl &&
            (identical(other.key, key) || other.key == key) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, key, name, type, value, description);

  /// Create a copy of PrivacySetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrivacySettingImplCopyWith<_$PrivacySettingImpl> get copyWith =>
      __$$PrivacySettingImplCopyWithImpl<_$PrivacySettingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PrivacySettingImplToJson(
      this,
    );
  }
}

abstract class _PrivacySetting implements PrivacySetting {
  const factory _PrivacySetting(
      {final String? key,
      final String? name,
      final String? type,
      final bool? value,
      final String? description}) = _$PrivacySettingImpl;

  factory _PrivacySetting.fromJson(Map<String, dynamic> json) =
      _$PrivacySettingImpl.fromJson;

  @override
  String? get key;
  @override
  String? get name;
  @override
  String? get type;
  @override
  bool? get value;
  @override
  String? get description;

  /// Create a copy of PrivacySetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrivacySettingImplCopyWith<_$PrivacySettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
