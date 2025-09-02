// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventsResponse _$EventsResponseFromJson(Map<String, dynamic> json) {
  return _EventsResponse.fromJson(json);
}

/// @nodoc
mixin _$EventsResponse {
  bool? get status => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;
  List<Event>? get events => throw _privateConstructorUsedError;

  /// Serializes this EventsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventsResponseCopyWith<EventsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsResponseCopyWith<$Res> {
  factory $EventsResponseCopyWith(
          EventsResponse value, $Res Function(EventsResponse) then) =
      _$EventsResponseCopyWithImpl<$Res, EventsResponse>;
  @useResult
  $Res call({bool? status, String? message, int? code, List<Event>? events});
}

/// @nodoc
class _$EventsResponseCopyWithImpl<$Res, $Val extends EventsResponse>
    implements $EventsResponseCopyWith<$Res> {
  _$EventsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? events = freezed,
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
      events: freezed == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventsResponseImplCopyWith<$Res>
    implements $EventsResponseCopyWith<$Res> {
  factory _$$EventsResponseImplCopyWith(_$EventsResponseImpl value,
          $Res Function(_$EventsResponseImpl) then) =
      __$$EventsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool? status, String? message, int? code, List<Event>? events});
}

/// @nodoc
class __$$EventsResponseImplCopyWithImpl<$Res>
    extends _$EventsResponseCopyWithImpl<$Res, _$EventsResponseImpl>
    implements _$$EventsResponseImplCopyWith<$Res> {
  __$$EventsResponseImplCopyWithImpl(
      _$EventsResponseImpl _value, $Res Function(_$EventsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? message = freezed,
    Object? code = freezed,
    Object? events = freezed,
  }) {
    return _then(_$EventsResponseImpl(
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
      events: freezed == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$EventsResponseImpl implements _EventsResponse {
  const _$EventsResponseImpl(
      {this.status, this.message, this.code, final List<Event>? events})
      : _events = events;

  factory _$EventsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventsResponseImplFromJson(json);

  @override
  final bool? status;
  @override
  final String? message;
  @override
  final int? code;
  final List<Event>? _events;
  @override
  List<Event>? get events {
    final value = _events;
    if (value == null) return null;
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EventsResponse(status: $status, message: $message, code: $code, events: $events)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventsResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.code, code) || other.code == code) &&
            const DeepCollectionEquality().equals(other._events, _events));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, message, code,
      const DeepCollectionEquality().hash(_events));

  /// Create a copy of EventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventsResponseImplCopyWith<_$EventsResponseImpl> get copyWith =>
      __$$EventsResponseImplCopyWithImpl<_$EventsResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventsResponseImplToJson(
      this,
    );
  }
}

abstract class _EventsResponse implements EventsResponse {
  const factory _EventsResponse(
      {final bool? status,
      final String? message,
      final int? code,
      final List<Event>? events}) = _$EventsResponseImpl;

  factory _EventsResponse.fromJson(Map<String, dynamic> json) =
      _$EventsResponseImpl.fromJson;

  @override
  bool? get status;
  @override
  String? get message;
  @override
  int? get code;
  @override
  List<Event>? get events;

  /// Create a copy of EventsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventsResponseImplCopyWith<_$EventsResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
