// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'outstanding_dues_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OutstandingDuesResponse _$OutstandingDuesResponseFromJson(
    Map<String, dynamic> json) {
  return _OutstandingDuesResponse.fromJson(json);
}

/// @nodoc
mixin _$OutstandingDuesResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  OutstandingDuesData? get data => throw _privateConstructorUsedError;

  /// Serializes this OutstandingDuesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OutstandingDuesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OutstandingDuesResponseCopyWith<OutstandingDuesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutstandingDuesResponseCopyWith<$Res> {
  factory $OutstandingDuesResponseCopyWith(OutstandingDuesResponse value,
          $Res Function(OutstandingDuesResponse) then) =
      _$OutstandingDuesResponseCopyWithImpl<$Res, OutstandingDuesResponse>;
  @useResult
  $Res call(
      {bool? status, String? message, int? code, OutstandingDuesData? data});

  $OutstandingDuesDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$OutstandingDuesResponseCopyWithImpl<$Res,
        $Val extends OutstandingDuesResponse>
    implements $OutstandingDuesResponseCopyWith<$Res> {
  _$OutstandingDuesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OutstandingDuesResponse
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
              as OutstandingDuesData?,
    ) as $Val);
  }

  /// Create a copy of OutstandingDuesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OutstandingDuesDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $OutstandingDuesDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$OutstandingDuesResponseImplCopyWith<$Res>
    implements $OutstandingDuesResponseCopyWith<$Res> {
  factory _$$OutstandingDuesResponseImplCopyWith(
          _$OutstandingDuesResponseImpl value,
          $Res Function(_$OutstandingDuesResponseImpl) then) =
      __$$OutstandingDuesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool? status, String? message, int? code, OutstandingDuesData? data});

  @override
  $OutstandingDuesDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$OutstandingDuesResponseImplCopyWithImpl<$Res>
    extends _$OutstandingDuesResponseCopyWithImpl<$Res,
        _$OutstandingDuesResponseImpl>
    implements _$$OutstandingDuesResponseImplCopyWith<$Res> {
  __$$OutstandingDuesResponseImplCopyWithImpl(
      _$OutstandingDuesResponseImpl _value,
      $Res Function(_$OutstandingDuesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of OutstandingDuesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$OutstandingDuesResponseImpl(
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
              as OutstandingDuesData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$OutstandingDuesResponseImpl implements _OutstandingDuesResponse {
  const _$OutstandingDuesResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$OutstandingDuesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$OutstandingDuesResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final OutstandingDuesData? data;

  @override
  String toString() {
    return 'OutstandingDuesResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OutstandingDuesResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of OutstandingDuesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OutstandingDuesResponseImplCopyWith<_$OutstandingDuesResponseImpl>
      get copyWith => __$$OutstandingDuesResponseImplCopyWithImpl<
          _$OutstandingDuesResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OutstandingDuesResponseImplToJson(
      this,
    );
  }
}

abstract class _OutstandingDuesResponse implements OutstandingDuesResponse {
  const factory _OutstandingDuesResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final OutstandingDuesData? data}) = _$OutstandingDuesResponseImpl;

  factory _OutstandingDuesResponse.fromJson(Map<String, dynamic> json) =
      _$OutstandingDuesResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  OutstandingDuesData? get data;

  /// Create a copy of OutstandingDuesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OutstandingDuesResponseImplCopyWith<_$OutstandingDuesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
