// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_rsvp_counts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalendarRsvpCounts _$CalendarRsvpCountsFromJson(Map<String, dynamic> json) {
  return _CalendarRsvpCounts.fromJson(json);
}

/// @nodoc
mixin _$CalendarRsvpCounts {
  int get going => throw _privateConstructorUsedError;
  int get notGoing => throw _privateConstructorUsedError;
  int get maybe => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this CalendarRsvpCounts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalendarRsvpCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalendarRsvpCountsCopyWith<CalendarRsvpCounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarRsvpCountsCopyWith<$Res> {
  factory $CalendarRsvpCountsCopyWith(
          CalendarRsvpCounts value, $Res Function(CalendarRsvpCounts) then) =
      _$CalendarRsvpCountsCopyWithImpl<$Res, CalendarRsvpCounts>;
  @useResult
  $Res call({int going, int notGoing, int maybe, int total});
}

/// @nodoc
class _$CalendarRsvpCountsCopyWithImpl<$Res, $Val extends CalendarRsvpCounts>
    implements $CalendarRsvpCountsCopyWith<$Res> {
  _$CalendarRsvpCountsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalendarRsvpCounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? going = null,
    Object? notGoing = null,
    Object? maybe = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      going: null == going
          ? _value.going
          : going // ignore: cast_nullable_to_non_nullable
              as int,
      notGoing: null == notGoing
          ? _value.notGoing
          : notGoing // ignore: cast_nullable_to_non_nullable
              as int,
      maybe: null == maybe
          ? _value.maybe
          : maybe // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarRsvpCountsImplCopyWith<$Res>
    implements $CalendarRsvpCountsCopyWith<$Res> {
  factory _$$CalendarRsvpCountsImplCopyWith(_$CalendarRsvpCountsImpl value,
          $Res Function(_$CalendarRsvpCountsImpl) then) =
      __$$CalendarRsvpCountsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int going, int notGoing, int maybe, int total});
}

/// @nodoc
class __$$CalendarRsvpCountsImplCopyWithImpl<$Res>
    extends _$CalendarRsvpCountsCopyWithImpl<$Res, _$CalendarRsvpCountsImpl>
    implements _$$CalendarRsvpCountsImplCopyWith<$Res> {
  __$$CalendarRsvpCountsImplCopyWithImpl(_$CalendarRsvpCountsImpl _value,
      $Res Function(_$CalendarRsvpCountsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarRsvpCounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? going = null,
    Object? notGoing = null,
    Object? maybe = null,
    Object? total = null,
  }) {
    return _then(_$CalendarRsvpCountsImpl(
      going: null == going
          ? _value.going
          : going // ignore: cast_nullable_to_non_nullable
              as int,
      notGoing: null == notGoing
          ? _value.notGoing
          : notGoing // ignore: cast_nullable_to_non_nullable
              as int,
      maybe: null == maybe
          ? _value.maybe
          : maybe // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CalendarRsvpCountsImpl implements _CalendarRsvpCounts {
  const _$CalendarRsvpCountsImpl(
      {this.going = 0, this.notGoing = 0, this.maybe = 0, this.total = 0});

  factory _$CalendarRsvpCountsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalendarRsvpCountsImplFromJson(json);

  @override
  @JsonKey()
  final int going;
  @override
  @JsonKey()
  final int notGoing;
  @override
  @JsonKey()
  final int maybe;
  @override
  @JsonKey()
  final int total;

  @override
  String toString() {
    return 'CalendarRsvpCounts(going: $going, notGoing: $notGoing, maybe: $maybe, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarRsvpCountsImpl &&
            (identical(other.going, going) || other.going == going) &&
            (identical(other.notGoing, notGoing) ||
                other.notGoing == notGoing) &&
            (identical(other.maybe, maybe) || other.maybe == maybe) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, going, notGoing, maybe, total);

  /// Create a copy of CalendarRsvpCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarRsvpCountsImplCopyWith<_$CalendarRsvpCountsImpl> get copyWith =>
      __$$CalendarRsvpCountsImplCopyWithImpl<_$CalendarRsvpCountsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalendarRsvpCountsImplToJson(
      this,
    );
  }
}

abstract class _CalendarRsvpCounts implements CalendarRsvpCounts {
  const factory _CalendarRsvpCounts(
      {final int going,
      final int notGoing,
      final int maybe,
      final int total}) = _$CalendarRsvpCountsImpl;

  factory _CalendarRsvpCounts.fromJson(Map<String, dynamic> json) =
      _$CalendarRsvpCountsImpl.fromJson;

  @override
  int get going;
  @override
  int get notGoing;
  @override
  int get maybe;
  @override
  int get total;

  /// Create a copy of CalendarRsvpCounts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalendarRsvpCountsImplCopyWith<_$CalendarRsvpCountsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
