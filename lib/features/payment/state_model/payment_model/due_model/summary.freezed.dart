// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return _Summary.fromJson(json);
}

/// @nodoc
mixin _$Summary {
  int? get totalOutstanding => throw _privateConstructorUsedError;
  int? get totalOverdue => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;
  int? get overdueCount => throw _privateConstructorUsedError;
  String? get minimumPayableAmount => throw _privateConstructorUsedError;

  /// Serializes this Summary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SummaryCopyWith<Summary> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryCopyWith<$Res> {
  factory $SummaryCopyWith(Summary value, $Res Function(Summary) then) =
      _$SummaryCopyWithImpl<$Res, Summary>;
  @useResult
  $Res call(
      {int? totalOutstanding,
      int? totalOverdue,
      int? count,
      int? overdueCount,
      String? minimumPayableAmount});
}

/// @nodoc
class _$SummaryCopyWithImpl<$Res, $Val extends Summary>
    implements $SummaryCopyWith<$Res> {
  _$SummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalOutstanding = freezed,
    Object? totalOverdue = freezed,
    Object? count = freezed,
    Object? overdueCount = freezed,
    Object? minimumPayableAmount = freezed,
  }) {
    return _then(_value.copyWith(
      totalOutstanding: freezed == totalOutstanding
          ? _value.totalOutstanding
          : totalOutstanding // ignore: cast_nullable_to_non_nullable
              as int?,
      totalOverdue: freezed == totalOverdue
          ? _value.totalOverdue
          : totalOverdue // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      overdueCount: freezed == overdueCount
          ? _value.overdueCount
          : overdueCount // ignore: cast_nullable_to_non_nullable
              as int?,
      minimumPayableAmount: freezed == minimumPayableAmount
          ? _value.minimumPayableAmount
          : minimumPayableAmount // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SummaryImplCopyWith<$Res> implements $SummaryCopyWith<$Res> {
  factory _$$SummaryImplCopyWith(
          _$SummaryImpl value, $Res Function(_$SummaryImpl) then) =
      __$$SummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? totalOutstanding,
      int? totalOverdue,
      int? count,
      int? overdueCount,
      String? minimumPayableAmount});
}

/// @nodoc
class __$$SummaryImplCopyWithImpl<$Res>
    extends _$SummaryCopyWithImpl<$Res, _$SummaryImpl>
    implements _$$SummaryImplCopyWith<$Res> {
  __$$SummaryImplCopyWithImpl(
      _$SummaryImpl _value, $Res Function(_$SummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalOutstanding = freezed,
    Object? totalOverdue = freezed,
    Object? count = freezed,
    Object? overdueCount = freezed,
    Object? minimumPayableAmount = freezed,
  }) {
    return _then(_$SummaryImpl(
      totalOutstanding: freezed == totalOutstanding
          ? _value.totalOutstanding
          : totalOutstanding // ignore: cast_nullable_to_non_nullable
              as int?,
      totalOverdue: freezed == totalOverdue
          ? _value.totalOverdue
          : totalOverdue // ignore: cast_nullable_to_non_nullable
              as int?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      overdueCount: freezed == overdueCount
          ? _value.overdueCount
          : overdueCount // ignore: cast_nullable_to_non_nullable
              as int?,
      minimumPayableAmount: freezed == minimumPayableAmount
          ? _value.minimumPayableAmount
          : minimumPayableAmount // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$SummaryImpl implements _Summary {
  const _$SummaryImpl(
      {this.totalOutstanding,
      this.totalOverdue,
      this.count,
      this.overdueCount,
      this.minimumPayableAmount});

  factory _$SummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryImplFromJson(json);

  @override
  final int? totalOutstanding;
  @override
  final int? totalOverdue;
  @override
  final int? count;
  @override
  final int? overdueCount;
  @override
  final String? minimumPayableAmount;

  @override
  String toString() {
    return 'Summary(totalOutstanding: $totalOutstanding, totalOverdue: $totalOverdue, count: $count, overdueCount: $overdueCount, minimumPayableAmount: $minimumPayableAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryImpl &&
            (identical(other.totalOutstanding, totalOutstanding) ||
                other.totalOutstanding == totalOutstanding) &&
            (identical(other.totalOverdue, totalOverdue) ||
                other.totalOverdue == totalOverdue) &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.overdueCount, overdueCount) ||
                other.overdueCount == overdueCount) &&
            (identical(other.minimumPayableAmount, minimumPayableAmount) ||
                other.minimumPayableAmount == minimumPayableAmount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalOutstanding, totalOverdue,
      count, overdueCount, minimumPayableAmount);

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryImplCopyWith<_$SummaryImpl> get copyWith =>
      __$$SummaryImplCopyWithImpl<_$SummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryImplToJson(
      this,
    );
  }
}

abstract class _Summary implements Summary {
  const factory _Summary(
      {final int? totalOutstanding,
      final int? totalOverdue,
      final int? count,
      final int? overdueCount,
      final String? minimumPayableAmount}) = _$SummaryImpl;

  factory _Summary.fromJson(Map<String, dynamic> json) = _$SummaryImpl.fromJson;

  @override
  int? get totalOutstanding;
  @override
  int? get totalOverdue;
  @override
  int? get count;
  @override
  int? get overdueCount;
  @override
  String? get minimumPayableAmount;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryImplCopyWith<_$SummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
