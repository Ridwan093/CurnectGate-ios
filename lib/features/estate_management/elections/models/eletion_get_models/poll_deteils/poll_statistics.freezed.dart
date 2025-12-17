// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PollStatistics _$PollStatisticsFromJson(Map<String, dynamic> json) {
  return _PollStatistics.fromJson(json);
}

/// @nodoc
mixin _$PollStatistics {
  int? get totalVoters => throw _privateConstructorUsedError;
  int? get totalVoted => throw _privateConstructorUsedError;
  double? get turnoutPercentage => throw _privateConstructorUsedError;
  int? get timeRemainingHours => throw _privateConstructorUsedError;

  /// Serializes this PollStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PollStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PollStatisticsCopyWith<PollStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollStatisticsCopyWith<$Res> {
  factory $PollStatisticsCopyWith(
          PollStatistics value, $Res Function(PollStatistics) then) =
      _$PollStatisticsCopyWithImpl<$Res, PollStatistics>;
  @useResult
  $Res call(
      {int? totalVoters,
      int? totalVoted,
      double? turnoutPercentage,
      int? timeRemainingHours});
}

/// @nodoc
class _$PollStatisticsCopyWithImpl<$Res, $Val extends PollStatistics>
    implements $PollStatisticsCopyWith<$Res> {
  _$PollStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PollStatistics
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
              as double?,
      timeRemainingHours: freezed == timeRemainingHours
          ? _value.timeRemainingHours
          : timeRemainingHours // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PollStatisticsImplCopyWith<$Res>
    implements $PollStatisticsCopyWith<$Res> {
  factory _$$PollStatisticsImplCopyWith(_$PollStatisticsImpl value,
          $Res Function(_$PollStatisticsImpl) then) =
      __$$PollStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? totalVoters,
      int? totalVoted,
      double? turnoutPercentage,
      int? timeRemainingHours});
}

/// @nodoc
class __$$PollStatisticsImplCopyWithImpl<$Res>
    extends _$PollStatisticsCopyWithImpl<$Res, _$PollStatisticsImpl>
    implements _$$PollStatisticsImplCopyWith<$Res> {
  __$$PollStatisticsImplCopyWithImpl(
      _$PollStatisticsImpl _value, $Res Function(_$PollStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PollStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalVoters = freezed,
    Object? totalVoted = freezed,
    Object? turnoutPercentage = freezed,
    Object? timeRemainingHours = freezed,
  }) {
    return _then(_$PollStatisticsImpl(
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
              as double?,
      timeRemainingHours: freezed == timeRemainingHours
          ? _value.timeRemainingHours
          : timeRemainingHours // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PollStatisticsImpl implements _PollStatistics {
  const _$PollStatisticsImpl(
      {this.totalVoters,
      this.totalVoted,
      this.turnoutPercentage,
      this.timeRemainingHours});

  factory _$PollStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollStatisticsImplFromJson(json);

  @override
  final int? totalVoters;
  @override
  final int? totalVoted;
  @override
  final double? turnoutPercentage;
  @override
  final int? timeRemainingHours;

  @override
  String toString() {
    return 'PollStatistics(totalVoters: $totalVoters, totalVoted: $totalVoted, turnoutPercentage: $turnoutPercentage, timeRemainingHours: $timeRemainingHours)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollStatisticsImpl &&
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

  /// Create a copy of PollStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PollStatisticsImplCopyWith<_$PollStatisticsImpl> get copyWith =>
      __$$PollStatisticsImplCopyWithImpl<_$PollStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollStatisticsImplToJson(
      this,
    );
  }
}

abstract class _PollStatistics implements PollStatistics {
  const factory _PollStatistics(
      {final int? totalVoters,
      final int? totalVoted,
      final double? turnoutPercentage,
      final int? timeRemainingHours}) = _$PollStatisticsImpl;

  factory _PollStatistics.fromJson(Map<String, dynamic> json) =
      _$PollStatisticsImpl.fromJson;

  @override
  int? get totalVoters;
  @override
  int? get totalVoted;
  @override
  double? get turnoutPercentage;
  @override
  int? get timeRemainingHours;

  /// Create a copy of PollStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PollStatisticsImplCopyWith<_$PollStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
