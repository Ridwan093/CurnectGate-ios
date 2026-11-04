// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_history_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentHistoryResponse _$PaymentHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return _PaymentHistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$PaymentHistoryResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  PaymentHistoryData? get data => throw _privateConstructorUsedError;

  /// Serializes this PaymentHistoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentHistoryResponseCopyWith<PaymentHistoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentHistoryResponseCopyWith<$Res> {
  factory $PaymentHistoryResponseCopyWith(PaymentHistoryResponse value,
          $Res Function(PaymentHistoryResponse) then) =
      _$PaymentHistoryResponseCopyWithImpl<$Res, PaymentHistoryResponse>;
  @useResult
  $Res call(
      {bool? status, String? message, int? code, PaymentHistoryData? data});

  $PaymentHistoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$PaymentHistoryResponseCopyWithImpl<$Res,
        $Val extends PaymentHistoryResponse>
    implements $PaymentHistoryResponseCopyWith<$Res> {
  _$PaymentHistoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentHistoryResponse
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
              as PaymentHistoryData?,
    ) as $Val);
  }

  /// Create a copy of PaymentHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentHistoryDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $PaymentHistoryDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentHistoryResponseImplCopyWith<$Res>
    implements $PaymentHistoryResponseCopyWith<$Res> {
  factory _$$PaymentHistoryResponseImplCopyWith(
          _$PaymentHistoryResponseImpl value,
          $Res Function(_$PaymentHistoryResponseImpl) then) =
      __$$PaymentHistoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status, String? message, int? code, PaymentHistoryData? data});

  @override
  $PaymentHistoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$PaymentHistoryResponseImplCopyWithImpl<$Res>
    extends _$PaymentHistoryResponseCopyWithImpl<$Res,
        _$PaymentHistoryResponseImpl>
    implements _$$PaymentHistoryResponseImplCopyWith<$Res> {
  __$$PaymentHistoryResponseImplCopyWithImpl(
      _$PaymentHistoryResponseImpl _value,
      $Res Function(_$PaymentHistoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$PaymentHistoryResponseImpl(
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
              as PaymentHistoryData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PaymentHistoryResponseImpl implements _PaymentHistoryResponse {
  const _$PaymentHistoryResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$PaymentHistoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentHistoryResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final PaymentHistoryData? data;

  @override
  String toString() {
    return 'PaymentHistoryResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentHistoryResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of PaymentHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentHistoryResponseImplCopyWith<_$PaymentHistoryResponseImpl>
      get copyWith => __$$PaymentHistoryResponseImplCopyWithImpl<
          _$PaymentHistoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentHistoryResponseImplToJson(
      this,
    );
  }
}

abstract class _PaymentHistoryResponse implements PaymentHistoryResponse {
  const factory _PaymentHistoryResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final PaymentHistoryData? data}) = _$PaymentHistoryResponseImpl;

  factory _PaymentHistoryResponse.fromJson(Map<String, dynamic> json) =
      _$PaymentHistoryResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  PaymentHistoryData? get data;

  /// Create a copy of PaymentHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentHistoryResponseImplCopyWith<_$PaymentHistoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
