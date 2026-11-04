// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_count_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActiveCountData _$ActiveCountDataFromJson(Map<String, dynamic> json) {
  return _ActiveCountData.fromJson(json);
}

/// @nodoc
mixin _$ActiveCountData {
  int? get count => throw _privateConstructorUsedError;
  String? get timestamp => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;

  /// Serializes this ActiveCountData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActiveCountData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActiveCountDataCopyWith<ActiveCountData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveCountDataCopyWith<$Res> {
  factory $ActiveCountDataCopyWith(
          ActiveCountData value, $Res Function(ActiveCountData) then) =
      _$ActiveCountDataCopyWithImpl<$Res, ActiveCountData>;
  @useResult
  $Res call({int? count, String? timestamp, int? userId});
}

/// @nodoc
class _$ActiveCountDataCopyWithImpl<$Res, $Val extends ActiveCountData>
    implements $ActiveCountDataCopyWith<$Res> {
  _$ActiveCountDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActiveCountData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? timestamp = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActiveCountDataImplCopyWith<$Res>
    implements $ActiveCountDataCopyWith<$Res> {
  factory _$$ActiveCountDataImplCopyWith(_$ActiveCountDataImpl value,
          $Res Function(_$ActiveCountDataImpl) then) =
      __$$ActiveCountDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? count, String? timestamp, int? userId});
}

/// @nodoc
class __$$ActiveCountDataImplCopyWithImpl<$Res>
    extends _$ActiveCountDataCopyWithImpl<$Res, _$ActiveCountDataImpl>
    implements _$$ActiveCountDataImplCopyWith<$Res> {
  __$$ActiveCountDataImplCopyWithImpl(
      _$ActiveCountDataImpl _value, $Res Function(_$ActiveCountDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActiveCountData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? count = freezed,
    Object? timestamp = freezed,
    Object? userId = freezed,
  }) {
    return _then(_$ActiveCountDataImpl(
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
      timestamp: freezed == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActiveCountDataImpl implements _ActiveCountData {
  const _$ActiveCountDataImpl({this.count, this.timestamp, this.userId});

  factory _$ActiveCountDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActiveCountDataImplFromJson(json);

  @override
  final int? count;
  @override
  final String? timestamp;
  @override
  final int? userId;

  @override
  String toString() {
    return 'ActiveCountData(count: $count, timestamp: $timestamp, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveCountDataImpl &&
            (identical(other.count, count) || other.count == count) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, count, timestamp, userId);

  /// Create a copy of ActiveCountData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveCountDataImplCopyWith<_$ActiveCountDataImpl> get copyWith =>
      __$$ActiveCountDataImplCopyWithImpl<_$ActiveCountDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActiveCountDataImplToJson(
      this,
    );
  }
}

abstract class _ActiveCountData implements ActiveCountData {
  const factory _ActiveCountData(
      {final int? count,
      final String? timestamp,
      final int? userId}) = _$ActiveCountDataImpl;

  factory _ActiveCountData.fromJson(Map<String, dynamic> json) =
      _$ActiveCountDataImpl.fromJson;

  @override
  int? get count;
  @override
  String? get timestamp;
  @override
  int? get userId;

  /// Create a copy of ActiveCountData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActiveCountDataImplCopyWith<_$ActiveCountDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
