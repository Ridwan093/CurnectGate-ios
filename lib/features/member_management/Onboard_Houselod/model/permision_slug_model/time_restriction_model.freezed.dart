// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'time_restriction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimeRestriction _$TimeRestrictionFromJson(Map<String, dynamic> json) {
  return _TimeRestriction.fromJson(json);
}

/// @nodoc
mixin _$TimeRestriction {
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String? get endTime => throw _privateConstructorUsedError;

  /// Serializes this TimeRestriction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeRestriction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeRestrictionCopyWith<TimeRestriction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeRestrictionCopyWith<$Res> {
  factory $TimeRestrictionCopyWith(
          TimeRestriction value, $Res Function(TimeRestriction) then) =
      _$TimeRestrictionCopyWithImpl<$Res, TimeRestriction>;
  @useResult
  $Res call(
      {@JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime});
}

/// @nodoc
class _$TimeRestrictionCopyWithImpl<$Res, $Val extends TimeRestriction>
    implements $TimeRestrictionCopyWith<$Res> {
  _$TimeRestrictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeRestriction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeRestrictionImplCopyWith<$Res>
    implements $TimeRestrictionCopyWith<$Res> {
  factory _$$TimeRestrictionImplCopyWith(_$TimeRestrictionImpl value,
          $Res Function(_$TimeRestrictionImpl) then) =
      __$$TimeRestrictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'start_time') String? startTime,
      @JsonKey(name: 'end_time') String? endTime});
}

/// @nodoc
class __$$TimeRestrictionImplCopyWithImpl<$Res>
    extends _$TimeRestrictionCopyWithImpl<$Res, _$TimeRestrictionImpl>
    implements _$$TimeRestrictionImplCopyWith<$Res> {
  __$$TimeRestrictionImplCopyWithImpl(
      _$TimeRestrictionImpl _value, $Res Function(_$TimeRestrictionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeRestriction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$TimeRestrictionImpl(
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeRestrictionImpl implements _TimeRestriction {
  const _$TimeRestrictionImpl(
      {@JsonKey(name: 'start_time') this.startTime,
      @JsonKey(name: 'end_time') this.endTime});

  factory _$TimeRestrictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeRestrictionImplFromJson(json);

  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'end_time')
  final String? endTime;

  @override
  String toString() {
    return 'TimeRestriction(startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeRestrictionImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startTime, endTime);

  /// Create a copy of TimeRestriction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeRestrictionImplCopyWith<_$TimeRestrictionImpl> get copyWith =>
      __$$TimeRestrictionImplCopyWithImpl<_$TimeRestrictionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeRestrictionImplToJson(
      this,
    );
  }
}

abstract class _TimeRestriction implements TimeRestriction {
  const factory _TimeRestriction(
          {@JsonKey(name: 'start_time') final String? startTime,
          @JsonKey(name: 'end_time') final String? endTime}) =
      _$TimeRestrictionImpl;

  factory _TimeRestriction.fromJson(Map<String, dynamic> json) =
      _$TimeRestrictionImpl.fromJson;

  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'end_time')
  String? get endTime;

  /// Create a copy of TimeRestriction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeRestrictionImplCopyWith<_$TimeRestrictionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
