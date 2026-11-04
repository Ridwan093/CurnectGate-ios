// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_otp_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActiveOtpData _$ActiveOtpDataFromJson(Map<String, dynamic> json) {
  return _ActiveOtpData.fromJson(json);
}

/// @nodoc
mixin _$ActiveOtpData {
  List<ActiveOtpItem>? get otps => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  /// Serializes this ActiveOtpData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActiveOtpData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActiveOtpDataCopyWith<ActiveOtpData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveOtpDataCopyWith<$Res> {
  factory $ActiveOtpDataCopyWith(
          ActiveOtpData value, $Res Function(ActiveOtpData) then) =
      _$ActiveOtpDataCopyWithImpl<$Res, ActiveOtpData>;
  @useResult
  $Res call({List<ActiveOtpItem>? otps, int? count});
}

/// @nodoc
class _$ActiveOtpDataCopyWithImpl<$Res, $Val extends ActiveOtpData>
    implements $ActiveOtpDataCopyWith<$Res> {
  _$ActiveOtpDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActiveOtpData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otps = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      otps: freezed == otps
          ? _value.otps
          : otps // ignore: cast_nullable_to_non_nullable
              as List<ActiveOtpItem>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActiveOtpDataImplCopyWith<$Res>
    implements $ActiveOtpDataCopyWith<$Res> {
  factory _$$ActiveOtpDataImplCopyWith(
          _$ActiveOtpDataImpl value, $Res Function(_$ActiveOtpDataImpl) then) =
      __$$ActiveOtpDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ActiveOtpItem>? otps, int? count});
}

/// @nodoc
class __$$ActiveOtpDataImplCopyWithImpl<$Res>
    extends _$ActiveOtpDataCopyWithImpl<$Res, _$ActiveOtpDataImpl>
    implements _$$ActiveOtpDataImplCopyWith<$Res> {
  __$$ActiveOtpDataImplCopyWithImpl(
      _$ActiveOtpDataImpl _value, $Res Function(_$ActiveOtpDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActiveOtpData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otps = freezed,
    Object? count = freezed,
  }) {
    return _then(_$ActiveOtpDataImpl(
      otps: freezed == otps
          ? _value._otps
          : otps // ignore: cast_nullable_to_non_nullable
              as List<ActiveOtpItem>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ActiveOtpDataImpl implements _ActiveOtpData {
  const _$ActiveOtpDataImpl({final List<ActiveOtpItem>? otps, this.count})
      : _otps = otps;

  factory _$ActiveOtpDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActiveOtpDataImplFromJson(json);

  final List<ActiveOtpItem>? _otps;
  @override
  List<ActiveOtpItem>? get otps {
    final value = _otps;
    if (value == null) return null;
    if (_otps is EqualUnmodifiableListView) return _otps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? count;

  @override
  String toString() {
    return 'ActiveOtpData(otps: $otps, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveOtpDataImpl &&
            const DeepCollectionEquality().equals(other._otps, _otps) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_otps), count);

  /// Create a copy of ActiveOtpData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveOtpDataImplCopyWith<_$ActiveOtpDataImpl> get copyWith =>
      __$$ActiveOtpDataImplCopyWithImpl<_$ActiveOtpDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActiveOtpDataImplToJson(
      this,
    );
  }
}

abstract class _ActiveOtpData implements ActiveOtpData {
  const factory _ActiveOtpData(
      {final List<ActiveOtpItem>? otps,
      final int? count}) = _$ActiveOtpDataImpl;

  factory _ActiveOtpData.fromJson(Map<String, dynamic> json) =
      _$ActiveOtpDataImpl.fromJson;

  @override
  List<ActiveOtpItem>? get otps;
  @override
  int? get count;

  /// Create a copy of ActiveOtpData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActiveOtpDataImplCopyWith<_$ActiveOtpDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
