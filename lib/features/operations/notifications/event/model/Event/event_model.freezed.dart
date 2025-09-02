// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Event _$EventFromJson(Map<String, dynamic> json) {
  return _Event.fromJson(json);
}

/// @nodoc
mixin _$Event {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get start => throw _privateConstructorUsedError;
  String? get end => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get venue => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  dynamic get userRsvp => throw _privateConstructorUsedError;
  bool? get addedToCalendar => throw _privateConstructorUsedError;
  bool? get canRsvp => throw _privateConstructorUsedError;
  RsvpCounts? get rsvpCounts => throw _privateConstructorUsedError;

  /// Serializes this Event to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventCopyWith<Event> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<$Res> {
  factory $EventCopyWith(Event value, $Res Function(Event) then) =
      _$EventCopyWithImpl<$Res, Event>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? start,
      String? end,
      String? location,
      String? venue,
      String? category,
      String? type,
      String? status,
      String? duration,
      dynamic userRsvp,
      bool? addedToCalendar,
      bool? canRsvp,
      RsvpCounts? rsvpCounts});

  $RsvpCountsCopyWith<$Res>? get rsvpCounts;
}

/// @nodoc
class _$EventCopyWithImpl<$Res, $Val extends Event>
    implements $EventCopyWith<$Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? location = freezed,
    Object? venue = freezed,
    Object? category = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? duration = freezed,
    Object? userRsvp = freezed,
    Object? addedToCalendar = freezed,
    Object? canRsvp = freezed,
    Object? rsvpCounts = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      userRsvp: freezed == userRsvp
          ? _value.userRsvp
          : userRsvp // ignore: cast_nullable_to_non_nullable
              as dynamic,
      addedToCalendar: freezed == addedToCalendar
          ? _value.addedToCalendar
          : addedToCalendar // ignore: cast_nullable_to_non_nullable
              as bool?,
      canRsvp: freezed == canRsvp
          ? _value.canRsvp
          : canRsvp // ignore: cast_nullable_to_non_nullable
              as bool?,
      rsvpCounts: freezed == rsvpCounts
          ? _value.rsvpCounts
          : rsvpCounts // ignore: cast_nullable_to_non_nullable
              as RsvpCounts?,
    ) as $Val);
  }

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RsvpCountsCopyWith<$Res>? get rsvpCounts {
    if (_value.rsvpCounts == null) {
      return null;
    }

    return $RsvpCountsCopyWith<$Res>(_value.rsvpCounts!, (value) {
      return _then(_value.copyWith(rsvpCounts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EventImplCopyWith<$Res> implements $EventCopyWith<$Res> {
  factory _$$EventImplCopyWith(
          _$EventImpl value, $Res Function(_$EventImpl) then) =
      __$$EventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? start,
      String? end,
      String? location,
      String? venue,
      String? category,
      String? type,
      String? status,
      String? duration,
      dynamic userRsvp,
      bool? addedToCalendar,
      bool? canRsvp,
      RsvpCounts? rsvpCounts});

  @override
  $RsvpCountsCopyWith<$Res>? get rsvpCounts;
}

/// @nodoc
class __$$EventImplCopyWithImpl<$Res>
    extends _$EventCopyWithImpl<$Res, _$EventImpl>
    implements _$$EventImplCopyWith<$Res> {
  __$$EventImplCopyWithImpl(
      _$EventImpl _value, $Res Function(_$EventImpl) _then)
      : super(_value, _then);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? start = freezed,
    Object? end = freezed,
    Object? location = freezed,
    Object? venue = freezed,
    Object? category = freezed,
    Object? type = freezed,
    Object? status = freezed,
    Object? duration = freezed,
    Object? userRsvp = freezed,
    Object? addedToCalendar = freezed,
    Object? canRsvp = freezed,
    Object? rsvpCounts = freezed,
  }) {
    return _then(_$EventImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      userRsvp: freezed == userRsvp
          ? _value.userRsvp
          : userRsvp // ignore: cast_nullable_to_non_nullable
              as dynamic,
      addedToCalendar: freezed == addedToCalendar
          ? _value.addedToCalendar
          : addedToCalendar // ignore: cast_nullable_to_non_nullable
              as bool?,
      canRsvp: freezed == canRsvp
          ? _value.canRsvp
          : canRsvp // ignore: cast_nullable_to_non_nullable
              as bool?,
      rsvpCounts: freezed == rsvpCounts
          ? _value.rsvpCounts
          : rsvpCounts // ignore: cast_nullable_to_non_nullable
              as RsvpCounts?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$EventImpl implements _Event {
  const _$EventImpl(
      {this.id,
      this.title,
      this.start,
      this.end,
      this.location,
      this.venue,
      this.category,
      this.type,
      this.status,
      this.duration,
      this.userRsvp,
      this.addedToCalendar,
      this.canRsvp,
      this.rsvpCounts});

  factory _$EventImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? start;
  @override
  final String? end;
  @override
  final String? location;
  @override
  final String? venue;
  @override
  final String? category;
  @override
  final String? type;
  @override
  final String? status;
  @override
  final String? duration;
  @override
  final dynamic userRsvp;
  @override
  final bool? addedToCalendar;
  @override
  final bool? canRsvp;
  @override
  final RsvpCounts? rsvpCounts;

  @override
  String toString() {
    return 'Event(id: $id, title: $title, start: $start, end: $end, location: $location, venue: $venue, category: $category, type: $type, status: $status, duration: $duration, userRsvp: $userRsvp, addedToCalendar: $addedToCalendar, canRsvp: $canRsvp, rsvpCounts: $rsvpCounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.venue, venue) || other.venue == venue) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            const DeepCollectionEquality().equals(other.userRsvp, userRsvp) &&
            (identical(other.addedToCalendar, addedToCalendar) ||
                other.addedToCalendar == addedToCalendar) &&
            (identical(other.canRsvp, canRsvp) || other.canRsvp == canRsvp) &&
            (identical(other.rsvpCounts, rsvpCounts) ||
                other.rsvpCounts == rsvpCounts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      start,
      end,
      location,
      venue,
      category,
      type,
      status,
      duration,
      const DeepCollectionEquality().hash(userRsvp),
      addedToCalendar,
      canRsvp,
      rsvpCounts);

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      __$$EventImplCopyWithImpl<_$EventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventImplToJson(
      this,
    );
  }
}

abstract class _Event implements Event {
  const factory _Event(
      {final int? id,
      final String? title,
      final String? start,
      final String? end,
      final String? location,
      final String? venue,
      final String? category,
      final String? type,
      final String? status,
      final String? duration,
      final dynamic userRsvp,
      final bool? addedToCalendar,
      final bool? canRsvp,
      final RsvpCounts? rsvpCounts}) = _$EventImpl;

  factory _Event.fromJson(Map<String, dynamic> json) = _$EventImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get start;
  @override
  String? get end;
  @override
  String? get location;
  @override
  String? get venue;
  @override
  String? get category;
  @override
  String? get type;
  @override
  String? get status;
  @override
  String? get duration;
  @override
  dynamic get userRsvp;
  @override
  bool? get addedToCalendar;
  @override
  bool? get canRsvp;
  @override
  RsvpCounts? get rsvpCounts;

  /// Create a copy of Event
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventImplCopyWith<_$EventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
