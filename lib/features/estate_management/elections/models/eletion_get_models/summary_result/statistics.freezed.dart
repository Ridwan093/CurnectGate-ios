// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Statistics _$StatisticsFromJson(Map<String, dynamic> json) {
  return _Statistics.fromJson(json);
}

/// @nodoc
mixin _$Statistics {
  int? get totalVoters => throw _privateConstructorUsedError;
  int? get totalVoted => throw _privateConstructorUsedError;
  num? get turnoutPercentage => throw _privateConstructorUsedError;
  int? get timeRemainingHours => throw _privateConstructorUsedError;

  /// Serializes this Statistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Statistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatisticsCopyWith<Statistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsCopyWith<$Res> {
  factory $StatisticsCopyWith(
          Statistics value, $Res Function(Statistics) then) =
      _$StatisticsCopyWithImpl<$Res, Statistics>;
  @useResult
  $Res call(
      {int? totalVoters,
      int? totalVoted,
      num? turnoutPercentage,
      int? timeRemainingHours});
}

/// @nodoc
class _$StatisticsCopyWithImpl<$Res, $Val extends Statistics>
    implements $StatisticsCopyWith<$Res> {
  _$StatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Statistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalVoters = freezed,
    Object? totalVoted = freezed,
    Object? turnoutPercentage = freezed,
    Object? timeRemainingHours = freezed,
  }) {
    return _then(_value.copyWith(
      totalVoters: freezed == totalVoters
          ? _value.totalVoters
          : totalVoters // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVoted: freezed == totalVoted
          ? _value.totalVoted
          : totalVoted // ignore: cast_nullable_to_non_nullable
              as int?,
      turnoutPercentage: freezed == turnoutPercentage
          ? _value.turnoutPercentage
          : turnoutPercentage // ignore: cast_nullable_to_non_nullable
              as num?,
      timeRemainingHours: freezed == timeRemainingHours
          ? _value.timeRemainingHours
          : timeRemainingHours // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatisticsImplCopyWith<$Res>
    implements $StatisticsCopyWith<$Res> {
  factory _$$StatisticsImplCopyWith(
          _$StatisticsImpl value, $Res Function(_$StatisticsImpl) then) =
      __$$StatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? totalVoters,
      int? totalVoted,
      num? turnoutPercentage,
      int? timeRemainingHours});
}

/// @nodoc
class __$$StatisticsImplCopyWithImpl<$Res>
    extends _$StatisticsCopyWithImpl<$Res, _$StatisticsImpl>
    implements _$$StatisticsImplCopyWith<$Res> {
  __$$StatisticsImplCopyWithImpl(
      _$StatisticsImpl _value, $Res Function(_$StatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Statistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalVoters = freezed,
    Object? totalVoted = freezed,
    Object? turnoutPercentage = freezed,
    Object? timeRemainingHours = freezed,
  }) {
    return _then(_$StatisticsImpl(
      totalVoters: freezed == totalVoters
          ? _value.totalVoters
          : totalVoters // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVoted: freezed == totalVoted
          ? _value.totalVoted
          : totalVoted // ignore: cast_nullable_to_non_nullable
              as int?,
      turnoutPercentage: freezed == turnoutPercentage
          ? _value.turnoutPercentage
          : turnoutPercentage // ignore: cast_nullable_to_non_nullable
              as num?,
      timeRemainingHours: freezed == timeRemainingHours
          ? _value.timeRemainingHours
          : timeRemainingHours // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatisticsImpl implements _Statistics {
  const _$StatisticsImpl(
      {this.totalVoters,
      this.totalVoted,
      this.turnoutPercentage,
      this.timeRemainingHours});

  factory _$StatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatisticsImplFromJson(json);

  @override
  final int? totalVoters;
  @override
  final int? totalVoted;
  @override
  final num? turnoutPercentage;
  @override
  final int? timeRemainingHours;

  @override
  String toString() {
    return 'Statistics(totalVoters: $totalVoters, totalVoted: $totalVoted, turnoutPercentage: $turnoutPercentage, timeRemainingHours: $timeRemainingHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatisticsImpl &&
            (identical(other.totalVoters, totalVoters) ||
                other.totalVoters == totalVoters) &&
            (identical(other.totalVoted, totalVoted) ||
                other.totalVoted == totalVoted) &&
            (identical(other.turnoutPercentage, turnoutPercentage) ||
                other.turnoutPercentage == turnoutPercentage) &&
            (identical(other.timeRemainingHours, timeRemainingHours) ||
                other.timeRemainingHours == timeRemainingHours));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalVoters, totalVoted,
      turnoutPercentage, timeRemainingHours);

  /// Create a copy of Statistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticsImplCopyWith<_$StatisticsImpl> get copyWith =>
      __$$StatisticsImplCopyWithImpl<_$StatisticsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatisticsImplToJson(
      this,
    );
  }
}

abstract class _Statistics implements Statistics {
  const factory _Statistics(
      {final int? totalVoters,
      final int? totalVoted,
      final num? turnoutPercentage,
      final int? timeRemainingHours}) = _$StatisticsImpl;

  factory _Statistics.fromJson(Map<String, dynamic> json) =
      _$StatisticsImpl.fromJson;

  @override
  int? get totalVoters;
  @override
  int? get totalVoted;
  @override
  num? get turnoutPercentage;
  @override
  int? get timeRemainingHours;

  /// Create a copy of Statistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatisticsImplCopyWith<_$StatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
