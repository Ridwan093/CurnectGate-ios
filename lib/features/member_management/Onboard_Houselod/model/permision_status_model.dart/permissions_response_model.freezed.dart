// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permissions_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PermissionsResponse _$PermissionsResponseFromJson(Map<String, dynamic> json) {
  return _PermissionsResponse.fromJson(json);
}

/// @nodoc
mixin _$PermissionsResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  PermissionsData? get data => throw _privateConstructorUsedError;

  /// Serializes this PermissionsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PermissionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermissionsResponseCopyWith<PermissionsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionsResponseCopyWith<$Res> {
  factory $PermissionsResponseCopyWith(
          PermissionsResponse value, $Res Function(PermissionsResponse) then) =
      _$PermissionsResponseCopyWithImpl<$Res, PermissionsResponse>;
  @useResult
  $Res call({bool? status, String? message, int? code, PermissionsData? data});

  $PermissionsDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$PermissionsResponseCopyWithImpl<$Res, $Val extends PermissionsResponse>
    implements $PermissionsResponseCopyWith<$Res> {
  _$PermissionsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PermissionsResponse
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
              as PermissionsData?,
    ) as $Val);
  }

  /// Create a copy of PermissionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PermissionsDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $PermissionsDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PermissionsResponseImplCopyWith<$Res>
    implements $PermissionsResponseCopyWith<$Res> {
  factory _$$PermissionsResponseImplCopyWith(_$PermissionsResponseImpl value,
          $Res Function(_$PermissionsResponseImpl) then) =
      __$$PermissionsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, PermissionsData? data});

  @override
  $PermissionsDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$PermissionsResponseImplCopyWithImpl<$Res>
    extends _$PermissionsResponseCopyWithImpl<$Res, _$PermissionsResponseImpl>
    implements _$$PermissionsResponseImplCopyWith<$Res> {
  __$$PermissionsResponseImplCopyWithImpl(_$PermissionsResponseImpl _value,
      $Res Function(_$PermissionsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PermissionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$PermissionsResponseImpl(
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
              as PermissionsData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionsResponseImpl implements _PermissionsResponse {
  const _$PermissionsResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$PermissionsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionsResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final PermissionsData? data;

  @override
  String toString() {
    return 'PermissionsResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionsResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of PermissionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionsResponseImplCopyWith<_$PermissionsResponseImpl> get copyWith =>
      __$$PermissionsResponseImplCopyWithImpl<_$PermissionsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionsResponseImplToJson(
      this,
    );
  }
}

abstract class _PermissionsResponse implements PermissionsResponse {
  const factory _PermissionsResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final PermissionsData? data}) = _$PermissionsResponseImpl;

  factory _PermissionsResponse.fromJson(Map<String, dynamic> json) =
      _$PermissionsResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  PermissionsData? get data;

  /// Create a copy of PermissionsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionsResponseImplCopyWith<_$PermissionsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
