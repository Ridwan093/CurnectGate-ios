// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'curfew_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurfewResponse _$CurfewResponseFromJson(Map<String, dynamic> json) {
  return _CurfewResponse.fromJson(json);
}

/// @nodoc
mixin _$CurfewResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  CurfewData? get data => throw _privateConstructorUsedError;

  /// Serializes this CurfewResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurfewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurfewResponseCopyWith<CurfewResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurfewResponseCopyWith<$Res> {
  factory $CurfewResponseCopyWith(
          CurfewResponse value, $Res Function(CurfewResponse) then) =
      _$CurfewResponseCopyWithImpl<$Res, CurfewResponse>;
  @useResult
  $Res call({bool? status, String? message, int? code, CurfewData? data});

  $CurfewDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$CurfewResponseCopyWithImpl<$Res, $Val extends CurfewResponse>
    implements $CurfewResponseCopyWith<$Res> {
  _$CurfewResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurfewResponse
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
              as CurfewData?,
    ) as $Val);
  }

  /// Create a copy of CurfewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurfewDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CurfewDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurfewResponseImplCopyWith<$Res>
    implements $CurfewResponseCopyWith<$Res> {
  factory _$$CurfewResponseImplCopyWith(_$CurfewResponseImpl value,
          $Res Function(_$CurfewResponseImpl) then) =
      __$$CurfewResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, CurfewData? data});

  @override
  $CurfewDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$CurfewResponseImplCopyWithImpl<$Res>
    extends _$CurfewResponseCopyWithImpl<$Res, _$CurfewResponseImpl>
    implements _$$CurfewResponseImplCopyWith<$Res> {
  __$$CurfewResponseImplCopyWithImpl(
      _$CurfewResponseImpl _value, $Res Function(_$CurfewResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurfewResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$CurfewResponseImpl(
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
              as CurfewData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CurfewResponseImpl implements _CurfewResponse {
  const _$CurfewResponseImpl({this.status, this.message, this.code, this.data});

  factory _$CurfewResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurfewResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final CurfewData? data;

  @override
  String toString() {
    return 'CurfewResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurfewResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of CurfewResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurfewResponseImplCopyWith<_$CurfewResponseImpl> get copyWith =>
      __$$CurfewResponseImplCopyWithImpl<_$CurfewResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurfewResponseImplToJson(
      this,
    );
  }
}

abstract class _CurfewResponse implements CurfewResponse {
  const factory _CurfewResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final CurfewData? data}) = _$CurfewResponseImpl;

  factory _CurfewResponse.fromJson(Map<String, dynamic> json) =
      _$CurfewResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  CurfewData? get data;

  /// Create a copy of CurfewResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurfewResponseImplCopyWith<_$CurfewResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
