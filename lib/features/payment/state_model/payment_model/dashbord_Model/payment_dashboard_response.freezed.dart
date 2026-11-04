// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_dashboard_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentDashboardResponse _$PaymentDashboardResponseFromJson(
    Map<String, dynamic> json) {
  return _PaymentDashboardResponse.fromJson(json);
}

/// @nodoc
mixin _$PaymentDashboardResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  PaymentDashboardData? get data => throw _privateConstructorUsedError;

  /// Serializes this PaymentDashboardResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentDashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentDashboardResponseCopyWith<PaymentDashboardResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDashboardResponseCopyWith<$Res> {
  factory $PaymentDashboardResponseCopyWith(PaymentDashboardResponse value,
          $Res Function(PaymentDashboardResponse) then) =
      _$PaymentDashboardResponseCopyWithImpl<$Res, PaymentDashboardResponse>;
  @useResult
  $Res call(
      {bool? status, String? message, int? code, PaymentDashboardData? data});

  $PaymentDashboardDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$PaymentDashboardResponseCopyWithImpl<$Res,
        $Val extends PaymentDashboardResponse>
    implements $PaymentDashboardResponseCopyWith<$Res> {
  _$PaymentDashboardResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentDashboardResponse
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
              as PaymentDashboardData?,
    ) as $Val);
  }

  /// Create a copy of PaymentDashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaymentDashboardDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $PaymentDashboardDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentDashboardResponseImplCopyWith<$Res>
    implements $PaymentDashboardResponseCopyWith<$Res> {
  factory _$$PaymentDashboardResponseImplCopyWith(
          _$PaymentDashboardResponseImpl value,
          $Res Function(_$PaymentDashboardResponseImpl) then) =
      __$$PaymentDashboardResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status, String? message, int? code, PaymentDashboardData? data});

  @override
  $PaymentDashboardDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$PaymentDashboardResponseImplCopyWithImpl<$Res>
    extends _$PaymentDashboardResponseCopyWithImpl<$Res,
        _$PaymentDashboardResponseImpl>
    implements _$$PaymentDashboardResponseImplCopyWith<$Res> {
  __$$PaymentDashboardResponseImplCopyWithImpl(
      _$PaymentDashboardResponseImpl _value,
      $Res Function(_$PaymentDashboardResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentDashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$PaymentDashboardResponseImpl(
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
              as PaymentDashboardData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PaymentDashboardResponseImpl implements _PaymentDashboardResponse {
  const _$PaymentDashboardResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$PaymentDashboardResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentDashboardResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final PaymentDashboardData? data;

  @override
  String toString() {
    return 'PaymentDashboardResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentDashboardResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of PaymentDashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentDashboardResponseImplCopyWith<_$PaymentDashboardResponseImpl>
      get copyWith => __$$PaymentDashboardResponseImplCopyWithImpl<
          _$PaymentDashboardResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentDashboardResponseImplToJson(
      this,
    );
  }
}

abstract class _PaymentDashboardResponse implements PaymentDashboardResponse {
  const factory _PaymentDashboardResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final PaymentDashboardData? data}) = _$PaymentDashboardResponseImpl;

  factory _PaymentDashboardResponse.fromJson(Map<String, dynamic> json) =
      _$PaymentDashboardResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  PaymentDashboardData? get data;

  /// Create a copy of PaymentDashboardResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentDashboardResponseImplCopyWith<_$PaymentDashboardResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
