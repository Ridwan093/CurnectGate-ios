// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_user_rsvp_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalendarUserRsvp _$CalendarUserRsvpFromJson(Map<String, dynamic> json) {
  return _CalendarUserRsvp.fromJson(json);
}

/// @nodoc
mixin _$CalendarUserRsvp {
  String? get response => throw _privateConstructorUsedError;
  @JsonKey(name: 'added_to_calendar')
  bool? get addedToCalendar => throw _privateConstructorUsedError;
  @JsonKey(name: 'responded_at')
  String? get respondedAt => throw _privateConstructorUsedError;

  /// Serializes this CalendarUserRsvp to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalendarUserRsvp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalendarUserRsvpCopyWith<CalendarUserRsvp> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarUserRsvpCopyWith<$Res> {
  factory $CalendarUserRsvpCopyWith(
          CalendarUserRsvp value, $Res Function(CalendarUserRsvp) then) =
      _$CalendarUserRsvpCopyWithImpl<$Res, CalendarUserRsvp>;
  @useResult
  $Res call(
      {String? response,
      @JsonKey(name: 'added_to_calendar') bool? addedToCalendar,
      @JsonKey(name: 'responded_at') String? respondedAt});
}

/// @nodoc
class _$CalendarUserRsvpCopyWithImpl<$Res, $Val extends CalendarUserRsvp>
    implements $CalendarUserRsvpCopyWith<$Res> {
  _$CalendarUserRsvpCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalendarUserRsvp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
    Object? addedToCalendar = freezed,
    Object? respondedAt = freezed,
  }) {
    return _then(_value.copyWith(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      addedToCalendar: freezed == addedToCalendar
          ? _value.addedToCalendar
          : addedToCalendar // ignore: cast_nullable_to_non_nullable
              as bool?,
      respondedAt: freezed == respondedAt
          ? _value.respondedAt
          : respondedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarUserRsvpImplCopyWith<$Res>
    implements $CalendarUserRsvpCopyWith<$Res> {
  factory _$$CalendarUserRsvpImplCopyWith(_$CalendarUserRsvpImpl value,
          $Res Function(_$CalendarUserRsvpImpl) then) =
      __$$CalendarUserRsvpImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? response,
      @JsonKey(name: 'added_to_calendar') bool? addedToCalendar,
      @JsonKey(name: 'responded_at') String? respondedAt});
}

/// @nodoc
class __$$CalendarUserRsvpImplCopyWithImpl<$Res>
    extends _$CalendarUserRsvpCopyWithImpl<$Res, _$CalendarUserRsvpImpl>
    implements _$$CalendarUserRsvpImplCopyWith<$Res> {
  __$$CalendarUserRsvpImplCopyWithImpl(_$CalendarUserRsvpImpl _value,
      $Res Function(_$CalendarUserRsvpImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarUserRsvp
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = freezed,
    Object? addedToCalendar = freezed,
    Object? respondedAt = freezed,
  }) {
    return _then(_$CalendarUserRsvpImpl(
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      addedToCalendar: freezed == addedToCalendar
          ? _value.addedToCalendar
          : addedToCalendar // ignore: cast_nullable_to_non_nullable
              as bool?,
      respondedAt: freezed == respondedAt
          ? _value.respondedAt
          : respondedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CalendarUserRsvpImpl implements _CalendarUserRsvp {
  const _$CalendarUserRsvpImpl(
      {this.response,
      @JsonKey(name: 'added_to_calendar') this.addedToCalendar,
      @JsonKey(name: 'responded_at') this.respondedAt});

  factory _$CalendarUserRsvpImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalendarUserRsvpImplFromJson(json);

  @override
  final String? response;
  @override
  @JsonKey(name: 'added_to_calendar')
  final bool? addedToCalendar;
  @override
  @JsonKey(name: 'responded_at')
  final String? respondedAt;

  @override
  String toString() {
    return 'CalendarUserRsvp(response: $response, addedToCalendar: $addedToCalendar, respondedAt: $respondedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarUserRsvpImpl &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.addedToCalendar, addedToCalendar) ||
                other.addedToCalendar == addedToCalendar) &&
            (identical(other.respondedAt, respondedAt) ||
                other.respondedAt == respondedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, response, addedToCalendar, respondedAt);

  /// Create a copy of CalendarUserRsvp
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarUserRsvpImplCopyWith<_$CalendarUserRsvpImpl> get copyWith =>
      __$$CalendarUserRsvpImplCopyWithImpl<_$CalendarUserRsvpImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalendarUserRsvpImplToJson(
      this,
    );
  }
}

abstract class _CalendarUserRsvp implements CalendarUserRsvp {
  const factory _CalendarUserRsvp(
          {final String? response,
          @JsonKey(name: 'added_to_calendar') final bool? addedToCalendar,
          @JsonKey(name: 'responded_at') final String? respondedAt}) =
      _$CalendarUserRsvpImpl;

  factory _CalendarUserRsvp.fromJson(Map<String, dynamic> json) =
      _$CalendarUserRsvpImpl.fromJson;

  @override
  String? get response;
  @override
  @JsonKey(name: 'added_to_calendar')
  bool? get addedToCalendar;
  @override
  @JsonKey(name: 'responded_at')
  String? get respondedAt;

  /// Create a copy of CalendarUserRsvp
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalendarUserRsvpImplCopyWith<_$CalendarUserRsvpImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
