// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'position_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PositionData _$PositionDataFromJson(Map<String, dynamic> json) {
  return _PositionData.fromJson(json);
}

/// @nodoc
mixin _$PositionData {
  int? get positionId => throw _privateConstructorUsedError;
  String? get positionTitle => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  int? get positionOrder => throw _privateConstructorUsedError;
  int? get minSelections => throw _privateConstructorUsedError;
  int? get maxSelections => throw _privateConstructorUsedError;
  int? get totalVotesCast => throw _privateConstructorUsedError;
  int? get candidatesCount => throw _privateConstructorUsedError;
  List<CandidateData>? get candidates => throw _privateConstructorUsedError;
  List<CandidateData>? get currentLeaders => throw _privateConstructorUsedError;

  /// Serializes this PositionData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PositionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PositionDataCopyWith<PositionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionDataCopyWith<$Res> {
  factory $PositionDataCopyWith(
          PositionData value, $Res Function(PositionData) then) =
      _$PositionDataCopyWithImpl<$Res, PositionData>;
  @useResult
  $Res call(
      {int? positionId,
      String? positionTitle,
      String? description,
      String? color,
      int? positionOrder,
      int? minSelections,
      int? maxSelections,
      int? totalVotesCast,
      int? candidatesCount,
      List<CandidateData>? candidates,
      List<CandidateData>? currentLeaders});
}

/// @nodoc
class _$PositionDataCopyWithImpl<$Res, $Val extends PositionData>
    implements $PositionDataCopyWith<$Res> {
  _$PositionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PositionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positionId = freezed,
    Object? positionTitle = freezed,
    Object? description = freezed,
    Object? color = freezed,
    Object? positionOrder = freezed,
    Object? minSelections = freezed,
    Object? maxSelections = freezed,
    Object? totalVotesCast = freezed,
    Object? candidatesCount = freezed,
    Object? candidates = freezed,
    Object? currentLeaders = freezed,
  }) {
    return _then(_value.copyWith(
      positionId: freezed == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int?,
      positionTitle: freezed == positionTitle
          ? _value.positionTitle
          : positionTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      positionOrder: freezed == positionOrder
          ? _value.positionOrder
          : positionOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      minSelections: freezed == minSelections
          ? _value.minSelections
          : minSelections // ignore: cast_nullable_to_non_nullable
              as int?,
      maxSelections: freezed == maxSelections
          ? _value.maxSelections
          : maxSelections // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVotesCast: freezed == totalVotesCast
          ? _value.totalVotesCast
          : totalVotesCast // ignore: cast_nullable_to_non_nullable
              as int?,
      candidatesCount: freezed == candidatesCount
          ? _value.candidatesCount
          : candidatesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      candidates: freezed == candidates
          ? _value.candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<CandidateData>?,
      currentLeaders: freezed == currentLeaders
          ? _value.currentLeaders
          : currentLeaders // ignore: cast_nullable_to_non_nullable
              as List<CandidateData>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PositionDataImplCopyWith<$Res>
    implements $PositionDataCopyWith<$Res> {
  factory _$$PositionDataImplCopyWith(
          _$PositionDataImpl value, $Res Function(_$PositionDataImpl) then) =
      __$$PositionDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? positionId,
      String? positionTitle,
      String? description,
      String? color,
      int? positionOrder,
      int? minSelections,
      int? maxSelections,
      int? totalVotesCast,
      int? candidatesCount,
      List<CandidateData>? candidates,
      List<CandidateData>? currentLeaders});
}

/// @nodoc
class __$$PositionDataImplCopyWithImpl<$Res>
    extends _$PositionDataCopyWithImpl<$Res, _$PositionDataImpl>
    implements _$$PositionDataImplCopyWith<$Res> {
  __$$PositionDataImplCopyWithImpl(
      _$PositionDataImpl _value, $Res Function(_$PositionDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PositionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positionId = freezed,
    Object? positionTitle = freezed,
    Object? description = freezed,
    Object? color = freezed,
    Object? positionOrder = freezed,
    Object? minSelections = freezed,
    Object? maxSelections = freezed,
    Object? totalVotesCast = freezed,
    Object? candidatesCount = freezed,
    Object? candidates = freezed,
    Object? currentLeaders = freezed,
  }) {
    return _then(_$PositionDataImpl(
      positionId: freezed == positionId
          ? _value.positionId
          : positionId // ignore: cast_nullable_to_non_nullable
              as int?,
      positionTitle: freezed == positionTitle
          ? _value.positionTitle
          : positionTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
      positionOrder: freezed == positionOrder
          ? _value.positionOrder
          : positionOrder // ignore: cast_nullable_to_non_nullable
              as int?,
      minSelections: freezed == minSelections
          ? _value.minSelections
          : minSelections // ignore: cast_nullable_to_non_nullable
              as int?,
      maxSelections: freezed == maxSelections
          ? _value.maxSelections
          : maxSelections // ignore: cast_nullable_to_non_nullable
              as int?,
      totalVotesCast: freezed == totalVotesCast
          ? _value.totalVotesCast
          : totalVotesCast // ignore: cast_nullable_to_non_nullable
              as int?,
      candidatesCount: freezed == candidatesCount
          ? _value.candidatesCount
          : candidatesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      candidates: freezed == candidates
          ? _value._candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<CandidateData>?,
      currentLeaders: freezed == currentLeaders
          ? _value._currentLeaders
          : currentLeaders // ignore: cast_nullable_to_non_nullable
              as List<CandidateData>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PositionDataImpl implements _PositionData {
  const _$PositionDataImpl(
      {this.positionId,
      this.positionTitle,
      this.description,
      this.color,
      this.positionOrder,
      this.minSelections,
      this.maxSelections,
      this.totalVotesCast,
      this.candidatesCount,
      final List<CandidateData>? candidates,
      final List<CandidateData>? currentLeaders})
      : _candidates = candidates,
        _currentLeaders = currentLeaders;

  factory _$PositionDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PositionDataImplFromJson(json);

  @override
  final int? positionId;
  @override
  final String? positionTitle;
  @override
  final String? description;
  @override
  final String? color;
  @override
  final int? positionOrder;
  @override
  final int? minSelections;
  @override
  final int? maxSelections;
  @override
  final int? totalVotesCast;
  @override
  final int? candidatesCount;
  final List<CandidateData>? _candidates;
  @override
  List<CandidateData>? get candidates {
    final value = _candidates;
    if (value == null) return null;
    if (_candidates is EqualUnmodifiableListView) return _candidates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<CandidateData>? _currentLeaders;
  @override
  List<CandidateData>? get currentLeaders {
    final value = _currentLeaders;
    if (value == null) return null;
    if (_currentLeaders is EqualUnmodifiableListView) return _currentLeaders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PositionData(positionId: $positionId, positionTitle: $positionTitle, description: $description, color: $color, positionOrder: $positionOrder, minSelections: $minSelections, maxSelections: $maxSelections, totalVotesCast: $totalVotesCast, candidatesCount: $candidatesCount, candidates: $candidates, currentLeaders: $currentLeaders)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionDataImpl &&
            (identical(other.positionId, positionId) ||
                other.positionId == positionId) &&
            (identical(other.positionTitle, positionTitle) ||
                other.positionTitle == positionTitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.positionOrder, positionOrder) ||
                other.positionOrder == positionOrder) &&
            (identical(other.minSelections, minSelections) ||
                other.minSelections == minSelections) &&
            (identical(other.maxSelections, maxSelections) ||
                other.maxSelections == maxSelections) &&
            (identical(other.totalVotesCast, totalVotesCast) ||
                other.totalVotesCast == totalVotesCast) &&
            (identical(other.candidatesCount, candidatesCount) ||
                other.candidatesCount == candidatesCount) &&
            const DeepCollectionEquality()
                .equals(other._candidates, _candidates) &&
            const DeepCollectionEquality()
                .equals(other._currentLeaders, _currentLeaders));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      positionId,
      positionTitle,
      description,
      color,
      positionOrder,
      minSelections,
      maxSelections,
      totalVotesCast,
      candidatesCount,
      const DeepCollectionEquality().hash(_candidates),
      const DeepCollectionEquality().hash(_currentLeaders));

  /// Create a copy of PositionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionDataImplCopyWith<_$PositionDataImpl> get copyWith =>
      __$$PositionDataImplCopyWithImpl<_$PositionDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PositionDataImplToJson(
      this,
    );
  }
}

abstract class _PositionData implements PositionData {
  const factory _PositionData(
      {final int? positionId,
      final String? positionTitle,
      final String? description,
      final String? color,
      final int? positionOrder,
      final int? minSelections,
      final int? maxSelections,
      final int? totalVotesCast,
      final int? candidatesCount,
      final List<CandidateData>? candidates,
      final List<CandidateData>? currentLeaders}) = _$PositionDataImpl;

  factory _PositionData.fromJson(Map<String, dynamic> json) =
      _$PositionDataImpl.fromJson;

  @override
  int? get positionId;
  @override
  String? get positionTitle;
  @override
  String? get description;
  @override
  String? get color;
  @override
  int? get positionOrder;
  @override
  int? get minSelections;
  @override
  int? get maxSelections;
  @override
  int? get totalVotesCast;
  @override
  int? get candidatesCount;
  @override
  List<CandidateData>? get candidates;
  @override
  List<CandidateData>? get currentLeaders;

  /// Create a copy of PositionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PositionDataImplCopyWith<_$PositionDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
