// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'polls_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PollsSummary _$PollsSummaryFromJson(Map<String, dynamic> json) {
  return _PollsSummary.fromJson(json);
}

/// @nodoc
mixin _$PollsSummary {
  int? get activePolls => throw _privateConstructorUsedError;
  int? get pollsVoted => throw _privateConstructorUsedError;
  int? get pendingPolls => throw _privateConstructorUsedError;

  /// Serializes this PollsSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PollsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PollsSummaryCopyWith<PollsSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollsSummaryCopyWith<$Res> {
  factory $PollsSummaryCopyWith(
          PollsSummary value, $Res Function(PollsSummary) then) =
      _$PollsSummaryCopyWithImpl<$Res, PollsSummary>;
  @useResult
  $Res call({int? activePolls, int? pollsVoted, int? pendingPolls});
}

/// @nodoc
class _$PollsSummaryCopyWithImpl<$Res, $Val extends PollsSummary>
    implements $PollsSummaryCopyWith<$Res> {
  _$PollsSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PollsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activePolls = freezed,
    Object? pollsVoted = freezed,
    Object? pendingPolls = freezed,
  }) {
    return _then(_value.copyWith(
      activePolls: freezed == activePolls
          ? _value.activePolls
          : activePolls // ignore: cast_nullable_to_non_nullable
              as int?,
      pollsVoted: freezed == pollsVoted
          ? _value.pollsVoted
          : pollsVoted // ignore: cast_nullable_to_non_nullable
              as int?,
      pendingPolls: freezed == pendingPolls
          ? _value.pendingPolls
          : pendingPolls // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PollsSummaryImplCopyWith<$Res>
    implements $PollsSummaryCopyWith<$Res> {
  factory _$$PollsSummaryImplCopyWith(
          _$PollsSummaryImpl value, $Res Function(_$PollsSummaryImpl) then) =
      __$$PollsSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? activePolls, int? pollsVoted, int? pendingPolls});
}

/// @nodoc
class __$$PollsSummaryImplCopyWithImpl<$Res>
    extends _$PollsSummaryCopyWithImpl<$Res, _$PollsSummaryImpl>
    implements _$$PollsSummaryImplCopyWith<$Res> {
  __$$PollsSummaryImplCopyWithImpl(
      _$PollsSummaryImpl _value, $Res Function(_$PollsSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PollsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activePolls = freezed,
    Object? pollsVoted = freezed,
    Object? pendingPolls = freezed,
  }) {
    return _then(_$PollsSummaryImpl(
      activePolls: freezed == activePolls
          ? _value.activePolls
          : activePolls // ignore: cast_nullable_to_non_nullable
              as int?,
      pollsVoted: freezed == pollsVoted
          ? _value.pollsVoted
          : pollsVoted // ignore: cast_nullable_to_non_nullable
              as int?,
      pendingPolls: freezed == pendingPolls
          ? _value.pendingPolls
          : pendingPolls // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PollsSummaryImpl implements _PollsSummary {
  const _$PollsSummaryImpl(
      {this.activePolls, this.pollsVoted, this.pendingPolls});

  factory _$PollsSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollsSummaryImplFromJson(json);

  @override
  final int? activePolls;
  @override
  final int? pollsVoted;
  @override
  final int? pendingPolls;

  @override
  String toString() {
    return 'PollsSummary(activePolls: $activePolls, pollsVoted: $pollsVoted, pendingPolls: $pendingPolls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollsSummaryImpl &&
            (identical(other.activePolls, activePolls) ||
                other.activePolls == activePolls) &&
            (identical(other.pollsVoted, pollsVoted) ||
                other.pollsVoted == pollsVoted) &&
            (identical(other.pendingPolls, pendingPolls) ||
                other.pendingPolls == pendingPolls));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, activePolls, pollsVoted, pendingPolls);

  /// Create a copy of PollsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PollsSummaryImplCopyWith<_$PollsSummaryImpl> get copyWith =>
      __$$PollsSummaryImplCopyWithImpl<_$PollsSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollsSummaryImplToJson(
      this,
    );
  }
}

abstract class _PollsSummary implements PollsSummary {
  const factory _PollsSummary(
      {final int? activePolls,
      final int? pollsVoted,
      final int? pendingPolls}) = _$PollsSummaryImpl;

  factory _PollsSummary.fromJson(Map<String, dynamic> json) =
      _$PollsSummaryImpl.fromJson;

  @override
  int? get activePolls;
  @override
  int? get pollsVoted;
  @override
  int? get pendingPolls;

  /// Create a copy of PollsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PollsSummaryImplCopyWith<_$PollsSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
