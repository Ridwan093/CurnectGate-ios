// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'violation_count_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ViolationCountResponse _$ViolationCountResponseFromJson(
    Map<String, dynamic> json) {
  return _ViolationCountResponse.fromJson(json);
}

/// @nodoc
mixin _$ViolationCountResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  ViolationCountData? get data => throw _privateConstructorUsedError;

  /// Serializes this ViolationCountResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ViolationCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViolationCountResponseCopyWith<ViolationCountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViolationCountResponseCopyWith<$Res> {
  factory $ViolationCountResponseCopyWith(ViolationCountResponse value,
          $Res Function(ViolationCountResponse) then) =
      _$ViolationCountResponseCopyWithImpl<$Res, ViolationCountResponse>;
  @useResult
  $Res call(
      {bool? status, String? message, int? code, ViolationCountData? data});

  $ViolationCountDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ViolationCountResponseCopyWithImpl<$Res,
        $Val extends ViolationCountResponse>
    implements $ViolationCountResponseCopyWith<$Res> {
  _$ViolationCountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViolationCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ViolationCountData?,
    ) as $Val);
  }

  /// Create a copy of ViolationCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ViolationCountDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ViolationCountDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViolationCountResponseImplCopyWith<$Res>
    implements $ViolationCountResponseCopyWith<$Res> {
  factory _$$ViolationCountResponseImplCopyWith(
          _$ViolationCountResponseImpl value,
          $Res Function(_$ViolationCountResponseImpl) then) =
      __$$ViolationCountResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status, String? message, int? code, ViolationCountData? data});

  @override
  $ViolationCountDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ViolationCountResponseImplCopyWithImpl<$Res>
    extends _$ViolationCountResponseCopyWithImpl<$Res,
        _$ViolationCountResponseImpl>
    implements _$$ViolationCountResponseImplCopyWith<$Res> {
  __$$ViolationCountResponseImplCopyWithImpl(
      _$ViolationCountResponseImpl _value,
      $Res Function(_$ViolationCountResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViolationCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ViolationCountResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ViolationCountData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViolationCountResponseImpl implements _ViolationCountResponse {
  const _$ViolationCountResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$ViolationCountResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViolationCountResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final ViolationCountData? data;

  @override
  String toString() {
    return 'ViolationCountResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViolationCountResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of ViolationCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViolationCountResponseImplCopyWith<_$ViolationCountResponseImpl>
      get copyWith => __$$ViolationCountResponseImplCopyWithImpl<
          _$ViolationCountResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViolationCountResponseImplToJson(
      this,
    );
  }
}

abstract class _ViolationCountResponse implements ViolationCountResponse {
  const factory _ViolationCountResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final ViolationCountData? data}) = _$ViolationCountResponseImpl;

  factory _ViolationCountResponse.fromJson(Map<String, dynamic> json) =
      _$ViolationCountResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  ViolationCountData? get data;

  /// Create a copy of ViolationCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViolationCountResponseImplCopyWith<_$ViolationCountResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
