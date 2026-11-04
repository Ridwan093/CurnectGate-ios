// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nightaccess_condition.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NightAccessConditions _$NightAccessConditionsFromJson(
    Map<String, dynamic> json) {
  return _NightAccessConditions.fromJson(json);
}

/// @nodoc
mixin _$NightAccessConditions {
  List<dynamic>? get timeRestrictions => throw _privateConstructorUsedError;

  /// Serializes this NightAccessConditions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NightAccessConditions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NightAccessConditionsCopyWith<NightAccessConditions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NightAccessConditionsCopyWith<$Res> {
  factory $NightAccessConditionsCopyWith(NightAccessConditions value,
          $Res Function(NightAccessConditions) then) =
      _$NightAccessConditionsCopyWithImpl<$Res, NightAccessConditions>;
  @useResult
  $Res call({List<dynamic>? timeRestrictions});
}

/// @nodoc
class _$NightAccessConditionsCopyWithImpl<$Res,
        $Val extends NightAccessConditions>
    implements $NightAccessConditionsCopyWith<$Res> {
  _$NightAccessConditionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NightAccessConditions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeRestrictions = freezed,
  }) {
    return _then(_value.copyWith(
      timeRestrictions: freezed == timeRestrictions
          ? _value.timeRestrictions
          : timeRestrictions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NightAccessConditionsImplCopyWith<$Res>
    implements $NightAccessConditionsCopyWith<$Res> {
  factory _$$NightAccessConditionsImplCopyWith(
          _$NightAccessConditionsImpl value,
          $Res Function(_$NightAccessConditionsImpl) then) =
      __$$NightAccessConditionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? timeRestrictions});
}

/// @nodoc
class __$$NightAccessConditionsImplCopyWithImpl<$Res>
    extends _$NightAccessConditionsCopyWithImpl<$Res,
        _$NightAccessConditionsImpl>
    implements _$$NightAccessConditionsImplCopyWith<$Res> {
  __$$NightAccessConditionsImplCopyWithImpl(_$NightAccessConditionsImpl _value,
      $Res Function(_$NightAccessConditionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of NightAccessConditions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeRestrictions = freezed,
  }) {
    return _then(_$NightAccessConditionsImpl(
      timeRestrictions: freezed == timeRestrictions
          ? _value._timeRestrictions
          : timeRestrictions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$NightAccessConditionsImpl implements _NightAccessConditions {
  const _$NightAccessConditionsImpl({final List<dynamic>? timeRestrictions})
      : _timeRestrictions = timeRestrictions;

  factory _$NightAccessConditionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NightAccessConditionsImplFromJson(json);

  final List<dynamic>? _timeRestrictions;
  @override
  List<dynamic>? get timeRestrictions {
    final value = _timeRestrictions;
    if (value == null) return null;
    if (_timeRestrictions is EqualUnmodifiableListView)
      return _timeRestrictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'NightAccessConditions(timeRestrictions: $timeRestrictions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NightAccessConditionsImpl &&
            const DeepCollectionEquality()
                .equals(other._timeRestrictions, _timeRestrictions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_timeRestrictions));

  /// Create a copy of NightAccessConditions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NightAccessConditionsImplCopyWith<_$NightAccessConditionsImpl>
      get copyWith => __$$NightAccessConditionsImplCopyWithImpl<
          _$NightAccessConditionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NightAccessConditionsImplToJson(
      this,
    );
  }
}

abstract class _NightAccessConditions implements NightAccessConditions {
  const factory _NightAccessConditions(
      {final List<dynamic>? timeRestrictions}) = _$NightAccessConditionsImpl;

  factory _NightAccessConditions.fromJson(Map<String, dynamic> json) =
      _$NightAccessConditionsImpl.fromJson;

  @override
  List<dynamic>? get timeRestrictions;

  /// Create a copy of NightAccessConditions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NightAccessConditionsImplCopyWith<_$NightAccessConditionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
