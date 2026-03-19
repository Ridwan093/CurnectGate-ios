// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restriction_status_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RestrictionStatusResponse _$RestrictionStatusResponseFromJson(
    Map<String, dynamic> json) {
  return _RestrictionStatusResponse.fromJson(json);
}

/// @nodoc
mixin _$RestrictionStatusResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  RestrictionStatusData? get data => throw _privateConstructorUsedError;

  /// Serializes this RestrictionStatusResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RestrictionStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RestrictionStatusResponseCopyWith<RestrictionStatusResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestrictionStatusResponseCopyWith<$Res> {
  factory $RestrictionStatusResponseCopyWith(RestrictionStatusResponse value,
          $Res Function(RestrictionStatusResponse) then) =
      _$RestrictionStatusResponseCopyWithImpl<$Res, RestrictionStatusResponse>;
  @useResult
  $Res call(
      {bool? status, String? message, int? code, RestrictionStatusData? data});

  $RestrictionStatusDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$RestrictionStatusResponseCopyWithImpl<$Res,
        $Val extends RestrictionStatusResponse>
    implements $RestrictionStatusResponseCopyWith<$Res> {
  _$RestrictionStatusResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RestrictionStatusResponse
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
              as RestrictionStatusData?,
    ) as $Val);
  }

  /// Create a copy of RestrictionStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RestrictionStatusDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $RestrictionStatusDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RestrictionStatusResponseImplCopyWith<$Res>
    implements $RestrictionStatusResponseCopyWith<$Res> {
  factory _$$RestrictionStatusResponseImplCopyWith(
          _$RestrictionStatusResponseImpl value,
          $Res Function(_$RestrictionStatusResponseImpl) then) =
      __$$RestrictionStatusResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status, String? message, int? code, RestrictionStatusData? data});

  @override
  $RestrictionStatusDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$RestrictionStatusResponseImplCopyWithImpl<$Res>
    extends _$RestrictionStatusResponseCopyWithImpl<$Res,
        _$RestrictionStatusResponseImpl>
    implements _$$RestrictionStatusResponseImplCopyWith<$Res> {
  __$$RestrictionStatusResponseImplCopyWithImpl(
      _$RestrictionStatusResponseImpl _value,
      $Res Function(_$RestrictionStatusResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RestrictionStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$RestrictionStatusResponseImpl(
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
              as RestrictionStatusData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$RestrictionStatusResponseImpl implements _RestrictionStatusResponse {
  const _$RestrictionStatusResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$RestrictionStatusResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestrictionStatusResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final RestrictionStatusData? data;

  @override
  String toString() {
    return 'RestrictionStatusResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestrictionStatusResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of RestrictionStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RestrictionStatusResponseImplCopyWith<_$RestrictionStatusResponseImpl>
      get copyWith => __$$RestrictionStatusResponseImplCopyWithImpl<
          _$RestrictionStatusResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestrictionStatusResponseImplToJson(
      this,
    );
  }
}

abstract class _RestrictionStatusResponse implements RestrictionStatusResponse {
  const factory _RestrictionStatusResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final RestrictionStatusData? data}) = _$RestrictionStatusResponseImpl;

  factory _RestrictionStatusResponse.fromJson(Map<String, dynamic> json) =
      _$RestrictionStatusResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  RestrictionStatusData? get data;

  /// Create a copy of RestrictionStatusResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RestrictionStatusResponseImplCopyWith<_$RestrictionStatusResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
