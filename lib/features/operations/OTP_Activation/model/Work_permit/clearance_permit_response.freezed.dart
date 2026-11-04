// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'clearance_permit_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClearancePermitResponse _$ClearancePermitResponseFromJson(
    Map<String, dynamic> json) {
  return _ClearancePermitResponse.fromJson(json);
}

/// @nodoc
mixin _$ClearancePermitResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  ClearancePermitData? get data => throw _privateConstructorUsedError;

  /// Serializes this ClearancePermitResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClearancePermitResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClearancePermitResponseCopyWith<ClearancePermitResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClearancePermitResponseCopyWith<$Res> {
  factory $ClearancePermitResponseCopyWith(ClearancePermitResponse value,
          $Res Function(ClearancePermitResponse) then) =
      _$ClearancePermitResponseCopyWithImpl<$Res, ClearancePermitResponse>;
  @useResult
  $Res call(
      {bool? status, String? message, int? code, ClearancePermitData? data});

  $ClearancePermitDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ClearancePermitResponseCopyWithImpl<$Res,
        $Val extends ClearancePermitResponse>
    implements $ClearancePermitResponseCopyWith<$Res> {
  _$ClearancePermitResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClearancePermitResponse
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
              as ClearancePermitData?,
    ) as $Val);
  }

  /// Create a copy of ClearancePermitResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ClearancePermitDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ClearancePermitDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ClearancePermitResponseImplCopyWith<$Res>
    implements $ClearancePermitResponseCopyWith<$Res> {
  factory _$$ClearancePermitResponseImplCopyWith(
          _$ClearancePermitResponseImpl value,
          $Res Function(_$ClearancePermitResponseImpl) then) =
      __$$ClearancePermitResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status, String? message, int? code, ClearancePermitData? data});

  @override
  $ClearancePermitDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ClearancePermitResponseImplCopyWithImpl<$Res>
    extends _$ClearancePermitResponseCopyWithImpl<$Res,
        _$ClearancePermitResponseImpl>
    implements _$$ClearancePermitResponseImplCopyWith<$Res> {
  __$$ClearancePermitResponseImplCopyWithImpl(
      _$ClearancePermitResponseImpl _value,
      $Res Function(_$ClearancePermitResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClearancePermitResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ClearancePermitResponseImpl(
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
              as ClearancePermitData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ClearancePermitResponseImpl implements _ClearancePermitResponse {
  const _$ClearancePermitResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$ClearancePermitResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClearancePermitResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final ClearancePermitData? data;

  @override
  String toString() {
    return 'ClearancePermitResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClearancePermitResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of ClearancePermitResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClearancePermitResponseImplCopyWith<_$ClearancePermitResponseImpl>
      get copyWith => __$$ClearancePermitResponseImplCopyWithImpl<
          _$ClearancePermitResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClearancePermitResponseImplToJson(
      this,
    );
  }
}

abstract class _ClearancePermitResponse implements ClearancePermitResponse {
  const factory _ClearancePermitResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final ClearancePermitData? data}) = _$ClearancePermitResponseImpl;

  factory _ClearancePermitResponse.fromJson(Map<String, dynamic> json) =
      _$ClearancePermitResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  ClearancePermitData? get data;

  /// Create a copy of ClearancePermitResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClearancePermitResponseImplCopyWith<_$ClearancePermitResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
