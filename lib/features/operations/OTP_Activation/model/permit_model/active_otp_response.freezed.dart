// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'active_otp_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ActiveOtpResponse _$ActiveOtpResponseFromJson(Map<String, dynamic> json) {
  return _ActiveOtpResponse.fromJson(json);
}

/// @nodoc
mixin _$ActiveOtpResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  ActiveOtpData? get data => throw _privateConstructorUsedError;

  /// Serializes this ActiveOtpResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ActiveOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActiveOtpResponseCopyWith<ActiveOtpResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActiveOtpResponseCopyWith<$Res> {
  factory $ActiveOtpResponseCopyWith(
          ActiveOtpResponse value, $Res Function(ActiveOtpResponse) then) =
      _$ActiveOtpResponseCopyWithImpl<$Res, ActiveOtpResponse>;
  @useResult
  $Res call({bool? status, String? message, int? code, ActiveOtpData? data});

  $ActiveOtpDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ActiveOtpResponseCopyWithImpl<$Res, $Val extends ActiveOtpResponse>
    implements $ActiveOtpResponseCopyWith<$Res> {
  _$ActiveOtpResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ActiveOtpResponse
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
              as ActiveOtpData?,
    ) as $Val);
  }

  /// Create a copy of ActiveOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActiveOtpDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ActiveOtpDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActiveOtpResponseImplCopyWith<$Res>
    implements $ActiveOtpResponseCopyWith<$Res> {
  factory _$$ActiveOtpResponseImplCopyWith(_$ActiveOtpResponseImpl value,
          $Res Function(_$ActiveOtpResponseImpl) then) =
      __$$ActiveOtpResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, ActiveOtpData? data});

  @override
  $ActiveOtpDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ActiveOtpResponseImplCopyWithImpl<$Res>
    extends _$ActiveOtpResponseCopyWithImpl<$Res, _$ActiveOtpResponseImpl>
    implements _$$ActiveOtpResponseImplCopyWith<$Res> {
  __$$ActiveOtpResponseImplCopyWithImpl(_$ActiveOtpResponseImpl _value,
      $Res Function(_$ActiveOtpResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ActiveOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ActiveOtpResponseImpl(
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
              as ActiveOtpData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ActiveOtpResponseImpl implements _ActiveOtpResponse {
  const _$ActiveOtpResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$ActiveOtpResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActiveOtpResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final ActiveOtpData? data;

  @override
  String toString() {
    return 'ActiveOtpResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActiveOtpResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of ActiveOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActiveOtpResponseImplCopyWith<_$ActiveOtpResponseImpl> get copyWith =>
      __$$ActiveOtpResponseImplCopyWithImpl<_$ActiveOtpResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActiveOtpResponseImplToJson(
      this,
    );
  }
}

abstract class _ActiveOtpResponse implements ActiveOtpResponse {
  const factory _ActiveOtpResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final ActiveOtpData? data}) = _$ActiveOtpResponseImpl;

  factory _ActiveOtpResponse.fromJson(Map<String, dynamic> json) =
      _$ActiveOtpResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  ActiveOtpData? get data;

  /// Create a copy of ActiveOtpResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActiveOtpResponseImplCopyWith<_$ActiveOtpResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
