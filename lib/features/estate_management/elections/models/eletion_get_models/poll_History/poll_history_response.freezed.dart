// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'poll_history_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PollHistoryResponse _$PollHistoryResponseFromJson(Map<String, dynamic> json) {
  return _PollHistoryResponse.fromJson(json);
}

/// @nodoc
mixin _$PollHistoryResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  PollHistoryData? get data => throw _privateConstructorUsedError;

  /// Serializes this PollHistoryResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PollHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PollHistoryResponseCopyWith<PollHistoryResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollHistoryResponseCopyWith<$Res> {
  factory $PollHistoryResponseCopyWith(
          PollHistoryResponse value, $Res Function(PollHistoryResponse) then) =
      _$PollHistoryResponseCopyWithImpl<$Res, PollHistoryResponse>;
  @useResult
  $Res call({bool? status, String? message, int? code, PollHistoryData? data});

  $PollHistoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$PollHistoryResponseCopyWithImpl<$Res, $Val extends PollHistoryResponse>
    implements $PollHistoryResponseCopyWith<$Res> {
  _$PollHistoryResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PollHistoryResponse
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
              as PollHistoryData?,
    ) as $Val);
  }

  /// Create a copy of PollHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PollHistoryDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $PollHistoryDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PollHistoryResponseImplCopyWith<$Res>
    implements $PollHistoryResponseCopyWith<$Res> {
  factory _$$PollHistoryResponseImplCopyWith(_$PollHistoryResponseImpl value,
          $Res Function(_$PollHistoryResponseImpl) then) =
      __$$PollHistoryResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, PollHistoryData? data});

  @override
  $PollHistoryDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$PollHistoryResponseImplCopyWithImpl<$Res>
    extends _$PollHistoryResponseCopyWithImpl<$Res, _$PollHistoryResponseImpl>
    implements _$$PollHistoryResponseImplCopyWith<$Res> {
  __$$PollHistoryResponseImplCopyWithImpl(_$PollHistoryResponseImpl _value,
      $Res Function(_$PollHistoryResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PollHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$PollHistoryResponseImpl(
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
              as PollHistoryData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PollHistoryResponseImpl implements _PollHistoryResponse {
  const _$PollHistoryResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$PollHistoryResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollHistoryResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final PollHistoryData? data;

  @override
  String toString() {
    return 'PollHistoryResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollHistoryResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of PollHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PollHistoryResponseImplCopyWith<_$PollHistoryResponseImpl> get copyWith =>
      __$$PollHistoryResponseImplCopyWithImpl<_$PollHistoryResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollHistoryResponseImplToJson(
      this,
    );
  }
}

abstract class _PollHistoryResponse implements PollHistoryResponse {
  const factory _PollHistoryResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final PollHistoryData? data}) = _$PollHistoryResponseImpl;

  factory _PollHistoryResponse.fromJson(Map<String, dynamic> json) =
      _$PollHistoryResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  PollHistoryData? get data;

  /// Create a copy of PollHistoryResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PollHistoryResponseImplCopyWith<_$PollHistoryResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
