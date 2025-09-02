// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_position_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BoardPosition _$BoardPositionFromJson(Map<String, dynamic> json) {
  return _BoardPosition.fromJson(json);
}

/// @nodoc
mixin _$BoardPosition {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  DateTime? get termStartDate => throw _privateConstructorUsedError;
  DateTime? get termEndDate => throw _privateConstructorUsedError;
  int? get termNumber => throw _privateConstructorUsedError;

  /// Serializes this BoardPosition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BoardPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoardPositionCopyWith<BoardPosition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardPositionCopyWith<$Res> {
  factory $BoardPositionCopyWith(
          BoardPosition value, $Res Function(BoardPosition) then) =
      _$BoardPositionCopyWithImpl<$Res, BoardPosition>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      DateTime? termStartDate,
      DateTime? termEndDate,
      int? termNumber});
}

/// @nodoc
class _$BoardPositionCopyWithImpl<$Res, $Val extends BoardPosition>
    implements $BoardPositionCopyWith<$Res> {
  _$BoardPositionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BoardPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? termStartDate = freezed,
    Object? termEndDate = freezed,
    Object? termNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      termStartDate: freezed == termStartDate
          ? _value.termStartDate
          : termStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      termEndDate: freezed == termEndDate
          ? _value.termEndDate
          : termEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      termNumber: freezed == termNumber
          ? _value.termNumber
          : termNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoardPositionImplCopyWith<$Res>
    implements $BoardPositionCopyWith<$Res> {
  factory _$$BoardPositionImplCopyWith(
          _$BoardPositionImpl value, $Res Function(_$BoardPositionImpl) then) =
      __$$BoardPositionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      DateTime? termStartDate,
      DateTime? termEndDate,
      int? termNumber});
}

/// @nodoc
class __$$BoardPositionImplCopyWithImpl<$Res>
    extends _$BoardPositionCopyWithImpl<$Res, _$BoardPositionImpl>
    implements _$$BoardPositionImplCopyWith<$Res> {
  __$$BoardPositionImplCopyWithImpl(
      _$BoardPositionImpl _value, $Res Function(_$BoardPositionImpl) _then)
      : super(_value, _then);

  /// Create a copy of BoardPosition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? termStartDate = freezed,
    Object? termEndDate = freezed,
    Object? termNumber = freezed,
  }) {
    return _then(_$BoardPositionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      termStartDate: freezed == termStartDate
          ? _value.termStartDate
          : termStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      termEndDate: freezed == termEndDate
          ? _value.termEndDate
          : termEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      termNumber: freezed == termNumber
          ? _value.termNumber
          : termNumber // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$BoardPositionImpl implements _BoardPosition {
  const _$BoardPositionImpl(
      {this.id,
      this.title,
      this.termStartDate,
      this.termEndDate,
      this.termNumber});

  factory _$BoardPositionImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardPositionImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final DateTime? termStartDate;
  @override
  final DateTime? termEndDate;
  @override
  final int? termNumber;

  @override
  String toString() {
    return 'BoardPosition(id: $id, title: $title, termStartDate: $termStartDate, termEndDate: $termEndDate, termNumber: $termNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardPositionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.termStartDate, termStartDate) ||
                other.termStartDate == termStartDate) &&
            (identical(other.termEndDate, termEndDate) ||
                other.termEndDate == termEndDate) &&
            (identical(other.termNumber, termNumber) ||
                other.termNumber == termNumber));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, title, termStartDate, termEndDate, termNumber);

  /// Create a copy of BoardPosition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardPositionImplCopyWith<_$BoardPositionImpl> get copyWith =>
      __$$BoardPositionImplCopyWithImpl<_$BoardPositionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardPositionImplToJson(
      this,
    );
  }
}

abstract class _BoardPosition implements BoardPosition {
  const factory _BoardPosition(
      {final int? id,
      final String? title,
      final DateTime? termStartDate,
      final DateTime? termEndDate,
      final int? termNumber}) = _$BoardPositionImpl;

  factory _BoardPosition.fromJson(Map<String, dynamic> json) =
      _$BoardPositionImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  DateTime? get termStartDate;
  @override
  DateTime? get termEndDate;
  @override
  int? get termNumber;

  /// Create a copy of BoardPosition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoardPositionImplCopyWith<_$BoardPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
