// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'violation_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ViolationResponse _$ViolationResponseFromJson(Map<String, dynamic> json) {
  return _ViolationResponse.fromJson(json);
}

/// @nodoc
mixin _$ViolationResponse {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  ViolationData get data => throw _privateConstructorUsedError;

  /// Serializes this ViolationResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ViolationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViolationResponseCopyWith<ViolationResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViolationResponseCopyWith<$Res> {
  factory $ViolationResponseCopyWith(
          ViolationResponse value, $Res Function(ViolationResponse) then) =
      _$ViolationResponseCopyWithImpl<$Res, ViolationResponse>;
  @useResult
  $Res call({bool status, String message, int code, ViolationData data});

  $ViolationDataCopyWith<$Res> get data;
}

/// @nodoc
class _$ViolationResponseCopyWithImpl<$Res, $Val extends ViolationResponse>
    implements $ViolationResponseCopyWith<$Res> {
  _$ViolationResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViolationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? code = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ViolationData,
    ) as $Val);
  }

  /// Create a copy of ViolationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ViolationDataCopyWith<$Res> get data {
    return $ViolationDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViolationResponseImplCopyWith<$Res>
    implements $ViolationResponseCopyWith<$Res> {
  factory _$$ViolationResponseImplCopyWith(_$ViolationResponseImpl value,
          $Res Function(_$ViolationResponseImpl) then) =
      __$$ViolationResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, String message, int code, ViolationData data});

  @override
  $ViolationDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$ViolationResponseImplCopyWithImpl<$Res>
    extends _$ViolationResponseCopyWithImpl<$Res, _$ViolationResponseImpl>
    implements _$$ViolationResponseImplCopyWith<$Res> {
  __$$ViolationResponseImplCopyWithImpl(_$ViolationResponseImpl _value,
      $Res Function(_$ViolationResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViolationResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? code = null,
    Object? data = null,
  }) {
    return _then(_$ViolationResponseImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as ViolationData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ViolationResponseImpl implements _ViolationResponse {
  const _$ViolationResponseImpl(
      {required this.status,
      required this.message,
      required this.code,
      required this.data});

  factory _$ViolationResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViolationResponseImplFromJson(json);

  @override
  final bool status;
  @override
  final String message;
  @override
  final int code;
  @override
  final ViolationData data;

  @override
  String toString() {
    return 'ViolationResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViolationResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of ViolationResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViolationResponseImplCopyWith<_$ViolationResponseImpl> get copyWith =>
      __$$ViolationResponseImplCopyWithImpl<_$ViolationResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViolationResponseImplToJson(
      this,
    );
  }
}

abstract class _ViolationResponse implements ViolationResponse {
  const factory _ViolationResponse(
      {required final bool status,
      required final String message,
      required final int code,
      required final ViolationData data}) = _$ViolationResponseImpl;

  factory _ViolationResponse.fromJson(Map<String, dynamic> json) =
      _$ViolationResponseImpl.fromJson;

  @override
  bool get status;
  @override
  String get message;
  @override
  int get code;
  @override
  ViolationData get data;

  /// Create a copy of ViolationResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViolationResponseImplCopyWith<_$ViolationResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
