// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'position.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Position _$PositionFromJson(Map<String, dynamic> json) {
  return _Position.fromJson(json);
}

/// @nodoc
mixin _$Position {
  int? get positionId => throw _privateConstructorUsedError;
  String? get positionTitle => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;
  int? get positionOrder => throw _privateConstructorUsedError;
  int? get totalVotes => throw _privateConstructorUsedError;
  List<Candidate>? get candidates => throw _privateConstructorUsedError;
  List<Candidate>? get winners => throw _privateConstructorUsedError;

  /// Serializes this Position to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Position
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PositionCopyWith<Position> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PositionCopyWith<$Res> {
  factory $PositionCopyWith(Position value, $Res Function(Position) then) =
      _$PositionCopyWithImpl<$Res, Position>;
  @useResult
  $Res call(
      {int? positionId,
      String? positionTitle,
      String? description,
      String? color,
      int? positionOrder,
      int? totalVotes,
      List<Candidate>? candidates,
      List<Candidate>? winners});
}

/// @nodoc
class _$PositionCopyWithImpl<$Res, $Val extends Position>
    implements $PositionCopyWith<$Res> {
  _$PositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Position
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positionId = freezed,
    Object? positionTitle = freezed,
    Object? description = freezed,
    Object? color = freezed,
    Object? positionOrder = freezed,
    Object? totalVotes = freezed,
    Object? candidates = freezed,
    Object? winners = freezed,
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
      totalVotes: freezed == totalVotes
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as int?,
      candidates: freezed == candidates
          ? _value.candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<Candidate>?,
      winners: freezed == winners
          ? _value.winners
          : winners // ignore: cast_nullable_to_non_nullable
              as List<Candidate>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PositionImplCopyWith<$Res>
    implements $PositionCopyWith<$Res> {
  factory _$$PositionImplCopyWith(
          _$PositionImpl value, $Res Function(_$PositionImpl) then) =
      __$$PositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? positionId,
      String? positionTitle,
      String? description,
      String? color,
      int? positionOrder,
      int? totalVotes,
      List<Candidate>? candidates,
      List<Candidate>? winners});
}

/// @nodoc
class __$$PositionImplCopyWithImpl<$Res>
    extends _$PositionCopyWithImpl<$Res, _$PositionImpl>
    implements _$$PositionImplCopyWith<$Res> {
  __$$PositionImplCopyWithImpl(
      _$PositionImpl _value, $Res Function(_$PositionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Position
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? positionId = freezed,
    Object? positionTitle = freezed,
    Object? description = freezed,
    Object? color = freezed,
    Object? positionOrder = freezed,
    Object? totalVotes = freezed,
    Object? candidates = freezed,
    Object? winners = freezed,
  }) {
    return _then(_$PositionImpl(
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
      totalVotes: freezed == totalVotes
          ? _value.totalVotes
          : totalVotes // ignore: cast_nullable_to_non_nullable
              as int?,
      candidates: freezed == candidates
          ? _value._candidates
          : candidates // ignore: cast_nullable_to_non_nullable
              as List<Candidate>?,
      winners: freezed == winners
          ? _value._winners
          : winners // ignore: cast_nullable_to_non_nullable
              as List<Candidate>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PositionImpl implements _Position {
  const _$PositionImpl(
      {this.positionId,
      this.positionTitle,
      this.description,
      this.color,
      this.positionOrder,
      this.totalVotes,
      final List<Candidate>? candidates,
      final List<Candidate>? winners})
      : _candidates = candidates,
        _winners = winners;

  factory _$PositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PositionImplFromJson(json);

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
  final int? totalVotes;
  final List<Candidate>? _candidates;
  @override
  List<Candidate>? get candidates {
    final value = _candidates;
    if (value == null) return null;
    if (_candidates is EqualUnmodifiableListView) return _candidates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Candidate>? _winners;
  @override
  List<Candidate>? get winners {
    final value = _winners;
    if (value == null) return null;
    if (_winners is EqualUnmodifiableListView) return _winners;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Position(positionId: $positionId, positionTitle: $positionTitle, description: $description, color: $color, positionOrder: $positionOrder, totalVotes: $totalVotes, candidates: $candidates, winners: $winners)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PositionImpl &&
            (identical(other.positionId, positionId) ||
                other.positionId == positionId) &&
            (identical(other.positionTitle, positionTitle) ||
                other.positionTitle == positionTitle) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.positionOrder, positionOrder) ||
                other.positionOrder == positionOrder) &&
            (identical(other.totalVotes, totalVotes) ||
                other.totalVotes == totalVotes) &&
            const DeepCollectionEquality()
                .equals(other._candidates, _candidates) &&
            const DeepCollectionEquality().equals(other._winners, _winners));
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
      totalVotes,
      const DeepCollectionEquality().hash(_candidates),
      const DeepCollectionEquality().hash(_winners));

  /// Create a copy of Position
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PositionImplCopyWith<_$PositionImpl> get copyWith =>
      __$$PositionImplCopyWithImpl<_$PositionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PositionImplToJson(
      this,
    );
  }
}

abstract class _Position implements Position {
  const factory _Position(
      {final int? positionId,
      final String? positionTitle,
      final String? description,
      final String? color,
      final int? positionOrder,
      final int? totalVotes,
      final List<Candidate>? candidates,
      final List<Candidate>? winners}) = _$PositionImpl;

  factory _Position.fromJson(Map<String, dynamic> json) =
      _$PositionImpl.fromJson;

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
  int? get totalVotes;
  @override
  List<Candidate>? get candidates;
  @override
  List<Candidate>? get winners;

  /// Create a copy of Position
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PositionImplCopyWith<_$PositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
