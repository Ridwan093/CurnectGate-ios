// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resident_directory_respond.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResidentDirectoryResponse _$ResidentDirectoryResponseFromJson(
    Map<String, dynamic> json) {
  return _ResidentDirectoryResponse.fromJson(json);
}

/// @nodoc
mixin _$ResidentDirectoryResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  ResidentDirectoryData? get data => throw _privateConstructorUsedError;

  /// Serializes this ResidentDirectoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResidentDirectoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResidentDirectoryResponseCopyWith<ResidentDirectoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResidentDirectoryResponseCopyWith<$Res> {
  factory $ResidentDirectoryResponseCopyWith(ResidentDirectoryResponse value,
          $Res Function(ResidentDirectoryResponse) then) =
      _$ResidentDirectoryResponseCopyWithImpl<$Res, ResidentDirectoryResponse>;
  @useResult
  $Res call(
      {bool? status, String? message, int? code, ResidentDirectoryData? data});

  $ResidentDirectoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ResidentDirectoryResponseCopyWithImpl<$Res,
        $Val extends ResidentDirectoryResponse>
    implements $ResidentDirectoryResponseCopyWith<$Res> {
  _$ResidentDirectoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResidentDirectoryResponse
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
              as ResidentDirectoryData?,
    ) as $Val);
  }

  /// Create a copy of ResidentDirectoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResidentDirectoryDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ResidentDirectoryDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResidentDirectoryResponseImplCopyWith<$Res>
    implements $ResidentDirectoryResponseCopyWith<$Res> {
  factory _$$ResidentDirectoryResponseImplCopyWith(
          _$ResidentDirectoryResponseImpl value,
          $Res Function(_$ResidentDirectoryResponseImpl) then) =
      __$$ResidentDirectoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status, String? message, int? code, ResidentDirectoryData? data});

  @override
  $ResidentDirectoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ResidentDirectoryResponseImplCopyWithImpl<$Res>
    extends _$ResidentDirectoryResponseCopyWithImpl<$Res,
        _$ResidentDirectoryResponseImpl>
    implements _$$ResidentDirectoryResponseImplCopyWith<$Res> {
  __$$ResidentDirectoryResponseImplCopyWithImpl(
      _$ResidentDirectoryResponseImpl _value,
      $Res Function(_$ResidentDirectoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResidentDirectoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ResidentDirectoryResponseImpl(
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
              as ResidentDirectoryData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ResidentDirectoryResponseImpl implements _ResidentDirectoryResponse {
  const _$ResidentDirectoryResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$ResidentDirectoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResidentDirectoryResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final ResidentDirectoryData? data;

  @override
  String toString() {
    return 'ResidentDirectoryResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResidentDirectoryResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of ResidentDirectoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResidentDirectoryResponseImplCopyWith<_$ResidentDirectoryResponseImpl>
      get copyWith => __$$ResidentDirectoryResponseImplCopyWithImpl<
          _$ResidentDirectoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResidentDirectoryResponseImplToJson(
      this,
    );
  }
}

abstract class _ResidentDirectoryResponse implements ResidentDirectoryResponse {
  const factory _ResidentDirectoryResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final ResidentDirectoryData? data}) = _$ResidentDirectoryResponseImpl;

  factory _ResidentDirectoryResponse.fromJson(Map<String, dynamic> json) =
      _$ResidentDirectoryResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  ResidentDirectoryData? get data;

  /// Create a copy of ResidentDirectoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResidentDirectoryResponseImplCopyWith<_$ResidentDirectoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
