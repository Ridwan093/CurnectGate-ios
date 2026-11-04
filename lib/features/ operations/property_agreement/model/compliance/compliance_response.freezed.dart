// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'compliance_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ComplianceResponse _$ComplianceResponseFromJson(Map<String, dynamic> json) {
  return _ComplianceResponse.fromJson(json);
}

/// @nodoc
mixin _$ComplianceResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  ComplianceData? get data => throw _privateConstructorUsedError;

  /// Serializes this ComplianceResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ComplianceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ComplianceResponseCopyWith<ComplianceResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ComplianceResponseCopyWith<$Res> {
  factory $ComplianceResponseCopyWith(
          ComplianceResponse value, $Res Function(ComplianceResponse) then) =
      _$ComplianceResponseCopyWithImpl<$Res, ComplianceResponse>;
  @useResult
  $Res call({bool? status, String? message, int? code, ComplianceData? data});

  $ComplianceDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ComplianceResponseCopyWithImpl<$Res, $Val extends ComplianceResponse>
    implements $ComplianceResponseCopyWith<$Res> {
  _$ComplianceResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ComplianceResponse
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
              as ComplianceData?,
    ) as $Val);
  }

  /// Create a copy of ComplianceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ComplianceDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ComplianceDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ComplianceResponseImplCopyWith<$Res>
    implements $ComplianceResponseCopyWith<$Res> {
  factory _$$ComplianceResponseImplCopyWith(_$ComplianceResponseImpl value,
          $Res Function(_$ComplianceResponseImpl) then) =
      __$$ComplianceResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, ComplianceData? data});

  @override
  $ComplianceDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ComplianceResponseImplCopyWithImpl<$Res>
    extends _$ComplianceResponseCopyWithImpl<$Res, _$ComplianceResponseImpl>
    implements _$$ComplianceResponseImplCopyWith<$Res> {
  __$$ComplianceResponseImplCopyWithImpl(_$ComplianceResponseImpl _value,
      $Res Function(_$ComplianceResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ComplianceResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ComplianceResponseImpl(
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
              as ComplianceData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ComplianceResponseImpl implements _ComplianceResponse {
  const _$ComplianceResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$ComplianceResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ComplianceResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final ComplianceData? data;

  @override
  String toString() {
    return 'ComplianceResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ComplianceResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of ComplianceResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ComplianceResponseImplCopyWith<_$ComplianceResponseImpl> get copyWith =>
      __$$ComplianceResponseImplCopyWithImpl<_$ComplianceResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ComplianceResponseImplToJson(
      this,
    );
  }
}

abstract class _ComplianceResponse implements ComplianceResponse {
  const factory _ComplianceResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final ComplianceData? data}) = _$ComplianceResponseImpl;

  factory _ComplianceResponse.fromJson(Map<String, dynamic> json) =
      _$ComplianceResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  ComplianceData? get data;

  /// Create a copy of ComplianceResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ComplianceResponseImplCopyWith<_$ComplianceResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
