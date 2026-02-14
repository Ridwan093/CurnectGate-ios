// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estate_address_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EstateAddressResponse _$EstateAddressResponseFromJson(
    Map<String, dynamic> json) {
  return _EstateAddressResponse.fromJson(json);
}

/// @nodoc
mixin _$EstateAddressResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  AddressData? get data => throw _privateConstructorUsedError;

  /// Serializes this EstateAddressResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EstateAddressResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EstateAddressResponseCopyWith<EstateAddressResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstateAddressResponseCopyWith<$Res> {
  factory $EstateAddressResponseCopyWith(EstateAddressResponse value,
          $Res Function(EstateAddressResponse) then) =
      _$EstateAddressResponseCopyWithImpl<$Res, EstateAddressResponse>;
  @useResult
  $Res call({bool? status, String? message, int? code, AddressData? data});

  $AddressDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$EstateAddressResponseCopyWithImpl<$Res,
        $Val extends EstateAddressResponse>
    implements $EstateAddressResponseCopyWith<$Res> {
  _$EstateAddressResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EstateAddressResponse
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
              as AddressData?,
    ) as $Val);
  }

  /// Create a copy of EstateAddressResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AddressDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $AddressDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EstateAddressResponseImplCopyWith<$Res>
    implements $EstateAddressResponseCopyWith<$Res> {
  factory _$$EstateAddressResponseImplCopyWith(
          _$EstateAddressResponseImpl value,
          $Res Function(_$EstateAddressResponseImpl) then) =
      __$$EstateAddressResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, AddressData? data});

  @override
  $AddressDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$EstateAddressResponseImplCopyWithImpl<$Res>
    extends _$EstateAddressResponseCopyWithImpl<$Res,
        _$EstateAddressResponseImpl>
    implements _$$EstateAddressResponseImplCopyWith<$Res> {
  __$$EstateAddressResponseImplCopyWithImpl(_$EstateAddressResponseImpl _value,
      $Res Function(_$EstateAddressResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of EstateAddressResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$EstateAddressResponseImpl(
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
              as AddressData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EstateAddressResponseImpl implements _EstateAddressResponse {
  const _$EstateAddressResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$EstateAddressResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstateAddressResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final AddressData? data;

  @override
  String toString() {
    return 'EstateAddressResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstateAddressResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of EstateAddressResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstateAddressResponseImplCopyWith<_$EstateAddressResponseImpl>
      get copyWith => __$$EstateAddressResponseImplCopyWithImpl<
          _$EstateAddressResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstateAddressResponseImplToJson(
      this,
    );
  }
}

abstract class _EstateAddressResponse implements EstateAddressResponse {
  const factory _EstateAddressResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final AddressData? data}) = _$EstateAddressResponseImpl;

  factory _EstateAddressResponse.fromJson(Map<String, dynamic> json) =
      _$EstateAddressResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  AddressData? get data;

  /// Create a copy of EstateAddressResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstateAddressResponseImplCopyWith<_$EstateAddressResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
