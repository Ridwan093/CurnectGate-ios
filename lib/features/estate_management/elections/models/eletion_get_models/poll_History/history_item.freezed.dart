// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HistoryItem _$HistoryItemFromJson(Map<String, dynamic> json) {
  return _HistoryItem.fromJson(json);
}

/// @nodoc
mixin _$HistoryItem {
  int? get pollId => throw _privateConstructorUsedError;
  String? get pollTitle => throw _privateConstructorUsedError;
  String? get pollType => throw _privateConstructorUsedError;
  String? get pollStatus => throw _privateConstructorUsedError;
  String? get votedAt => throw _privateConstructorUsedError;
  int? get positionsVoted => throw _privateConstructorUsedError;
  List<VoteItem>? get votes => throw _privateConstructorUsedError;

  /// Serializes this HistoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryItemCopyWith<HistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryItemCopyWith<$Res> {
  factory $HistoryItemCopyWith(
          HistoryItem value, $Res Function(HistoryItem) then) =
      _$HistoryItemCopyWithImpl<$Res, HistoryItem>;
  @useResult
  $Res call(
      {int? pollId,
      String? pollTitle,
      String? pollType,
      String? pollStatus,
      String? votedAt,
      int? positionsVoted,
      List<VoteItem>? votes});
}

/// @nodoc
class _$HistoryItemCopyWithImpl<$Res, $Val extends HistoryItem>
    implements $HistoryItemCopyWith<$Res> {
  _$HistoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pollId = freezed,
    Object? pollTitle = freezed,
    Object? pollType = freezed,
    Object? pollStatus = freezed,
    Object? votedAt = freezed,
    Object? positionsVoted = freezed,
    Object? votes = freezed,
  }) {
    return _then(_value.copyWith(
      pollId: freezed == pollId
          ? _value.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as int?,
      pollTitle: freezed == pollTitle
          ? _value.pollTitle
          : pollTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      pollType: freezed == pollType
          ? _value.pollType
          : pollType // ignore: cast_nullable_to_non_nullable
              as String?,
      pollStatus: freezed == pollStatus
          ? _value.pollStatus
          : pollStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      votedAt: freezed == votedAt
          ? _value.votedAt
          : votedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      positionsVoted: freezed == positionsVoted
          ? _value.positionsVoted
          : positionsVoted // ignore: cast_nullable_to_non_nullable
              as int?,
      votes: freezed == votes
          ? _value.votes
          : votes // ignore: cast_nullable_to_non_nullable
              as List<VoteItem>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryItemImplCopyWith<$Res>
    implements $HistoryItemCopyWith<$Res> {
  factory _$$HistoryItemImplCopyWith(
          _$HistoryItemImpl value, $Res Function(_$HistoryItemImpl) then) =
      __$$HistoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? pollId,
      String? pollTitle,
      String? pollType,
      String? pollStatus,
      String? votedAt,
      int? positionsVoted,
      List<VoteItem>? votes});
}

/// @nodoc
class __$$HistoryItemImplCopyWithImpl<$Res>
    extends _$HistoryItemCopyWithImpl<$Res, _$HistoryItemImpl>
    implements _$$HistoryItemImplCopyWith<$Res> {
  __$$HistoryItemImplCopyWithImpl(
      _$HistoryItemImpl _value, $Res Function(_$HistoryItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pollId = freezed,
    Object? pollTitle = freezed,
    Object? pollType = freezed,
    Object? pollStatus = freezed,
    Object? votedAt = freezed,
    Object? positionsVoted = freezed,
    Object? votes = freezed,
  }) {
    return _then(_$HistoryItemImpl(
      pollId: freezed == pollId
          ? _value.pollId
          : pollId // ignore: cast_nullable_to_non_nullable
              as int?,
      pollTitle: freezed == pollTitle
          ? _value.pollTitle
          : pollTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      pollType: freezed == pollType
          ? _value.pollType
          : pollType // ignore: cast_nullable_to_non_nullable
              as String?,
      pollStatus: freezed == pollStatus
          ? _value.pollStatus
          : pollStatus // ignore: cast_nullable_to_non_nullable
              as String?,
      votedAt: freezed == votedAt
          ? _value.votedAt
          : votedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      positionsVoted: freezed == positionsVoted
          ? _value.positionsVoted
          : positionsVoted // ignore: cast_nullable_to_non_nullable
              as int?,
      votes: freezed == votes
          ? _value._votes
          : votes // ignore: cast_nullable_to_non_nullable
              as List<VoteItem>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$HistoryItemImpl implements _HistoryItem {
  const _$HistoryItemImpl(
      {this.pollId,
      this.pollTitle,
      this.pollType,
      this.pollStatus,
      this.votedAt,
      this.positionsVoted,
      final List<VoteItem>? votes})
      : _votes = votes;

  factory _$HistoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryItemImplFromJson(json);

  @override
  final int? pollId;
  @override
  final String? pollTitle;
  @override
  final String? pollType;
  @override
  final String? pollStatus;
  @override
  final String? votedAt;
  @override
  final int? positionsVoted;
  final List<VoteItem>? _votes;
  @override
  List<VoteItem>? get votes {
    final value = _votes;
    if (value == null) return null;
    if (_votes is EqualUnmodifiableListView) return _votes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HistoryItem(pollId: $pollId, pollTitle: $pollTitle, pollType: $pollType, pollStatus: $pollStatus, votedAt: $votedAt, positionsVoted: $positionsVoted, votes: $votes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryItemImpl &&
            (identical(other.pollId, pollId) || other.pollId == pollId) &&
            (identical(other.pollTitle, pollTitle) ||
                other.pollTitle == pollTitle) &&
            (identical(other.pollType, pollType) ||
                other.pollType == pollType) &&
            (identical(other.pollStatus, pollStatus) ||
                other.pollStatus == pollStatus) &&
            (identical(other.votedAt, votedAt) || other.votedAt == votedAt) &&
            (identical(other.positionsVoted, positionsVoted) ||
                other.positionsVoted == positionsVoted) &&
            const DeepCollectionEquality().equals(other._votes, _votes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pollId,
      pollTitle,
      pollType,
      pollStatus,
      votedAt,
      positionsVoted,
      const DeepCollectionEquality().hash(_votes));

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryItemImplCopyWith<_$HistoryItemImpl> get copyWith =>
      __$$HistoryItemImplCopyWithImpl<_$HistoryItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryItemImplToJson(
      this,
    );
  }
}

abstract class _HistoryItem implements HistoryItem {
  const factory _HistoryItem(
      {final int? pollId,
      final String? pollTitle,
      final String? pollType,
      final String? pollStatus,
      final String? votedAt,
      final int? positionsVoted,
      final List<VoteItem>? votes}) = _$HistoryItemImpl;

  factory _HistoryItem.fromJson(Map<String, dynamic> json) =
      _$HistoryItemImpl.fromJson;

  @override
  int? get pollId;
  @override
  String? get pollTitle;
  @override
  String? get pollType;
  @override
  String? get pollStatus;
  @override
  String? get votedAt;
  @override
  int? get positionsVoted;
  @override
  List<VoteItem>? get votes;

  /// Create a copy of HistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryItemImplCopyWith<_$HistoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
