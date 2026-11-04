// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'night_access_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NightAccess _$NightAccessFromJson(Map<String, dynamic> json) {
  return _NightAccess.fromJson(json);
}

/// @nodoc
mixin _$NightAccess {
  bool get enabled => throw _privateConstructorUsedError;
  Conditions? get conditions => throw _privateConstructorUsedError;

  /// Serializes this NightAccess to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NightAccess
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NightAccessCopyWith<NightAccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NightAccessCopyWith<$Res> {
  factory $NightAccessCopyWith(
          NightAccess value, $Res Function(NightAccess) then) =
      _$NightAccessCopyWithImpl<$Res, NightAccess>;
  @useResult
  $Res call({bool enabled, Conditions? conditions});

  $ConditionsCopyWith<$Res>? get conditions;
}

/// @nodoc
class _$NightAccessCopyWithImpl<$Res, $Val extends NightAccess>
    implements $NightAccessCopyWith<$Res> {
  _$NightAccessCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NightAccess
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? conditions = freezed,
  }) {
    return _then(_value.copyWith(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      conditions: freezed == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as Conditions?,
    ) as $Val);
  }

  /// Create a copy of NightAccess
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConditionsCopyWith<$Res>? get conditions {
    if (_value.conditions == null) {
      return null;
    }

    return $ConditionsCopyWith<$Res>(_value.conditions!, (value) {
      return _then(_value.copyWith(conditions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$NightAccessImplCopyWith<$Res>
    implements $NightAccessCopyWith<$Res> {
  factory _$$NightAccessImplCopyWith(
          _$NightAccessImpl value, $Res Function(_$NightAccessImpl) then) =
      __$$NightAccessImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool enabled, Conditions? conditions});

  @override
  $ConditionsCopyWith<$Res>? get conditions;
}

/// @nodoc
class __$$NightAccessImplCopyWithImpl<$Res>
    extends _$NightAccessCopyWithImpl<$Res, _$NightAccessImpl>
    implements _$$NightAccessImplCopyWith<$Res> {
  __$$NightAccessImplCopyWithImpl(
      _$NightAccessImpl _value, $Res Function(_$NightAccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of NightAccess
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enabled = null,
    Object? conditions = freezed,
  }) {
    return _then(_$NightAccessImpl(
      enabled: null == enabled
          ? _value.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
      conditions: freezed == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as Conditions?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$NightAccessImpl implements _NightAccess {
  const _$NightAccessImpl({this.enabled = false, this.conditions});

  factory _$NightAccessImpl.fromJson(Map<String, dynamic> json) =>
      _$$NightAccessImplFromJson(json);

  @override
  @JsonKey()
  final bool enabled;
  @override
  final Conditions? conditions;

  @override
  String toString() {
    return 'NightAccess(enabled: $enabled, conditions: $conditions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NightAccessImpl &&
            (identical(other.enabled, enabled) || other.enabled == enabled) &&
            (identical(other.conditions, conditions) ||
                other.conditions == conditions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, enabled, conditions);

  /// Create a copy of NightAccess
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NightAccessImplCopyWith<_$NightAccessImpl> get copyWith =>
      __$$NightAccessImplCopyWithImpl<_$NightAccessImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NightAccessImplToJson(
      this,
    );
  }
}

abstract class _NightAccess implements NightAccess {
  const factory _NightAccess(
      {final bool enabled, final Conditions? conditions}) = _$NightAccessImpl;

  factory _NightAccess.fromJson(Map<String, dynamic> json) =
      _$NightAccessImpl.fromJson;

  @override
  bool get enabled;
  @override
  Conditions? get conditions;

  /// Create a copy of NightAccess
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NightAccessImplCopyWith<_$NightAccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
