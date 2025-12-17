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
  bool? get hasVoted => throw _privateConstructorUsedError;
  bool? get canVote => throw _privateConstructorUsedError;

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
  $Res call({bool? hasVoted, bool? canVote});
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
    Object? hasVoted = freezed,
    Object? canVote = freezed,
  }) {
    return _then(_value.copyWith(
      hasVoted: freezed == hasVoted
          ? _value.hasVoted
          : hasVoted // ignore: cast_nullable_to_non_nullable
              as bool?,
      canVote: freezed == canVote
          ? _value.canVote
          : canVote // ignore: cast_nullable_to_non_nullable
              as bool?,
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
  $Res call({bool? hasVoted, bool? canVote});
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
    Object? hasVoted = freezed,
    Object? canVote = freezed,
  }) {
    return _then(_$UserStatusImpl(
      hasVoted: freezed == hasVoted
          ? _value.hasVoted
          : hasVoted // ignore: cast_nullable_to_non_nullable
              as bool?,
      canVote: freezed == canVote
          ? _value.canVote
          : canVote // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserStatusImpl implements _UserStatus {
  const _$UserStatusImpl({this.hasVoted, this.canVote});

  factory _$UserStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserStatusImplFromJson(json);

  @override
  final bool? hasVoted;
  @override
  final bool? canVote;

  @override
  String toString() {
    return 'UserStatus(hasVoted: $hasVoted, canVote: $canVote)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStatusImpl &&
            (identical(other.hasVoted, hasVoted) ||
                other.hasVoted == hasVoted) &&
            (identical(other.canVote, canVote) || other.canVote == canVote));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hasVoted, canVote);

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
  const factory _UserStatus({final bool? hasVoted, final bool? canVote}) =
      _$UserStatusImpl;

  factory _UserStatus.fromJson(Map<String, dynamic> json) =
      _$UserStatusImpl.fromJson;

  @override
  bool? get hasVoted;
  @override
  bool? get canVote;

  /// Create a copy of UserStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserStatusImplCopyWith<_$UserStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
