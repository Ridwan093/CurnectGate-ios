// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'digital_member_id_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DigitalMemberIdResponse _$DigitalMemberIdResponseFromJson(
    Map<String, dynamic> json) {
  return _DigitalMemberIdResponse.fromJson(json);
}

/// @nodoc
mixin _$DigitalMemberIdResponse {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get code => throw _privateConstructorUsedError;
  DigitalMemberIdData get data => throw _privateConstructorUsedError;

  /// Serializes this DigitalMemberIdResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DigitalMemberIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DigitalMemberIdResponseCopyWith<DigitalMemberIdResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DigitalMemberIdResponseCopyWith<$Res> {
  factory $DigitalMemberIdResponseCopyWith(DigitalMemberIdResponse value,
          $Res Function(DigitalMemberIdResponse) then) =
      _$DigitalMemberIdResponseCopyWithImpl<$Res, DigitalMemberIdResponse>;
  @useResult
  $Res call({bool status, String message, int code, DigitalMemberIdData data});

  $DigitalMemberIdDataCopyWith<$Res> get data;
}

/// @nodoc
class _$DigitalMemberIdResponseCopyWithImpl<$Res,
        $Val extends DigitalMemberIdResponse>
    implements $DigitalMemberIdResponseCopyWith<$Res> {
  _$DigitalMemberIdResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DigitalMemberIdResponse
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
              as DigitalMemberIdData,
    ) as $Val);
  }

  /// Create a copy of DigitalMemberIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DigitalMemberIdDataCopyWith<$Res> get data {
    return $DigitalMemberIdDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DigitalMemberIdResponseImplCopyWith<$Res>
    implements $DigitalMemberIdResponseCopyWith<$Res> {
  factory _$$DigitalMemberIdResponseImplCopyWith(
          _$DigitalMemberIdResponseImpl value,
          $Res Function(_$DigitalMemberIdResponseImpl) then) =
      __$$DigitalMemberIdResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, String message, int code, DigitalMemberIdData data});

  @override
  $DigitalMemberIdDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$DigitalMemberIdResponseImplCopyWithImpl<$Res>
    extends _$DigitalMemberIdResponseCopyWithImpl<$Res,
        _$DigitalMemberIdResponseImpl>
    implements _$$DigitalMemberIdResponseImplCopyWith<$Res> {
  __$$DigitalMemberIdResponseImplCopyWithImpl(
      _$DigitalMemberIdResponseImpl _value,
      $Res Function(_$DigitalMemberIdResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of DigitalMemberIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? code = null,
    Object? data = null,
  }) {
    return _then(_$DigitalMemberIdResponseImpl(
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
              as DigitalMemberIdData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DigitalMemberIdResponseImpl implements _DigitalMemberIdResponse {
  const _$DigitalMemberIdResponseImpl(
      {required this.status,
      required this.message,
      required this.code,
      required this.data});

  factory _$DigitalMemberIdResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DigitalMemberIdResponseImplFromJson(json);

  @override
  final bool status;
  @override
  final String message;
  @override
  final int code;
  @override
  final DigitalMemberIdData data;

  @override
  String toString() {
    return 'DigitalMemberIdResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DigitalMemberIdResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of DigitalMemberIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DigitalMemberIdResponseImplCopyWith<_$DigitalMemberIdResponseImpl>
      get copyWith => __$$DigitalMemberIdResponseImplCopyWithImpl<
          _$DigitalMemberIdResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DigitalMemberIdResponseImplToJson(
      this,
    );
  }
}

abstract class _DigitalMemberIdResponse implements DigitalMemberIdResponse {
  const factory _DigitalMemberIdResponse(
      {required final bool status,
      required final String message,
      required final int code,
      required final DigitalMemberIdData data}) = _$DigitalMemberIdResponseImpl;

  factory _DigitalMemberIdResponse.fromJson(Map<String, dynamic> json) =
      _$DigitalMemberIdResponseImpl.fromJson;

  @override
  bool get status;
  @override
  String get message;
  @override
  int get code;
  @override
  DigitalMemberIdData get data;

  /// Create a copy of DigitalMemberIdResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DigitalMemberIdResponseImplCopyWith<_$DigitalMemberIdResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
