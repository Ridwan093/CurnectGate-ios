// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_history_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PollHistoryData _$PollHistoryDataFromJson(Map<String, dynamic> json) {
  return _PollHistoryData.fromJson(json);
}

/// @nodoc
mixin _$PollHistoryData {
  List<HistoryItem>? get history => throw _privateConstructorUsedError;
  int? get totalPollsVoted => throw _privateConstructorUsedError;

  /// Serializes this PollHistoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PollHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PollHistoryDataCopyWith<PollHistoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollHistoryDataCopyWith<$Res> {
  factory $PollHistoryDataCopyWith(
          PollHistoryData value, $Res Function(PollHistoryData) then) =
      _$PollHistoryDataCopyWithImpl<$Res, PollHistoryData>;
  @useResult
  $Res call({List<HistoryItem>? history, int? totalPollsVoted});
}

/// @nodoc
class _$PollHistoryDataCopyWithImpl<$Res, $Val extends PollHistoryData>
    implements $PollHistoryDataCopyWith<$Res> {
  _$PollHistoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PollHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = freezed,
    Object? totalPollsVoted = freezed,
  }) {
    return _then(_value.copyWith(
      history: freezed == history
          ? _value.history
          : history // ignore: cast_nullable_to_non_nullable
              as List<HistoryItem>?,
      totalPollsVoted: freezed == totalPollsVoted
          ? _value.totalPollsVoted
          : totalPollsVoted // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PollHistoryDataImplCopyWith<$Res>
    implements $PollHistoryDataCopyWith<$Res> {
  factory _$$PollHistoryDataImplCopyWith(_$PollHistoryDataImpl value,
          $Res Function(_$PollHistoryDataImpl) then) =
      __$$PollHistoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<HistoryItem>? history, int? totalPollsVoted});
}

/// @nodoc
class __$$PollHistoryDataImplCopyWithImpl<$Res>
    extends _$PollHistoryDataCopyWithImpl<$Res, _$PollHistoryDataImpl>
    implements _$$PollHistoryDataImplCopyWith<$Res> {
  __$$PollHistoryDataImplCopyWithImpl(
      _$PollHistoryDataImpl _value, $Res Function(_$PollHistoryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PollHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? history = freezed,
    Object? totalPollsVoted = freezed,
  }) {
    return _then(_$PollHistoryDataImpl(
      history: freezed == history
          ? _value._history
          : history // ignore: cast_nullable_to_non_nullable
              as List<HistoryItem>?,
      totalPollsVoted: freezed == totalPollsVoted
          ? _value.totalPollsVoted
          : totalPollsVoted // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PollHistoryDataImpl implements _PollHistoryData {
  const _$PollHistoryDataImpl(
      {final List<HistoryItem>? history, this.totalPollsVoted})
      : _history = history;

  factory _$PollHistoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollHistoryDataImplFromJson(json);

  final List<HistoryItem>? _history;
  @override
  List<HistoryItem>? get history {
    final value = _history;
    if (value == null) return null;
    if (_history is EqualUnmodifiableListView) return _history;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? totalPollsVoted;

  @override
  String toString() {
    return 'PollHistoryData(history: $history, totalPollsVoted: $totalPollsVoted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollHistoryDataImpl &&
            const DeepCollectionEquality().equals(other._history, _history) &&
            (identical(other.totalPollsVoted, totalPollsVoted) ||
                other.totalPollsVoted == totalPollsVoted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_history), totalPollsVoted);

  /// Create a copy of PollHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PollHistoryDataImplCopyWith<_$PollHistoryDataImpl> get copyWith =>
      __$$PollHistoryDataImplCopyWithImpl<_$PollHistoryDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollHistoryDataImplToJson(
      this,
    );
  }
}

abstract class _PollHistoryData implements PollHistoryData {
  const factory _PollHistoryData(
      {final List<HistoryItem>? history,
      final int? totalPollsVoted}) = _$PollHistoryDataImpl;

  factory _PollHistoryData.fromJson(Map<String, dynamic> json) =
      _$PollHistoryDataImpl.fromJson;

  @override
  List<HistoryItem>? get history;
  @override
  int? get totalPollsVoted;

  /// Create a copy of PollHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PollHistoryDataImplCopyWith<_$PollHistoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
