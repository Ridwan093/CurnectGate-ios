// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_methods_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentMethodsResponse _$PaymentMethodsResponseFromJson(
    Map<String, dynamic> json) {
  return _PaymentMethodsResponse.fromJson(json);
}

/// @nodoc
mixin _$PaymentMethodsResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  PaymentMethodsData? get data => throw _privateConstructorUsedError;

  /// Serializes this PaymentMethodsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentMethodsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentMethodsResponseCopyWith<PaymentMethodsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodsResponseCopyWith<$Res> {
  factory $PaymentMethodsResponseCopyWith(PaymentMethodsResponse value,
          $Res Function(PaymentMethodsResponse) then) =
      _$PaymentMethodsResponseCopyWithImpl<$Res, PaymentMethodsResponse>;
  @useResult
  $Res call(
      {bool? status, String? message, int? code, PaymentMethodsData? data});

  $PaymentMethodsDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$PaymentMethodsResponseCopyWithImpl<$Res,
        $Val extends PaymentMethodsResponse>
    implements $PaymentMethodsResponseCopyWith<$Res> {
  _$PaymentMethodsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentMethodsResponse
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
              as PaymentMethodsData?,
    ) as $Val);
  }

  /// Create a copy of PaymentMethodsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentMethodsDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $PaymentMethodsDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentMethodsResponseImplCopyWith<$Res>
    implements $PaymentMethodsResponseCopyWith<$Res> {
  factory _$$PaymentMethodsResponseImplCopyWith(
          _$PaymentMethodsResponseImpl value,
          $Res Function(_$PaymentMethodsResponseImpl) then) =
      __$$PaymentMethodsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status, String? message, int? code, PaymentMethodsData? data});

  @override
  $PaymentMethodsDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$PaymentMethodsResponseImplCopyWithImpl<$Res>
    extends _$PaymentMethodsResponseCopyWithImpl<$Res,
        _$PaymentMethodsResponseImpl>
    implements _$$PaymentMethodsResponseImplCopyWith<$Res> {
  __$$PaymentMethodsResponseImplCopyWithImpl(
      _$PaymentMethodsResponseImpl _value,
      $Res Function(_$PaymentMethodsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentMethodsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$PaymentMethodsResponseImpl(
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
              as PaymentMethodsData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PaymentMethodsResponseImpl implements _PaymentMethodsResponse {
  const _$PaymentMethodsResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$PaymentMethodsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentMethodsResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final PaymentMethodsData? data;

  @override
  String toString() {
    return 'PaymentMethodsResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodsResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of PaymentMethodsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodsResponseImplCopyWith<_$PaymentMethodsResponseImpl>
      get copyWith => __$$PaymentMethodsResponseImplCopyWithImpl<
          _$PaymentMethodsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentMethodsResponseImplToJson(
      this,
    );
  }
}

abstract class _PaymentMethodsResponse implements PaymentMethodsResponse {
  const factory _PaymentMethodsResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final PaymentMethodsData? data}) = _$PaymentMethodsResponseImpl;

  factory _PaymentMethodsResponse.fromJson(Map<String, dynamic> json) =
      _$PaymentMethodsResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  PaymentMethodsData? get data;

  /// Create a copy of PaymentMethodsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentMethodsResponseImplCopyWith<_$PaymentMethodsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
