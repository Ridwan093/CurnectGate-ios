// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conditions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Conditions _$ConditionsFromJson(Map<String, dynamic> json) {
  return _Conditions.fromJson(json);
}

/// @nodoc
mixin _$Conditions {
  List<dynamic> get timeRestrictions => throw _privateConstructorUsedError;

  /// Serializes this Conditions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Conditions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConditionsCopyWith<Conditions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionsCopyWith<$Res> {
  factory $ConditionsCopyWith(
          Conditions value, $Res Function(Conditions) then) =
      _$ConditionsCopyWithImpl<$Res, Conditions>;
  @useResult
  $Res call({List<dynamic> timeRestrictions});
}

/// @nodoc
class _$ConditionsCopyWithImpl<$Res, $Val extends Conditions>
    implements $ConditionsCopyWith<$Res> {
  _$ConditionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Conditions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeRestrictions = null,
  }) {
    return _then(_value.copyWith(
      timeRestrictions: null == timeRestrictions
          ? _value.timeRestrictions
          : timeRestrictions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConditionsImplCopyWith<$Res>
    implements $ConditionsCopyWith<$Res> {
  factory _$$ConditionsImplCopyWith(
          _$ConditionsImpl value, $Res Function(_$ConditionsImpl) then) =
      __$$ConditionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic> timeRestrictions});
}

/// @nodoc
class __$$ConditionsImplCopyWithImpl<$Res>
    extends _$ConditionsCopyWithImpl<$Res, _$ConditionsImpl>
    implements _$$ConditionsImplCopyWith<$Res> {
  __$$ConditionsImplCopyWithImpl(
      _$ConditionsImpl _value, $Res Function(_$ConditionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Conditions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeRestrictions = null,
  }) {
    return _then(_$ConditionsImpl(
      timeRestrictions: null == timeRestrictions
          ? _value._timeRestrictions
          : timeRestrictions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ConditionsImpl implements _Conditions {
  const _$ConditionsImpl({final List<dynamic> timeRestrictions = const []})
      : _timeRestrictions = timeRestrictions;

  factory _$ConditionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionsImplFromJson(json);

  final List<dynamic> _timeRestrictions;
  @override
  @JsonKey()
  List<dynamic> get timeRestrictions {
    if (_timeRestrictions is EqualUnmodifiableListView)
      return _timeRestrictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeRestrictions);
  }

  @override
  String toString() {
    return 'Conditions(timeRestrictions: $timeRestrictions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionsImpl &&
            const DeepCollectionEquality()
                .equals(other._timeRestrictions, _timeRestrictions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_timeRestrictions));

  /// Create a copy of Conditions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionsImplCopyWith<_$ConditionsImpl> get copyWith =>
      __$$ConditionsImplCopyWithImpl<_$ConditionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionsImplToJson(
      this,
    );
  }
}

abstract class _Conditions implements Conditions {
  const factory _Conditions({final List<dynamic> timeRestrictions}) =
      _$ConditionsImpl;

  factory _Conditions.fromJson(Map<String, dynamic> json) =
      _$ConditionsImpl.fromJson;

  @override
  List<dynamic> get timeRestrictions;

  /// Create a copy of Conditions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionsImplCopyWith<_$ConditionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
