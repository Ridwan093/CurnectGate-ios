// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_setting_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationSetting _$NotificationSettingFromJson(Map<String, dynamic> json) {
  return _NotificationSetting.fromJson(json);
}

/// @nodoc
mixin _$NotificationSetting {
  String? get key => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get value => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this NotificationSetting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationSettingCopyWith<NotificationSetting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationSettingCopyWith<$Res> {
  factory $NotificationSettingCopyWith(
          NotificationSetting value, $Res Function(NotificationSetting) then) =
      _$NotificationSettingCopyWithImpl<$Res, NotificationSetting>;
  @useResult
  $Res call(
      {String? key,
      String? name,
      String? type,
      bool? value,
      String? description});
}

/// @nodoc
class _$NotificationSettingCopyWithImpl<$Res, $Val extends NotificationSetting>
    implements $NotificationSettingCopyWith<$Res> {
  _$NotificationSettingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationSetting
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
abstract class _$$NotificationSettingImplCopyWith<$Res>
    implements $NotificationSettingCopyWith<$Res> {
  factory _$$NotificationSettingImplCopyWith(_$NotificationSettingImpl value,
          $Res Function(_$NotificationSettingImpl) then) =
      __$$NotificationSettingImplCopyWithImpl<$Res>;
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
class __$$NotificationSettingImplCopyWithImpl<$Res>
    extends _$NotificationSettingCopyWithImpl<$Res, _$NotificationSettingImpl>
    implements _$$NotificationSettingImplCopyWith<$Res> {
  __$$NotificationSettingImplCopyWithImpl(_$NotificationSettingImpl _value,
      $Res Function(_$NotificationSettingImpl) _then)
      : super(_value, _then);

  /// Create a copy of NotificationSetting
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
    return _then(_$NotificationSettingImpl(
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
class _$NotificationSettingImpl implements _NotificationSetting {
  const _$NotificationSettingImpl(
      {this.key, this.name, this.type, this.value, this.description});

  factory _$NotificationSettingImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationSettingImplFromJson(json);

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
    return 'NotificationSetting(key: $key, name: $name, type: $type, value: $value, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationSettingImpl &&
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

  /// Create a copy of NotificationSetting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationSettingImplCopyWith<_$NotificationSettingImpl> get copyWith =>
      __$$NotificationSettingImplCopyWithImpl<_$NotificationSettingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationSettingImplToJson(
      this,
    );
  }
}

abstract class _NotificationSetting implements NotificationSetting {
  const factory _NotificationSetting(
      {final String? key,
      final String? name,
      final String? type,
      final bool? value,
      final String? description}) = _$NotificationSettingImpl;

  factory _NotificationSetting.fromJson(Map<String, dynamic> json) =
      _$NotificationSettingImpl.fromJson;

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

  /// Create a copy of NotificationSetting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationSettingImplCopyWith<_$NotificationSettingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
