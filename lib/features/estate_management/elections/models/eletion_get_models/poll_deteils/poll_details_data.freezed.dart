// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_details_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PollDetailsData _$PollDetailsDataFromJson(Map<String, dynamic> json) {
  return _PollDetailsData.fromJson(json);
}

/// @nodoc
mixin _$PollDetailsData {
  PollItem? get poll => throw _privateConstructorUsedError;

  /// Serializes this PollDetailsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PollDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PollDetailsDataCopyWith<PollDetailsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollDetailsDataCopyWith<$Res> {
  factory $PollDetailsDataCopyWith(
          PollDetailsData value, $Res Function(PollDetailsData) then) =
      _$PollDetailsDataCopyWithImpl<$Res, PollDetailsData>;
  @useResult
  $Res call({PollItem? poll});

  $PollItemCopyWith<$Res>? get poll;
}

/// @nodoc
class _$PollDetailsDataCopyWithImpl<$Res, $Val extends PollDetailsData>
    implements $PollDetailsDataCopyWith<$Res> {
  _$PollDetailsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PollDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poll = freezed,
  }) {
    return _then(_value.copyWith(
      poll: freezed == poll
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as PollItem?,
    ) as $Val);
  }

  /// Create a copy of PollDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PollItemCopyWith<$Res>? get poll {
    if (_value.poll == null) {
      return null;
    }

    return $PollItemCopyWith<$Res>(_value.poll!, (value) {
      return _then(_value.copyWith(poll: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PollDetailsDataImplCopyWith<$Res>
    implements $PollDetailsDataCopyWith<$Res> {
  factory _$$PollDetailsDataImplCopyWith(_$PollDetailsDataImpl value,
          $Res Function(_$PollDetailsDataImpl) then) =
      __$$PollDetailsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PollItem? poll});

  @override
  $PollItemCopyWith<$Res>? get poll;
}

/// @nodoc
class __$$PollDetailsDataImplCopyWithImpl<$Res>
    extends _$PollDetailsDataCopyWithImpl<$Res, _$PollDetailsDataImpl>
    implements _$$PollDetailsDataImplCopyWith<$Res> {
  __$$PollDetailsDataImplCopyWithImpl(
      _$PollDetailsDataImpl _value, $Res Function(_$PollDetailsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PollDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? poll = freezed,
  }) {
    return _then(_$PollDetailsDataImpl(
      poll: freezed == poll
          ? _value.poll
          : poll // ignore: cast_nullable_to_non_nullable
              as PollItem?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PollDetailsDataImpl implements _PollDetailsData {
  const _$PollDetailsDataImpl({this.poll});

  factory _$PollDetailsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollDetailsDataImplFromJson(json);

  @override
  final PollItem? poll;

  @override
  String toString() {
    return 'PollDetailsData(poll: $poll)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollDetailsDataImpl &&
            (identical(other.poll, poll) || other.poll == poll));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, poll);

  /// Create a copy of PollDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PollDetailsDataImplCopyWith<_$PollDetailsDataImpl> get copyWith =>
      __$$PollDetailsDataImplCopyWithImpl<_$PollDetailsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollDetailsDataImplToJson(
      this,
    );
  }
}

abstract class _PollDetailsData implements PollDetailsData {
  const factory _PollDetailsData({final PollItem? poll}) =
      _$PollDetailsDataImpl;

  factory _PollDetailsData.fromJson(Map<String, dynamic> json) =
      _$PollDetailsDataImpl.fromJson;

  @override
  PollItem? get poll;

  /// Create a copy of PollDetailsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PollDetailsDataImplCopyWith<_$PollDetailsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
