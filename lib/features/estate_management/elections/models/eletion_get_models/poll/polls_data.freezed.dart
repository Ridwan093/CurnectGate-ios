// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'polls_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PollsData _$PollsDataFromJson(Map<String, dynamic> json) {
  return _PollsData.fromJson(json);
}

/// @nodoc
mixin _$PollsData {
  List<PollItemSummary>? get polls => throw _privateConstructorUsedError;
  PollsSummary? get summary => throw _privateConstructorUsedError;

  /// Serializes this PollsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PollsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PollsDataCopyWith<PollsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollsDataCopyWith<$Res> {
  factory $PollsDataCopyWith(PollsData value, $Res Function(PollsData) then) =
      _$PollsDataCopyWithImpl<$Res, PollsData>;
  @useResult
  $Res call({List<PollItemSummary>? polls, PollsSummary? summary});

  $PollsSummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class _$PollsDataCopyWithImpl<$Res, $Val extends PollsData>
    implements $PollsDataCopyWith<$Res> {
  _$PollsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PollsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? polls = freezed,
    Object? summary = freezed,
  }) {
    return _then(_value.copyWith(
      polls: freezed == polls
          ? _value.polls
          : polls // ignore: cast_nullable_to_non_nullable
              as List<PollItemSummary>?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as PollsSummary?,
    ) as $Val);
  }

  /// Create a copy of PollsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PollsSummaryCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $PollsSummaryCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PollsDataImplCopyWith<$Res>
    implements $PollsDataCopyWith<$Res> {
  factory _$$PollsDataImplCopyWith(
          _$PollsDataImpl value, $Res Function(_$PollsDataImpl) then) =
      __$$PollsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<PollItemSummary>? polls, PollsSummary? summary});

  @override
  $PollsSummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class __$$PollsDataImplCopyWithImpl<$Res>
    extends _$PollsDataCopyWithImpl<$Res, _$PollsDataImpl>
    implements _$$PollsDataImplCopyWith<$Res> {
  __$$PollsDataImplCopyWithImpl(
      _$PollsDataImpl _value, $Res Function(_$PollsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PollsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? polls = freezed,
    Object? summary = freezed,
  }) {
    return _then(_$PollsDataImpl(
      polls: freezed == polls
          ? _value._polls
          : polls // ignore: cast_nullable_to_non_nullable
              as List<PollItemSummary>?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as PollsSummary?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PollsDataImpl implements _PollsData {
  const _$PollsDataImpl({final List<PollItemSummary>? polls, this.summary})
      : _polls = polls;

  factory _$PollsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollsDataImplFromJson(json);

  final List<PollItemSummary>? _polls;
  @override
  List<PollItemSummary>? get polls {
    final value = _polls;
    if (value == null) return null;
    if (_polls is EqualUnmodifiableListView) return _polls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PollsSummary? summary;

  @override
  String toString() {
    return 'PollsData(polls: $polls, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollsDataImpl &&
            const DeepCollectionEquality().equals(other._polls, _polls) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_polls), summary);

  /// Create a copy of PollsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PollsDataImplCopyWith<_$PollsDataImpl> get copyWith =>
      __$$PollsDataImplCopyWithImpl<_$PollsDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollsDataImplToJson(
      this,
    );
  }
}

abstract class _PollsData implements PollsData {
  const factory _PollsData(
      {final List<PollItemSummary>? polls,
      final PollsSummary? summary}) = _$PollsDataImpl;

  factory _PollsData.fromJson(Map<String, dynamic> json) =
      _$PollsDataImpl.fromJson;

  @override
  List<PollItemSummary>? get polls;
  @override
  PollsSummary? get summary;

  /// Create a copy of PollsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PollsDataImplCopyWith<_$PollsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
