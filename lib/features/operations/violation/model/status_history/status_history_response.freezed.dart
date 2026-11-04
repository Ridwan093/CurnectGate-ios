// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'status_history_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StatusHistoryResponse _$StatusHistoryResponseFromJson(
    Map<String, dynamic> json) {
  return _StatusHistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$StatusHistoryResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  HistoryData? get data => throw _privateConstructorUsedError;

  /// Serializes this StatusHistoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatusHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusHistoryResponseCopyWith<StatusHistoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusHistoryResponseCopyWith<$Res> {
  factory $StatusHistoryResponseCopyWith(StatusHistoryResponse value,
          $Res Function(StatusHistoryResponse) then) =
      _$StatusHistoryResponseCopyWithImpl<$Res, StatusHistoryResponse>;
  @useResult
  $Res call({bool? status, String? message, int? code, HistoryData? data});

  $HistoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$StatusHistoryResponseCopyWithImpl<$Res,
        $Val extends StatusHistoryResponse>
    implements $StatusHistoryResponseCopyWith<$Res> {
  _$StatusHistoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusHistoryResponse
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
              as HistoryData?,
    ) as $Val);
  }

  /// Create a copy of StatusHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HistoryDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $HistoryDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StatusHistoryResponseImplCopyWith<$Res>
    implements $StatusHistoryResponseCopyWith<$Res> {
  factory _$$StatusHistoryResponseImplCopyWith(
          _$StatusHistoryResponseImpl value,
          $Res Function(_$StatusHistoryResponseImpl) then) =
      __$$StatusHistoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, HistoryData? data});

  @override
  $HistoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$StatusHistoryResponseImplCopyWithImpl<$Res>
    extends _$StatusHistoryResponseCopyWithImpl<$Res,
        _$StatusHistoryResponseImpl>
    implements _$$StatusHistoryResponseImplCopyWith<$Res> {
  __$$StatusHistoryResponseImplCopyWithImpl(_$StatusHistoryResponseImpl _value,
      $Res Function(_$StatusHistoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatusHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$StatusHistoryResponseImpl(
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
              as HistoryData?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusHistoryResponseImpl implements _StatusHistoryResponse {
  const _$StatusHistoryResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$StatusHistoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusHistoryResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final HistoryData? data;

  @override
  String toString() {
    return 'StatusHistoryResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusHistoryResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of StatusHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusHistoryResponseImplCopyWith<_$StatusHistoryResponseImpl>
      get copyWith => __$$StatusHistoryResponseImplCopyWithImpl<
          _$StatusHistoryResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusHistoryResponseImplToJson(
      this,
    );
  }
}

abstract class _StatusHistoryResponse implements StatusHistoryResponse {
  const factory _StatusHistoryResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final HistoryData? data}) = _$StatusHistoryResponseImpl;

  factory _StatusHistoryResponse.fromJson(Map<String, dynamic> json) =
      _$StatusHistoryResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  HistoryData? get data;

  /// Create a copy of StatusHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusHistoryResponseImplCopyWith<_$StatusHistoryResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
