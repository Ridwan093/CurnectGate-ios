// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_history_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WalletHistoryResponse _$WalletHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return _WalletHistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$WalletHistoryResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  WalletHistoryData? get data => throw _privateConstructorUsedError;

  /// Serializes this WalletHistoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletHistoryResponseCopyWith<WalletHistoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletHistoryResponseCopyWith<$Res> {
  factory $WalletHistoryResponseCopyWith(WalletHistoryResponse value,
          $Res Function(WalletHistoryResponse) then) =
      _$WalletHistoryResponseCopyWithImpl<$Res, WalletHistoryResponse>;
  @useResult
  $Res call(
      {bool? status, String? message, int? code, WalletHistoryData? data});

  $WalletHistoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$WalletHistoryResponseCopyWithImpl<$Res,
        $Val extends WalletHistoryResponse>
    implements $WalletHistoryResponseCopyWith<$Res> {
  _$WalletHistoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletHistoryResponse
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
              as WalletHistoryData?,
    ) as $Val);
  }

  /// Create a copy of WalletHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletHistoryDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $WalletHistoryDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WalletHistoryResponseImplCopyWith<$Res>
    implements $WalletHistoryResponseCopyWith<$Res> {
  factory _$$WalletHistoryResponseImplCopyWith(
          _$WalletHistoryResponseImpl value,
          $Res Function(_$WalletHistoryResponseImpl) then) =
      __$$WalletHistoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status, String? message, int? code, WalletHistoryData? data});

  @override
  $WalletHistoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$WalletHistoryResponseImplCopyWithImpl<$Res>
    extends _$WalletHistoryResponseCopyWithImpl<$Res,
        _$WalletHistoryResponseImpl>
    implements _$$WalletHistoryResponseImplCopyWith<$Res> {
  __$$WalletHistoryResponseImplCopyWithImpl(_$WalletHistoryResponseImpl _value,
      $Res Function(_$WalletHistoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$WalletHistoryResponseImpl(
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
              as WalletHistoryData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$WalletHistoryResponseImpl implements _WalletHistoryResponse {
  const _$WalletHistoryResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$WalletHistoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletHistoryResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final WalletHistoryData? data;

  @override
  String toString() {
    return 'WalletHistoryResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletHistoryResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of WalletHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletHistoryResponseImplCopyWith<_$WalletHistoryResponseImpl>
      get copyWith => __$$WalletHistoryResponseImplCopyWithImpl<
          _$WalletHistoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletHistoryResponseImplToJson(
      this,
    );
  }
}

abstract class _WalletHistoryResponse implements WalletHistoryResponse {
  const factory _WalletHistoryResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final WalletHistoryData? data}) = _$WalletHistoryResponseImpl;

  factory _WalletHistoryResponse.fromJson(Map<String, dynamic> json) =
      _$WalletHistoryResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  WalletHistoryData? get data;

  /// Create a copy of WalletHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletHistoryResponseImplCopyWith<_$WalletHistoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
