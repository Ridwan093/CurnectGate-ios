// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'results_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResultsResponse _$ResultsResponseFromJson(Map<String, dynamic> json) {
  return _ResultsResponse.fromJson(json);
}

/// @nodoc
mixin _$ResultsResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  ResultsData? get data => throw _privateConstructorUsedError;

  /// Serializes this ResultsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultsResponseCopyWith<ResultsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultsResponseCopyWith<$Res> {
  factory $ResultsResponseCopyWith(
          ResultsResponse value, $Res Function(ResultsResponse) then) =
      _$ResultsResponseCopyWithImpl<$Res, ResultsResponse>;
  @useResult
  $Res call({bool? status, String? message, int? code, ResultsData? data});

  $ResultsDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$ResultsResponseCopyWithImpl<$Res, $Val extends ResultsResponse>
    implements $ResultsResponseCopyWith<$Res> {
  _$ResultsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultsResponse
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
              as ResultsData?,
    ) as $Val);
  }

  /// Create a copy of ResultsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultsDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $ResultsDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResultsResponseImplCopyWith<$Res>
    implements $ResultsResponseCopyWith<$Res> {
  factory _$$ResultsResponseImplCopyWith(_$ResultsResponseImpl value,
          $Res Function(_$ResultsResponseImpl) then) =
      __$$ResultsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, ResultsData? data});

  @override
  $ResultsDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$ResultsResponseImplCopyWithImpl<$Res>
    extends _$ResultsResponseCopyWithImpl<$Res, _$ResultsResponseImpl>
    implements _$$ResultsResponseImplCopyWith<$Res> {
  __$$ResultsResponseImplCopyWithImpl(
      _$ResultsResponseImpl _value, $Res Function(_$ResultsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResultsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$ResultsResponseImpl(
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
              as ResultsData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultsResponseImpl implements _ResultsResponse {
  const _$ResultsResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$ResultsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultsResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final ResultsData? data;

  @override
  String toString() {
    return 'ResultsResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultsResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of ResultsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultsResponseImplCopyWith<_$ResultsResponseImpl> get copyWith =>
      __$$ResultsResponseImplCopyWithImpl<_$ResultsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultsResponseImplToJson(
      this,
    );
  }
}

abstract class _ResultsResponse implements ResultsResponse {
  const factory _ResultsResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final ResultsData? data}) = _$ResultsResponseImpl;

  factory _ResultsResponse.fromJson(Map<String, dynamic> json) =
      _$ResultsResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  ResultsData? get data;

  /// Create a copy of ResultsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultsResponseImplCopyWith<_$ResultsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
