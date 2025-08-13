// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OtpResponseModel _$OtpResponseModelFromJson(Map<String, dynamic> json) {
  return _OtpResponseModel.fromJson(json);
}

/// @nodoc
mixin _$OtpResponseModel {
  @JsonKey(name: 'status')
  bool get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'code')
  int get code => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  OtpData? get data => throw _privateConstructorUsedError;

  /// Serializes this OtpResponseModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OtpResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OtpResponseModelCopyWith<OtpResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OtpResponseModelCopyWith<$Res> {
  factory $OtpResponseModelCopyWith(
          OtpResponseModel value, $Res Function(OtpResponseModel) then) =
      _$OtpResponseModelCopyWithImpl<$Res, OtpResponseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'code') int code,
      @JsonKey(name: 'data') OtpData? data});

  $OtpDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$OtpResponseModelCopyWithImpl<$Res, $Val extends OtpResponseModel>
    implements $OtpResponseModelCopyWith<$Res> {
  _$OtpResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OtpResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? code = null,
    Object? data = freezed,
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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as OtpData?,
    ) as $Val);
  }

  /// Create a copy of OtpResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OtpDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $OtpDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OtpResponseModelImplCopyWith<$Res>
    implements $OtpResponseModelCopyWith<$Res> {
  factory _$$OtpResponseModelImplCopyWith(_$OtpResponseModelImpl value,
          $Res Function(_$OtpResponseModelImpl) then) =
      __$$OtpResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') bool status,
      @JsonKey(name: 'message') String message,
      @JsonKey(name: 'code') int code,
      @JsonKey(name: 'data') OtpData? data});

  @override
  $OtpDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$OtpResponseModelImplCopyWithImpl<$Res>
    extends _$OtpResponseModelCopyWithImpl<$Res, _$OtpResponseModelImpl>
    implements _$$OtpResponseModelImplCopyWith<$Res> {
  __$$OtpResponseModelImplCopyWithImpl(_$OtpResponseModelImpl _value,
      $Res Function(_$OtpResponseModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of OtpResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? code = null,
    Object? data = freezed,
  }) {
    return _then(_$OtpResponseModelImpl(
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
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as OtpData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OtpResponseModelImpl implements _OtpResponseModel {
  const _$OtpResponseModelImpl(
      {@JsonKey(name: 'status') this.status = false,
      @JsonKey(name: 'message') this.message = '',
      @JsonKey(name: 'code') this.code = 0,
      @JsonKey(name: 'data') this.data});

  factory _$OtpResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OtpResponseModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final bool status;
  @override
  @JsonKey(name: 'message')
  final String message;
  @override
  @JsonKey(name: 'code')
  final int code;
  @override
  @JsonKey(name: 'data')
  final OtpData? data;

  @override
  String toString() {
    return 'OtpResponseModel(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtpResponseModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of OtpResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OtpResponseModelImplCopyWith<_$OtpResponseModelImpl> get copyWith =>
      __$$OtpResponseModelImplCopyWithImpl<_$OtpResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OtpResponseModelImplToJson(
      this,
    );
  }
}

abstract class _OtpResponseModel implements OtpResponseModel {
  const factory _OtpResponseModel(
      {@JsonKey(name: 'status') final bool status,
      @JsonKey(name: 'message') final String message,
      @JsonKey(name: 'code') final int code,
      @JsonKey(name: 'data') final OtpData? data}) = _$OtpResponseModelImpl;

  factory _OtpResponseModel.fromJson(Map<String, dynamic> json) =
      _$OtpResponseModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  bool get status;
  @override
  @JsonKey(name: 'message')
  String get message;
  @override
  @JsonKey(name: 'code')
  int get code;
  @override
  @JsonKey(name: 'data')
  OtpData? get data;

  /// Create a copy of OtpResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OtpResponseModelImplCopyWith<_$OtpResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
