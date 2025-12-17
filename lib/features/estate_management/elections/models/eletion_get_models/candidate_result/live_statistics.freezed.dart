// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LiveStatistics _$LiveStatisticsFromJson(Map<String, dynamic> json) {
  return _LiveStatistics.fromJson(json);
}

/// @nodoc
mixin _$LiveStatistics {
  int? get totalVoters => throw _privateConstructorUsedError;
  int? get totalVoted => throw _privateConstructorUsedError;
  double? get turnoutPercentage => throw _privateConstructorUsedError;
  int? get timeRemainingHours => throw _privateConstructorUsedError;
  bool? get isLive => throw _privateConstructorUsedError;

  /// Serializes this LiveStatistics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveStatisticsCopyWith<LiveStatistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveStatisticsCopyWith<$Res> {
  factory $LiveStatisticsCopyWith(
          LiveStatistics value, $Res Function(LiveStatistics) then) =
      _$LiveStatisticsCopyWithImpl<$Res, LiveStatistics>;
  @useResult
  $Res call(
      {int? totalVoters,
      int? totalVoted,
      double? turnoutPercentage,
      int? timeRemainingHours,
      bool? isLive});
}

/// @nodoc
class _$LiveStatisticsCopyWithImpl<$Res, $Val extends LiveStatistics>
    implements $LiveStatisticsCopyWith<$Res> {
  _$LiveStatisticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalVoters = freezed,
    Object? totalVoted = freezed,
    Object? turnoutPercentage = freezed,
    Object? timeRemainingHours = freezed,
    Object? isLive = freezed,
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
      isLive: freezed == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LiveStatisticsImplCopyWith<$Res>
    implements $LiveStatisticsCopyWith<$Res> {
  factory _$$LiveStatisticsImplCopyWith(_$LiveStatisticsImpl value,
          $Res Function(_$LiveStatisticsImpl) then) =
      __$$LiveStatisticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? totalVoters,
      int? totalVoted,
      double? turnoutPercentage,
      int? timeRemainingHours,
      bool? isLive});
}

/// @nodoc
class __$$LiveStatisticsImplCopyWithImpl<$Res>
    extends _$LiveStatisticsCopyWithImpl<$Res, _$LiveStatisticsImpl>
    implements _$$LiveStatisticsImplCopyWith<$Res> {
  __$$LiveStatisticsImplCopyWithImpl(
      _$LiveStatisticsImpl _value, $Res Function(_$LiveStatisticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiveStatistics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalVoters = freezed,
    Object? totalVoted = freezed,
    Object? turnoutPercentage = freezed,
    Object? timeRemainingHours = freezed,
    Object? isLive = freezed,
  }) {
    return _then(_$LiveStatisticsImpl(
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
      isLive: freezed == isLive
          ? _value.isLive
          : isLive // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveStatisticsImpl implements _LiveStatistics {
  const _$LiveStatisticsImpl(
      {this.totalVoters,
      this.totalVoted,
      this.turnoutPercentage,
      this.timeRemainingHours,
      this.isLive});

  factory _$LiveStatisticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveStatisticsImplFromJson(json);

  @override
  final int? totalVoters;
  @override
  final int? totalVoted;
  @override
  final double? turnoutPercentage;
  @override
  final int? timeRemainingHours;
  @override
  final bool? isLive;

  @override
  String toString() {
    return 'LiveStatistics(totalVoters: $totalVoters, totalVoted: $totalVoted, turnoutPercentage: $turnoutPercentage, timeRemainingHours: $timeRemainingHours, isLive: $isLive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveStatisticsImpl &&
            (identical(other.totalVoters, totalVoters) ||
                other.totalVoters == totalVoters) &&
            (identical(other.totalVoted, totalVoted) ||
                other.totalVoted == totalVoted) &&
            (identical(other.turnoutPercentage, turnoutPercentage) ||
                other.turnoutPercentage == turnoutPercentage) &&
            (identical(other.timeRemainingHours, timeRemainingHours) ||
                other.timeRemainingHours == timeRemainingHours) &&
            (identical(other.isLive, isLive) || other.isLive == isLive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalVoters, totalVoted,
      turnoutPercentage, timeRemainingHours, isLive);

  /// Create a copy of LiveStatistics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveStatisticsImplCopyWith<_$LiveStatisticsImpl> get copyWith =>
      __$$LiveStatisticsImplCopyWithImpl<_$LiveStatisticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveStatisticsImplToJson(
      this,
    );
  }
}

abstract class _LiveStatistics implements LiveStatistics {
  const factory _LiveStatistics(
      {final int? totalVoters,
      final int? totalVoted,
      final double? turnoutPercentage,
      final int? timeRemainingHours,
      final bool? isLive}) = _$LiveStatisticsImpl;

  factory _LiveStatistics.fromJson(Map<String, dynamic> json) =
      _$LiveStatisticsImpl.fromJson;

  @override
  int? get totalVoters;
  @override
  int? get totalVoted;
  @override
  double? get turnoutPercentage;
  @override
  int? get timeRemainingHours;
  @override
  bool? get isLive;

  /// Create a copy of LiveStatistics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveStatisticsImplCopyWith<_$LiveStatisticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
