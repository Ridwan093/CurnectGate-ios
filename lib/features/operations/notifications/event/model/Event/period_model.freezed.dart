// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'period_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalendarPeriod _$CalendarPeriodFromJson(Map<String, dynamic> json) {
  return _CalendarPeriod.fromJson(json);
}

/// @nodoc
mixin _$CalendarPeriod {
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;

  /// Serializes this CalendarPeriod to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalendarPeriod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalendarPeriodCopyWith<CalendarPeriod> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarPeriodCopyWith<$Res> {
  factory $CalendarPeriodCopyWith(
          CalendarPeriod value, $Res Function(CalendarPeriod) then) =
      _$CalendarPeriodCopyWithImpl<$Res, CalendarPeriod>;
  @useResult
  $Res call({String? startDate, String? endDate});
}

/// @nodoc
class _$CalendarPeriodCopyWithImpl<$Res, $Val extends CalendarPeriod>
    implements $CalendarPeriodCopyWith<$Res> {
  _$CalendarPeriodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalendarPeriod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarPeriodImplCopyWith<$Res>
    implements $CalendarPeriodCopyWith<$Res> {
  factory _$$CalendarPeriodImplCopyWith(_$CalendarPeriodImpl value,
          $Res Function(_$CalendarPeriodImpl) then) =
      __$$CalendarPeriodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? startDate, String? endDate});
}

/// @nodoc
class __$$CalendarPeriodImplCopyWithImpl<$Res>
    extends _$CalendarPeriodCopyWithImpl<$Res, _$CalendarPeriodImpl>
    implements _$$CalendarPeriodImplCopyWith<$Res> {
  __$$CalendarPeriodImplCopyWithImpl(
      _$CalendarPeriodImpl _value, $Res Function(_$CalendarPeriodImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarPeriod
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$CalendarPeriodImpl(
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CalendarPeriodImpl implements _CalendarPeriod {
  const _$CalendarPeriodImpl({this.startDate, this.endDate});

  factory _$CalendarPeriodImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalendarPeriodImplFromJson(json);

  @override
  final String? startDate;
  @override
  final String? endDate;

  @override
  String toString() {
    return 'CalendarPeriod(startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarPeriodImpl &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, startDate, endDate);

  /// Create a copy of CalendarPeriod
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarPeriodImplCopyWith<_$CalendarPeriodImpl> get copyWith =>
      __$$CalendarPeriodImplCopyWithImpl<_$CalendarPeriodImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalendarPeriodImplToJson(
      this,
    );
  }
}

abstract class _CalendarPeriod implements CalendarPeriod {
  const factory _CalendarPeriod(
      {final String? startDate, final String? endDate}) = _$CalendarPeriodImpl;

  factory _CalendarPeriod.fromJson(Map<String, dynamic> json) =
      _$CalendarPeriodImpl.fromJson;

  @override
  String? get startDate;
  @override
  String? get endDate;

  /// Create a copy of CalendarPeriod
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalendarPeriodImplCopyWith<_$CalendarPeriodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
