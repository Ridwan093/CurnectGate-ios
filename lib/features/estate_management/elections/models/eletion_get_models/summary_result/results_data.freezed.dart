// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'results_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResultsData _$ResultsDataFromJson(Map<String, dynamic> json) {
  return _ResultsData.fromJson(json);
}

/// @nodoc
mixin _$ResultsData {
  Poll? get poll => throw _privateConstructorUsedError;
  Statistics? get statistics => throw _privateConstructorUsedError;
  List<Position>? get positions => throw _privateConstructorUsedError;
  UserStatus? get userStatus => throw _privateConstructorUsedError;

  /// Serializes this ResultsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultsDataCopyWith<ResultsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultsDataCopyWith<$Res> {
  factory $ResultsDataCopyWith(
          ResultsData value, $Res Function(ResultsData) then) =
      _$ResultsDataCopyWithImpl<$Res, ResultsData>;
  @useResult
  $Res call(
      {Poll? poll,
      Statistics? statistics,
      List<Position>? positions,
      UserStatus? userStatus});

  $PollCopyWith<$Res>? get poll;
  $StatisticsCopyWith<$Res>? get statistics;
  $UserStatusCopyWith<$Res>? get userStatus;
}

/// @nodoc
class _$ResultsDataCopyWithImpl<$Res, $Val extends ResultsData>
    implements $ResultsDataCopyWith<$Res> {
  _$ResultsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poll = freezed,
    Object? statistics = freezed,
    Object? positions = freezed,
    Object? userStatus = freezed,
  }) {
    return _then(_value.copyWith(
      poll: freezed == poll
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as Poll?,
      statistics: freezed == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as Statistics?,
      positions: freezed == positions
          ? _value.positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<Position>?,
      userStatus: freezed == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as UserStatus?,
    ) as $Val);
  }

  /// Create a copy of ResultsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PollCopyWith<$Res>? get poll {
    if (_value.poll == null) {
      return null;
    }

    return $PollCopyWith<$Res>(_value.poll!, (value) {
      return _then(_value.copyWith(poll: value) as $Val);
    });
  }

  /// Create a copy of ResultsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatisticsCopyWith<$Res>? get statistics {
    if (_value.statistics == null) {
      return null;
    }

    return $StatisticsCopyWith<$Res>(_value.statistics!, (value) {
      return _then(_value.copyWith(statistics: value) as $Val);
    });
  }

  /// Create a copy of ResultsData
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
abstract class _$$ResultsDataImplCopyWith<$Res>
    implements $ResultsDataCopyWith<$Res> {
  factory _$$ResultsDataImplCopyWith(
          _$ResultsDataImpl value, $Res Function(_$ResultsDataImpl) then) =
      __$$ResultsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Poll? poll,
      Statistics? statistics,
      List<Position>? positions,
      UserStatus? userStatus});

  @override
  $PollCopyWith<$Res>? get poll;
  @override
  $StatisticsCopyWith<$Res>? get statistics;
  @override
  $UserStatusCopyWith<$Res>? get userStatus;
}

/// @nodoc
class __$$ResultsDataImplCopyWithImpl<$Res>
    extends _$ResultsDataCopyWithImpl<$Res, _$ResultsDataImpl>
    implements _$$ResultsDataImplCopyWith<$Res> {
  __$$ResultsDataImplCopyWithImpl(
      _$ResultsDataImpl _value, $Res Function(_$ResultsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResultsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poll = freezed,
    Object? statistics = freezed,
    Object? positions = freezed,
    Object? userStatus = freezed,
  }) {
    return _then(_$ResultsDataImpl(
      poll: freezed == poll
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as Poll?,
      statistics: freezed == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as Statistics?,
      positions: freezed == positions
          ? _value._positions
          : positions // ignore: cast_nullable_to_non_nullable
              as List<Position>?,
      userStatus: freezed == userStatus
          ? _value.userStatus
          : userStatus // ignore: cast_nullable_to_non_nullable
              as UserStatus?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultsDataImpl implements _ResultsData {
  const _$ResultsDataImpl(
      {this.poll,
      this.statistics,
      final List<Position>? positions,
      this.userStatus})
      : _positions = positions;

  factory _$ResultsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultsDataImplFromJson(json);

  @override
  final Poll? poll;
  @override
  final Statistics? statistics;
  final List<Position>? _positions;
  @override
  List<Position>? get positions {
    final value = _positions;
    if (value == null) return null;
    if (_positions is EqualUnmodifiableListView) return _positions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final UserStatus? userStatus;

  @override
  String toString() {
    return 'ResultsData(poll: $poll, statistics: $statistics, positions: $positions, userStatus: $userStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultsDataImpl &&
            (identical(other.poll, poll) || other.poll == poll) &&
            (identical(other.statistics, statistics) ||
                other.statistics == statistics) &&
            const DeepCollectionEquality()
                .equals(other._positions, _positions) &&
            (identical(other.userStatus, userStatus) ||
                other.userStatus == userStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, poll, statistics,
      const DeepCollectionEquality().hash(_positions), userStatus);

  /// Create a copy of ResultsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultsDataImplCopyWith<_$ResultsDataImpl> get copyWith =>
      __$$ResultsDataImplCopyWithImpl<_$ResultsDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultsDataImplToJson(
      this,
    );
  }
}

abstract class _ResultsData implements ResultsData {
  const factory _ResultsData(
      {final Poll? poll,
      final Statistics? statistics,
      final List<Position>? positions,
      final UserStatus? userStatus}) = _$ResultsDataImpl;

  factory _ResultsData.fromJson(Map<String, dynamic> json) =
      _$ResultsDataImpl.fromJson;

  @override
  Poll? get poll;
  @override
  Statistics? get statistics;
  @override
  List<Position>? get positions;
  @override
  UserStatus? get userStatus;

  /// Create a copy of ResultsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultsDataImplCopyWith<_$ResultsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
