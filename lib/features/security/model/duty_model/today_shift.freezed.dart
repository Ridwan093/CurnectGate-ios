// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_shift.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodayShift _$TodayShiftFromJson(Map<String, dynamic> json) {
  return _TodayShift.fromJson(json);
}

/// @nodoc
mixin _$TodayShift {
  int? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get startTime => throw _privateConstructorUsedError;
  String? get endTime => throw _privateConstructorUsedError;
  bool? get isOvernight => throw _privateConstructorUsedError;
  int? get onDutyCount => throw _privateConstructorUsedError;

  /// Serializes this TodayShift to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodayShift
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodayShiftCopyWith<TodayShift> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodayShiftCopyWith<$Res> {
  factory $TodayShiftCopyWith(
          TodayShift value, $Res Function(TodayShift) then) =
      _$TodayShiftCopyWithImpl<$Res, TodayShift>;
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? startTime,
      String? endTime,
      bool? isOvernight,
      int? onDutyCount});
}

/// @nodoc
class _$TodayShiftCopyWithImpl<$Res, $Val extends TodayShift>
    implements $TodayShiftCopyWith<$Res> {
  _$TodayShiftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodayShift
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? isOvernight = freezed,
    Object? onDutyCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isOvernight: freezed == isOvernight
          ? _value.isOvernight
          : isOvernight // ignore: cast_nullable_to_non_nullable
              as bool?,
      onDutyCount: freezed == onDutyCount
          ? _value.onDutyCount
          : onDutyCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodayShiftImplCopyWith<$Res>
    implements $TodayShiftCopyWith<$Res> {
  factory _$$TodayShiftImplCopyWith(
          _$TodayShiftImpl value, $Res Function(_$TodayShiftImpl) then) =
      __$$TodayShiftImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? name,
      String? startTime,
      String? endTime,
      bool? isOvernight,
      int? onDutyCount});
}

/// @nodoc
class __$$TodayShiftImplCopyWithImpl<$Res>
    extends _$TodayShiftCopyWithImpl<$Res, _$TodayShiftImpl>
    implements _$$TodayShiftImplCopyWith<$Res> {
  __$$TodayShiftImplCopyWithImpl(
      _$TodayShiftImpl _value, $Res Function(_$TodayShiftImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodayShift
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? isOvernight = freezed,
    Object? onDutyCount = freezed,
  }) {
    return _then(_$TodayShiftImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String?,
      isOvernight: freezed == isOvernight
          ? _value.isOvernight
          : isOvernight // ignore: cast_nullable_to_non_nullable
              as bool?,
      onDutyCount: freezed == onDutyCount
          ? _value.onDutyCount
          : onDutyCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$TodayShiftImpl implements _TodayShift {
  const _$TodayShiftImpl(
      {this.id,
      this.name,
      this.startTime,
      this.endTime,
      this.isOvernight,
      this.onDutyCount});

  factory _$TodayShiftImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodayShiftImplFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? startTime;
  @override
  final String? endTime;
  @override
  final bool? isOvernight;
  @override
  final int? onDutyCount;

  @override
  String toString() {
    return 'TodayShift(id: $id, name: $name, startTime: $startTime, endTime: $endTime, isOvernight: $isOvernight, onDutyCount: $onDutyCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodayShiftImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.isOvernight, isOvernight) ||
                other.isOvernight == isOvernight) &&
            (identical(other.onDutyCount, onDutyCount) ||
                other.onDutyCount == onDutyCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, startTime, endTime, isOvernight, onDutyCount);

  /// Create a copy of TodayShift
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodayShiftImplCopyWith<_$TodayShiftImpl> get copyWith =>
      __$$TodayShiftImplCopyWithImpl<_$TodayShiftImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodayShiftImplToJson(
      this,
    );
  }
}

abstract class _TodayShift implements TodayShift {
  const factory _TodayShift(
      {final int? id,
      final String? name,
      final String? startTime,
      final String? endTime,
      final bool? isOvernight,
      final int? onDutyCount}) = _$TodayShiftImpl;

  factory _TodayShift.fromJson(Map<String, dynamic> json) =
      _$TodayShiftImpl.fromJson;

  @override
  int? get id;
  @override
  String? get name;
  @override
  String? get startTime;
  @override
  String? get endTime;
  @override
  bool? get isOvernight;
  @override
  int? get onDutyCount;

  /// Create a copy of TodayShift
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodayShiftImplCopyWith<_$TodayShiftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
