// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'candidates_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CandidatesResponse _$CandidatesResponseFromJson(Map<String, dynamic> json) {
  return _CandidatesResponse.fromJson(json);
}

/// @nodoc
mixin _$CandidatesResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  CandidatesData? get data => throw _privateConstructorUsedError;

  /// Serializes this CandidatesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CandidatesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CandidatesResponseCopyWith<CandidatesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CandidatesResponseCopyWith<$Res> {
  factory $CandidatesResponseCopyWith(
          CandidatesResponse value, $Res Function(CandidatesResponse) then) =
      _$CandidatesResponseCopyWithImpl<$Res, CandidatesResponse>;
  @useResult
  $Res call({bool? status, String? message, int? code, CandidatesData? data});

  $CandidatesDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$CandidatesResponseCopyWithImpl<$Res, $Val extends CandidatesResponse>
    implements $CandidatesResponseCopyWith<$Res> {
  _$CandidatesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CandidatesResponse
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
              as CandidatesData?,
    ) as $Val);
  }

  /// Create a copy of CandidatesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CandidatesDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $CandidatesDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CandidatesResponseImplCopyWith<$Res>
    implements $CandidatesResponseCopyWith<$Res> {
  factory _$$CandidatesResponseImplCopyWith(_$CandidatesResponseImpl value,
          $Res Function(_$CandidatesResponseImpl) then) =
      __$$CandidatesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, CandidatesData? data});

  @override
  $CandidatesDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$CandidatesResponseImplCopyWithImpl<$Res>
    extends _$CandidatesResponseCopyWithImpl<$Res, _$CandidatesResponseImpl>
    implements _$$CandidatesResponseImplCopyWith<$Res> {
  __$$CandidatesResponseImplCopyWithImpl(_$CandidatesResponseImpl _value,
      $Res Function(_$CandidatesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CandidatesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$CandidatesResponseImpl(
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
              as CandidatesData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CandidatesResponseImpl implements _CandidatesResponse {
  const _$CandidatesResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$CandidatesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CandidatesResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final CandidatesData? data;

  @override
  String toString() {
    return 'CandidatesResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CandidatesResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of CandidatesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CandidatesResponseImplCopyWith<_$CandidatesResponseImpl> get copyWith =>
      __$$CandidatesResponseImplCopyWithImpl<_$CandidatesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CandidatesResponseImplToJson(
      this,
    );
  }
}

abstract class _CandidatesResponse implements CandidatesResponse {
  const factory _CandidatesResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final CandidatesData? data}) = _$CandidatesResponseImpl;

  factory _CandidatesResponse.fromJson(Map<String, dynamic> json) =
      _$CandidatesResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  CandidatesData? get data;

  /// Create a copy of CandidatesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CandidatesResponseImplCopyWith<_$CandidatesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
