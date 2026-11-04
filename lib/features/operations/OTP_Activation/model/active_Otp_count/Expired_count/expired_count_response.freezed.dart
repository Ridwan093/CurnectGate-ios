// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expired_count_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpiredCountResponse _$ExpiredCountResponseFromJson(Map<String, dynamic> json) {
  return _ExpiredCountResponse.fromJson(json);
}

/// @nodoc
mixin _$ExpiredCountResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  ExpiredCountData? get data => throw _privateConstructorUsedError;

  /// Serializes this ExpiredCountResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpiredCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpiredCountResponseCopyWith<ExpiredCountResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpiredCountResponseCopyWith<$Res> {
  factory $ExpiredCountResponseCopyWith(ExpiredCountResponse value,
          $Res Function(ExpiredCountResponse) then) =
      _$ExpiredCountResponseCopyWithImpl<$Res, ExpiredCountResponse>;
  @useResult
  $Res call({bool? status, String? message, int? code, ExpiredCountData? data});

  $ExpiredCountDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ExpiredCountResponseCopyWithImpl<$Res,
        $Val extends ExpiredCountResponse>
    implements $ExpiredCountResponseCopyWith<$Res> {
  _$ExpiredCountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpiredCountResponse
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
              as ExpiredCountData?,
    ) as $Val);
  }

  /// Create a copy of ExpiredCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ExpiredCountDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ExpiredCountDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExpiredCountResponseImplCopyWith<$Res>
    implements $ExpiredCountResponseCopyWith<$Res> {
  factory _$$ExpiredCountResponseImplCopyWith(_$ExpiredCountResponseImpl value,
          $Res Function(_$ExpiredCountResponseImpl) then) =
      __$$ExpiredCountResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, ExpiredCountData? data});

  @override
  $ExpiredCountDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ExpiredCountResponseImplCopyWithImpl<$Res>
    extends _$ExpiredCountResponseCopyWithImpl<$Res, _$ExpiredCountResponseImpl>
    implements _$$ExpiredCountResponseImplCopyWith<$Res> {
  __$$ExpiredCountResponseImplCopyWithImpl(_$ExpiredCountResponseImpl _value,
      $Res Function(_$ExpiredCountResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpiredCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ExpiredCountResponseImpl(
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
              as ExpiredCountData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpiredCountResponseImpl implements _ExpiredCountResponse {
  const _$ExpiredCountResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$ExpiredCountResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpiredCountResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final ExpiredCountData? data;

  @override
  String toString() {
    return 'ExpiredCountResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpiredCountResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of ExpiredCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpiredCountResponseImplCopyWith<_$ExpiredCountResponseImpl>
      get copyWith =>
          __$$ExpiredCountResponseImplCopyWithImpl<_$ExpiredCountResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpiredCountResponseImplToJson(
      this,
    );
  }
}

abstract class _ExpiredCountResponse implements ExpiredCountResponse {
  const factory _ExpiredCountResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final ExpiredCountData? data}) = _$ExpiredCountResponseImpl;

  factory _ExpiredCountResponse.fromJson(Map<String, dynamic> json) =
      _$ExpiredCountResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  ExpiredCountData? get data;

  /// Create a copy of ExpiredCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpiredCountResponseImplCopyWith<_$ExpiredCountResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
