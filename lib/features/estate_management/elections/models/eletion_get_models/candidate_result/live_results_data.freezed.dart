// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_results_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LiveResultsData _$LiveResultsDataFromJson(Map<String, dynamic> json) {
  return _LiveResultsData.fromJson(json);
}

/// @nodoc
mixin _$LiveResultsData {
  PollData? get poll => throw _privateConstructorUsedError;
  LiveStatistics? get statistics => throw _privateConstructorUsedError;
  List<PositionData>? get positions => throw _privateConstructorUsedError;
  UserStatus? get userStatus => throw _privateConstructorUsedError;
  String? get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this LiveResultsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LiveResultsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LiveResultsDataCopyWith<LiveResultsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LiveResultsDataCopyWith<$Res> {
  factory $LiveResultsDataCopyWith(
          LiveResultsData value, $Res Function(LiveResultsData) then) =
      _$LiveResultsDataCopyWithImpl<$Res, LiveResultsData>;
  @useResult
  $Res call(
      {PollData? poll,
      LiveStatistics? statistics,
      List<PositionData>? positions,
      UserStatus? userStatus,
      String? lastUpdated});

  $PollDataCopyWith<$Res>? get poll;
  $LiveStatisticsCopyWith<$Res>? get statistics;
  $UserStatusCopyWith<$Res>? get userStatus;
}

/// @nodoc
class _$LiveResultsDataCopyWithImpl<$Res, $Val extends LiveResultsData>
    implements $LiveResultsDataCopyWith<$Res> {
  _$LiveResultsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LiveResultsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poll = freezed,
    Object? statistics = freezed,
    Object? positions = freezed,
    Object? userStatus = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      poll: freezed == poll
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as PollData?,
      statistics: freezed == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as LiveStatistics?,
      positions: freezed == positions
          ? _value.positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<PositionData>?,
      userStatus: freezed == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as UserStatus?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of LiveResultsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PollDataCopyWith<$Res>? get poll {
    if (_value.poll == null) {
      return null;
    }

    return $PollDataCopyWith<$Res>(_value.poll!, (value) {
      return _then(_value.copyWith(poll: value) as $Val);
    });
  }

  /// Create a copy of LiveResultsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveStatisticsCopyWith<$Res>? get statistics {
    if (_value.statistics == null) {
      return null;
    }

    return $LiveStatisticsCopyWith<$Res>(_value.statistics!, (value) {
      return _then(_value.copyWith(statistics: value) as $Val);
    });
  }

  /// Create a copy of LiveResultsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserStatusCopyWith<$Res>? get userStatus {
    if (_value.userStatus == null) {
      return null;
    }

    return $UserStatusCopyWith<$Res>(_value.userStatus!, (value) {
      return _then(_value.copyWith(userStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LiveResultsDataImplCopyWith<$Res>
    implements $LiveResultsDataCopyWith<$Res> {
  factory _$$LiveResultsDataImplCopyWith(_$LiveResultsDataImpl value,
          $Res Function(_$LiveResultsDataImpl) then) =
      __$$LiveResultsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PollData? poll,
      LiveStatistics? statistics,
      List<PositionData>? positions,
      UserStatus? userStatus,
      String? lastUpdated});

  @override
  $PollDataCopyWith<$Res>? get poll;
  @override
  $LiveStatisticsCopyWith<$Res>? get statistics;
  @override
  $UserStatusCopyWith<$Res>? get userStatus;
}

/// @nodoc
class __$$LiveResultsDataImplCopyWithImpl<$Res>
    extends _$LiveResultsDataCopyWithImpl<$Res, _$LiveResultsDataImpl>
    implements _$$LiveResultsDataImplCopyWith<$Res> {
  __$$LiveResultsDataImplCopyWithImpl(
      _$LiveResultsDataImpl _value, $Res Function(_$LiveResultsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of LiveResultsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poll = freezed,
    Object? statistics = freezed,
    Object? positions = freezed,
    Object? userStatus = freezed,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$LiveResultsDataImpl(
      poll: freezed == poll
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as PollData?,
      statistics: freezed == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as LiveStatistics?,
      positions: freezed == positions
          ? _value._positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<PositionData>?,
      userStatus: freezed == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as UserStatus?,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LiveResultsDataImpl implements _LiveResultsData {
  const _$LiveResultsDataImpl(
      {this.poll,
      this.statistics,
      final List<PositionData>? positions,
      this.userStatus,
      this.lastUpdated})
      : _positions = positions;

  factory _$LiveResultsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LiveResultsDataImplFromJson(json);

  @override
  final PollData? poll;
  @override
  final LiveStatistics? statistics;
  final List<PositionData>? _positions;
  @override
  List<PositionData>? get positions {
    final value = _positions;
    if (value == null) return null;
    if (_positions is EqualUnmodifiableListView) return _positions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserStatus? userStatus;
  @override
  final String? lastUpdated;

  @override
  String toString() {
    return 'LiveResultsData(poll: $poll, statistics: $statistics, positions: $positions, userStatus: $userStatus, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LiveResultsDataImpl &&
            (identical(other.poll, poll) || other.poll == poll) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            const DeepCollectionEquality()
                .equals(other._positions, _positions) &&
            (identical(other.userStatus, userStatus) ||
                other.userStatus == userStatus) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, poll, statistics,
      const DeepCollectionEquality().hash(_positions), userStatus, lastUpdated);

  /// Create a copy of LiveResultsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LiveResultsDataImplCopyWith<_$LiveResultsDataImpl> get copyWith =>
      __$$LiveResultsDataImplCopyWithImpl<_$LiveResultsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LiveResultsDataImplToJson(
      this,
    );
  }
}

abstract class _LiveResultsData implements LiveResultsData {
  const factory _LiveResultsData(
      {final PollData? poll,
      final LiveStatistics? statistics,
      final List<PositionData>? positions,
      final UserStatus? userStatus,
      final String? lastUpdated}) = _$LiveResultsDataImpl;

  factory _LiveResultsData.fromJson(Map<String, dynamic> json) =
      _$LiveResultsDataImpl.fromJson;

  @override
  PollData? get poll;
  @override
  LiveStatistics? get statistics;
  @override
  List<PositionData>? get positions;
  @override
  UserStatus? get userStatus;
  @override
  String? get lastUpdated;

  /// Create a copy of LiveResultsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LiveResultsDataImplCopyWith<_$LiveResultsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
