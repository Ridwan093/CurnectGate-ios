// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rsvp_events_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RsvpEventsResponse _$RsvpEventsResponseFromJson(Map<String, dynamic> json) {
  return _RsvpEventsResponse.fromJson(json);
}

/// @nodoc
mixin _$RsvpEventsResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  RsvpEventsData? get data => throw _privateConstructorUsedError;

  /// Serializes this RsvpEventsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RsvpEventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RsvpEventsResponseCopyWith<RsvpEventsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RsvpEventsResponseCopyWith<$Res> {
  factory $RsvpEventsResponseCopyWith(
          RsvpEventsResponse value, $Res Function(RsvpEventsResponse) then) =
      _$RsvpEventsResponseCopyWithImpl<$Res, RsvpEventsResponse>;
  @useResult
  $Res call({bool? status, String? message, int? code, RsvpEventsData? data});

  $RsvpEventsDataCopyWith<$Res>? get data;
}

/// @nodoc
class _$RsvpEventsResponseCopyWithImpl<$Res, $Val extends RsvpEventsResponse>
    implements $RsvpEventsResponseCopyWith<$Res> {
  _$RsvpEventsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RsvpEventsResponse
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
              as RsvpEventsData?,
    ) as $Val);
  }

  /// Create a copy of RsvpEventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RsvpEventsDataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $RsvpEventsDataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RsvpEventsResponseImplCopyWith<$Res>
    implements $RsvpEventsResponseCopyWith<$Res> {
  factory _$$RsvpEventsResponseImplCopyWith(_$RsvpEventsResponseImpl value,
          $Res Function(_$RsvpEventsResponseImpl) then) =
      __$$RsvpEventsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, RsvpEventsData? data});

  @override
  $RsvpEventsDataCopyWith<$Res>? get data;
}

/// @nodoc
class __$$RsvpEventsResponseImplCopyWithImpl<$Res>
    extends _$RsvpEventsResponseCopyWithImpl<$Res, _$RsvpEventsResponseImpl>
    implements _$$RsvpEventsResponseImplCopyWith<$Res> {
  __$$RsvpEventsResponseImplCopyWithImpl(_$RsvpEventsResponseImpl _value,
      $Res Function(_$RsvpEventsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of RsvpEventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? data = freezed,
  }) {
    return _then(_$RsvpEventsResponseImpl(
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
              as RsvpEventsData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$RsvpEventsResponseImpl implements _RsvpEventsResponse {
  const _$RsvpEventsResponseImpl(
      {this.status, this.message, this.code, this.data});

  factory _$RsvpEventsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$RsvpEventsResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  @override
  final RsvpEventsData? data;

  @override
  String toString() {
    return 'RsvpEventsResponse(status: $status, message: $message, code: $code, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RsvpEventsResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code, data);

  /// Create a copy of RsvpEventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RsvpEventsResponseImplCopyWith<_$RsvpEventsResponseImpl> get copyWith =>
      __$$RsvpEventsResponseImplCopyWithImpl<_$RsvpEventsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RsvpEventsResponseImplToJson(
      this,
    );
  }
}

abstract class _RsvpEventsResponse implements RsvpEventsResponse {
  const factory _RsvpEventsResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final RsvpEventsData? data}) = _$RsvpEventsResponseImpl;

  factory _RsvpEventsResponse.fromJson(Map<String, dynamic> json) =
      _$RsvpEventsResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  RsvpEventsData? get data;

  /// Create a copy of RsvpEventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RsvpEventsResponseImplCopyWith<_$RsvpEventsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
