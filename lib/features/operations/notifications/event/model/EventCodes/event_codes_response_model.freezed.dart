// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_codes_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventCodesResponse _$EventCodesResponseFromJson(Map<String, dynamic> json) {
  return _EventCodesResponse.fromJson(json);
}

/// @nodoc
mixin _$EventCodesResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  EventCodesData? get data => throw _privateConstructorUsedError;

  /// Serializes this EventCodesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventCodesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventCodesResponseCopyWith<EventCodesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCodesResponseCopyWith<$Res> {
  factory $EventCodesResponseCopyWith(
          EventCodesResponse value, $Res Function(EventCodesResponse) then) =
      _$EventCodesResponseCopyWithImpl<$Res, EventCodesResponse>;
  @useResult
  $Res call({bool? status, String? message, int? code, EventCodesData? data});

  $EventCodesDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$EventCodesResponseCopyWithImpl<$Res, $Val extends EventCodesResponse>
    implements $EventCodesResponseCopyWith<$Res> {
  _$EventCodesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventCodesResponse
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
              as EventCodesData?,
    ) as $Val);
  }

  /// Create a copy of EventCodesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventCodesDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $EventCodesDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventCodesResponseImplCopyWith<$Res>
    implements $EventCodesResponseCopyWith<$Res> {
  factory _$$EventCodesResponseImplCopyWith(_$EventCodesResponseImpl value,
          $Res Function(_$EventCodesResponseImpl) then) =
      __$$EventCodesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, EventCodesData? data});

  @override
  $EventCodesDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$EventCodesResponseImplCopyWithImpl<$Res>
    extends _$EventCodesResponseCopyWithImpl<$Res, _$EventCodesResponseImpl>
    implements _$$EventCodesResponseImplCopyWith<$Res> {
  __$$EventCodesResponseImplCopyWithImpl(_$EventCodesResponseImpl _value,
      $Res Function(_$EventCodesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventCodesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$EventCodesResponseImpl(
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
              as EventCodesData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$EventCodesResponseImpl implements _EventCodesResponse {
  const _$EventCodesResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$EventCodesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventCodesResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final EventCodesData? data;

  @override
  String toString() {
    return 'EventCodesResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventCodesResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of EventCodesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventCodesResponseImplCopyWith<_$EventCodesResponseImpl> get copyWith =>
      __$$EventCodesResponseImplCopyWithImpl<_$EventCodesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventCodesResponseImplToJson(
      this,
    );
  }
}

abstract class _EventCodesResponse implements EventCodesResponse {
  const factory _EventCodesResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final EventCodesData? data}) = _$EventCodesResponseImpl;

  factory _EventCodesResponse.fromJson(Map<String, dynamic> json) =
      _$EventCodesResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  EventCodesData? get data;

  /// Create a copy of EventCodesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventCodesResponseImplCopyWith<_$EventCodesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
