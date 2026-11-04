// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curfew_restriction_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurfewRestriction _$CurfewRestrictionFromJson(Map<String, dynamic> json) {
  return _CurfewRestriction.fromJson(json);
}

/// @nodoc
mixin _$CurfewRestriction {
  String? get day => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;

  /// Serializes this CurfewRestriction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurfewRestriction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurfewRestrictionCopyWith<CurfewRestriction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurfewRestrictionCopyWith<$Res> {
  factory $CurfewRestrictionCopyWith(
          CurfewRestriction value, $Res Function(CurfewRestriction) then) =
      _$CurfewRestrictionCopyWithImpl<$Res, CurfewRestriction>;
  @useResult
  $Res call({String? day, String? startTime, String? endTime});
}

/// @nodoc
class _$CurfewRestrictionCopyWithImpl<$Res, $Val extends CurfewRestriction>
    implements $CurfewRestrictionCopyWith<$Res> {
  _$CurfewRestrictionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurfewRestriction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_value.copyWith(
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$CurfewRestrictionImplCopyWith<$Res>
    implements $CurfewRestrictionCopyWith<$Res> {
  factory _$$CurfewRestrictionImplCopyWith(_$CurfewRestrictionImpl value,
          $Res Function(_$CurfewRestrictionImpl) then) =
      __$$CurfewRestrictionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? day, String? startTime, String? endTime});
}

/// @nodoc
class __$$CurfewRestrictionImplCopyWithImpl<$Res>
    extends _$CurfewRestrictionCopyWithImpl<$Res, _$CurfewRestrictionImpl>
    implements _$$CurfewRestrictionImplCopyWith<$Res> {
  __$$CurfewRestrictionImplCopyWithImpl(_$CurfewRestrictionImpl _value,
      $Res Function(_$CurfewRestrictionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurfewRestriction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_$CurfewRestrictionImpl(
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
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

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CurfewRestrictionImpl implements _CurfewRestriction {
  const _$CurfewRestrictionImpl({this.day, this.startTime, this.endTime});

  factory _$CurfewRestrictionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurfewRestrictionImplFromJson(json);

  @override
  final String? day;
  @override
  final String? startTime;
  @override
  final String? endTime;

  @override
  String toString() {
    return 'CurfewRestriction(day: $day, startTime: $startTime, endTime: $endTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurfewRestrictionImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, day, startTime, endTime);

  /// Create a copy of CurfewRestriction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurfewRestrictionImplCopyWith<_$CurfewRestrictionImpl> get copyWith =>
      __$$CurfewRestrictionImplCopyWithImpl<_$CurfewRestrictionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurfewRestrictionImplToJson(
      this,
    );
  }
}

abstract class _CurfewRestriction implements CurfewRestriction {
  const factory _CurfewRestriction(
      {final String? day,
      final String? startTime,
      final String? endTime}) = _$CurfewRestrictionImpl;

  factory _CurfewRestriction.fromJson(Map<String, dynamic> json) =
      _$CurfewRestrictionImpl.fromJson;

  @override
  String? get day;
  @override
  String? get startTime;
  @override
  String? get endTime;

  /// Create a copy of CurfewRestriction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurfewRestrictionImplCopyWith<_$CurfewRestrictionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
