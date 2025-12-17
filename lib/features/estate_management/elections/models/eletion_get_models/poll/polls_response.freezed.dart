// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'polls_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PollsResponse _$PollsResponseFromJson(Map<String, dynamic> json) {
  return _PollsResponse.fromJson(json);
}

/// @nodoc
mixin _$PollsResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  PollsData? get data => throw _privateConstructorUsedError;

  /// Serializes this PollsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PollsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PollsResponseCopyWith<PollsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PollsResponseCopyWith<$Res> {
  factory $PollsResponseCopyWith(
          PollsResponse value, $Res Function(PollsResponse) then) =
      _$PollsResponseCopyWithImpl<$Res, PollsResponse>;
  @useResult
  $Res call({bool? status, String? message, int? code, PollsData? data});

  $PollsDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$PollsResponseCopyWithImpl<$Res, $Val extends PollsResponse>
    implements $PollsResponseCopyWith<$Res> {
  _$PollsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PollsResponse
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
              as PollsData?,
    ) as $Val);
  }

  /// Create a copy of PollsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PollsDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $PollsDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PollsResponseImplCopyWith<$Res>
    implements $PollsResponseCopyWith<$Res> {
  factory _$$PollsResponseImplCopyWith(
          _$PollsResponseImpl value, $Res Function(_$PollsResponseImpl) then) =
      __$$PollsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, PollsData? data});

  @override
  $PollsDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$PollsResponseImplCopyWithImpl<$Res>
    extends _$PollsResponseCopyWithImpl<$Res, _$PollsResponseImpl>
    implements _$$PollsResponseImplCopyWith<$Res> {
  __$$PollsResponseImplCopyWithImpl(
      _$PollsResponseImpl _value, $Res Function(_$PollsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PollsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$PollsResponseImpl(
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
              as PollsData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PollsResponseImpl implements _PollsResponse {
  const _$PollsResponseImpl({this.status, this.message, this.code, this.data});

  factory _$PollsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PollsResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final PollsData? data;

  @override
  String toString() {
    return 'PollsResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PollsResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of PollsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PollsResponseImplCopyWith<_$PollsResponseImpl> get copyWith =>
      __$$PollsResponseImplCopyWithImpl<_$PollsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PollsResponseImplToJson(
      this,
    );
  }
}

abstract class _PollsResponse implements PollsResponse {
  const factory _PollsResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final PollsData? data}) = _$PollsResponseImpl;

  factory _PollsResponse.fromJson(Map<String, dynamic> json) =
      _$PollsResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  PollsData? get data;

  /// Create a copy of PollsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PollsResponseImplCopyWith<_$PollsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
