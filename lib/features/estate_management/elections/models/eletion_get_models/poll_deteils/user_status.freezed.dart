// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserStatus _$UserStatusFromJson(Map<String, dynamic> json) {
  return _UserStatus.fromJson(json);
}

/// @nodoc
mixin _$UserStatus {
  bool? get canVote => throw _privateConstructorUsedError;
  bool? get hasVoted => throw _privateConstructorUsedError;
  int? get votingProgress => throw _privateConstructorUsedError;
  int? get positionsVoted => throw _privateConstructorUsedError;
  int? get totalPositions => throw _privateConstructorUsedError;

  /// Serializes this UserStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserStatusCopyWith<UserStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStatusCopyWith<$Res> {
  factory $UserStatusCopyWith(
          UserStatus value, $Res Function(UserStatus) then) =
      _$UserStatusCopyWithImpl<$Res, UserStatus>;
  @useResult
  $Res call(
      {bool? canVote,
      bool? hasVoted,
      int? votingProgress,
      int? positionsVoted,
      int? totalPositions});
}

/// @nodoc
class _$UserStatusCopyWithImpl<$Res, $Val extends UserStatus>
    implements $UserStatusCopyWith<$Res> {
  _$UserStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canVote = freezed,
    Object? hasVoted = freezed,
    Object? votingProgress = freezed,
    Object? positionsVoted = freezed,
    Object? totalPositions = freezed,
  }) {
    return _then(_value.copyWith(
      canVote: freezed == canVote
          ? _value.canVote
          : canVote // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasVoted: freezed == hasVoted
          ? _value.hasVoted
          : hasVoted // ignore: cast_nullable_to_non_nullable
              as bool?,
      votingProgress: freezed == votingProgress
          ? _value.votingProgress
          : votingProgress // ignore: cast_nullable_to_non_nullable
              as int?,
      positionsVoted: freezed == positionsVoted
          ? _value.positionsVoted
          : positionsVoted // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPositions: freezed == totalPositions
          ? _value.totalPositions
          : totalPositions // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStatusImplCopyWith<$Res>
    implements $UserStatusCopyWith<$Res> {
  factory _$$UserStatusImplCopyWith(
          _$UserStatusImpl value, $Res Function(_$UserStatusImpl) then) =
      __$$UserStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? canVote,
      bool? hasVoted,
      int? votingProgress,
      int? positionsVoted,
      int? totalPositions});
}

/// @nodoc
class __$$UserStatusImplCopyWithImpl<$Res>
    extends _$UserStatusCopyWithImpl<$Res, _$UserStatusImpl>
    implements _$$UserStatusImplCopyWith<$Res> {
  __$$UserStatusImplCopyWithImpl(
      _$UserStatusImpl _value, $Res Function(_$UserStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canVote = freezed,
    Object? hasVoted = freezed,
    Object? votingProgress = freezed,
    Object? positionsVoted = freezed,
    Object? totalPositions = freezed,
  }) {
    return _then(_$UserStatusImpl(
      canVote: freezed == canVote
          ? _value.canVote
          : canVote // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasVoted: freezed == hasVoted
          ? _value.hasVoted
          : hasVoted // ignore: cast_nullable_to_non_nullable
              as bool?,
      votingProgress: freezed == votingProgress
          ? _value.votingProgress
          : votingProgress // ignore: cast_nullable_to_non_nullable
              as int?,
      positionsVoted: freezed == positionsVoted
          ? _value.positionsVoted
          : positionsVoted // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPositions: freezed == totalPositions
          ? _value.totalPositions
          : totalPositions // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$UserStatusImpl implements _UserStatus {
  const _$UserStatusImpl(
      {this.canVote,
      this.hasVoted,
      this.votingProgress,
      this.positionsVoted,
      this.totalPositions});

  factory _$UserStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatusImplFromJson(json);

  @override
  final bool? canVote;
  @override
  final bool? hasVoted;
  @override
  final int? votingProgress;
  @override
  final int? positionsVoted;
  @override
  final int? totalPositions;

  @override
  String toString() {
    return 'UserStatus(canVote: $canVote, hasVoted: $hasVoted, votingProgress: $votingProgress, positionsVoted: $positionsVoted, totalPositions: $totalPositions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatusImpl &&
            (identical(other.canVote, canVote) || other.canVote == canVote) &&
            (identical(other.hasVoted, hasVoted) ||
                other.hasVoted == hasVoted) &&
            (identical(other.votingProgress, votingProgress) ||
                other.votingProgress == votingProgress) &&
            (identical(other.positionsVoted, positionsVoted) ||
                other.positionsVoted == positionsVoted) &&
            (identical(other.totalPositions, totalPositions) ||
                other.totalPositions == totalPositions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, canVote, hasVoted,
      votingProgress, positionsVoted, totalPositions);

  /// Create a copy of UserStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStatusImplCopyWith<_$UserStatusImpl> get copyWith =>
      __$$UserStatusImplCopyWithImpl<_$UserStatusImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserStatusImplToJson(
      this,
    );
  }
}

abstract class _UserStatus implements UserStatus {
  const factory _UserStatus(
      {final bool? canVote,
      final bool? hasVoted,
      final int? votingProgress,
      final int? positionsVoted,
      final int? totalPositions}) = _$UserStatusImpl;

  factory _UserStatus.fromJson(Map<String, dynamic> json) =
      _$UserStatusImpl.fromJson;

  @override
  bool? get canVote;
  @override
  bool? get hasVoted;
  @override
  int? get votingProgress;
  @override
  int? get positionsVoted;
  @override
  int? get totalPositions;

  /// Create a copy of UserStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatusImplCopyWith<_$UserStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
