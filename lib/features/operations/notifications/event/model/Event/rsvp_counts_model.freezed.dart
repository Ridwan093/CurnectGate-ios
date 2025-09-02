// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rsvp_counts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RsvpCounts _$RsvpCountsFromJson(Map<String, dynamic> json) {
  return _RsvpCounts.fromJson(json);
}

/// @nodoc
mixin _$RsvpCounts {
  int get going => throw _privateConstructorUsedError;
  int get notGoing => throw _privateConstructorUsedError;
  int get maybe => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this RsvpCounts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RsvpCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RsvpCountsCopyWith<RsvpCounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RsvpCountsCopyWith<$Res> {
  factory $RsvpCountsCopyWith(
          RsvpCounts value, $Res Function(RsvpCounts) then) =
      _$RsvpCountsCopyWithImpl<$Res, RsvpCounts>;
  @useResult
  $Res call({int going, int notGoing, int maybe, int total});
}

/// @nodoc
class _$RsvpCountsCopyWithImpl<$Res, $Val extends RsvpCounts>
    implements $RsvpCountsCopyWith<$Res> {
  _$RsvpCountsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RsvpCounts
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
abstract class _$$RsvpCountsImplCopyWith<$Res>
    implements $RsvpCountsCopyWith<$Res> {
  factory _$$RsvpCountsImplCopyWith(
          _$RsvpCountsImpl value, $Res Function(_$RsvpCountsImpl) then) =
      __$$RsvpCountsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int going, int notGoing, int maybe, int total});
}

/// @nodoc
class __$$RsvpCountsImplCopyWithImpl<$Res>
    extends _$RsvpCountsCopyWithImpl<$Res, _$RsvpCountsImpl>
    implements _$$RsvpCountsImplCopyWith<$Res> {
  __$$RsvpCountsImplCopyWithImpl(
      _$RsvpCountsImpl _value, $Res Function(_$RsvpCountsImpl) _then)
      : super(_value, _then);

  /// Create a copy of RsvpCounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? going = null,
    Object? notGoing = null,
    Object? maybe = null,
    Object? total = null,
  }) {
    return _then(_$RsvpCountsImpl(
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
class _$RsvpCountsImpl implements _RsvpCounts {
  const _$RsvpCountsImpl(
      {this.going = 0, this.notGoing = 0, this.maybe = 0, this.total = 0});

  factory _$RsvpCountsImpl.fromJson(Map<String, dynamic> json) =>
      _$$RsvpCountsImplFromJson(json);

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
    return 'RsvpCounts(going: $going, notGoing: $notGoing, maybe: $maybe, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RsvpCountsImpl &&
            (identical(other.going, going) || other.going == going) &&
            (identical(other.notGoing, notGoing) ||
                other.notGoing == notGoing) &&
            (identical(other.maybe, maybe) || other.maybe == maybe) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, going, notGoing, maybe, total);

  /// Create a copy of RsvpCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RsvpCountsImplCopyWith<_$RsvpCountsImpl> get copyWith =>
      __$$RsvpCountsImplCopyWithImpl<_$RsvpCountsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RsvpCountsImplToJson(
      this,
    );
  }
}

abstract class _RsvpCounts implements RsvpCounts {
  const factory _RsvpCounts(
      {final int going,
      final int notGoing,
      final int maybe,
      final int total}) = _$RsvpCountsImpl;

  factory _RsvpCounts.fromJson(Map<String, dynamic> json) =
      _$RsvpCountsImpl.fromJson;

  @override
  int get going;
  @override
  int get notGoing;
  @override
  int get maybe;
  @override
  int get total;

  /// Create a copy of RsvpCounts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RsvpCountsImplCopyWith<_$RsvpCountsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
