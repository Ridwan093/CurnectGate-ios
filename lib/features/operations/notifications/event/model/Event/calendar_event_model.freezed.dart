// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_event_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalendarEvent _$CalendarEventFromJson(Map<String, dynamic> json) {
  return _CalendarEvent.fromJson(json);
}

/// @nodoc
mixin _$CalendarEvent {
  int? get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get eventDescriptionFromHost => throw _privateConstructorUsedError;
  String? get startDatetime => throw _privateConstructorUsedError;
  String? get endDatetime => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get venue => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  String? get eventType => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get createdBy => throw _privateConstructorUsedError;
  bool? get requiresRsvp => throw _privateConstructorUsedError;
  int? get maxAttendees => throw _privateConstructorUsedError;
  CalendarRsvpCounts? get rsvpCounts => throw _privateConstructorUsedError;
  CalendarUserRsvp? get userRsvp => throw _privateConstructorUsedError;
  bool? get canRsvp => throw _privateConstructorUsedError;
  bool? get isUpcoming => throw _privateConstructorUsedError;
  bool? get isToday => throw _privateConstructorUsedError;
  String? get eventImageUrl => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this CalendarEvent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalendarEventCopyWith<CalendarEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarEventCopyWith<$Res> {
  factory $CalendarEventCopyWith(
          CalendarEvent value, $Res Function(CalendarEvent) then) =
      _$CalendarEventCopyWithImpl<$Res, CalendarEvent>;
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      String? eventDescriptionFromHost,
      String? startDatetime,
      String? endDatetime,
      String? location,
      String? venue,
      String? duration,
      String? eventType,
      String? category,
      String? status,
      String? createdBy,
      bool? requiresRsvp,
      int? maxAttendees,
      CalendarRsvpCounts? rsvpCounts,
      CalendarUserRsvp? userRsvp,
      bool? canRsvp,
      bool? isUpcoming,
      bool? isToday,
      String? eventImageUrl,
      String? createdAt});

  $CalendarRsvpCountsCopyWith<$Res>? get rsvpCounts;
  $CalendarUserRsvpCopyWith<$Res>? get userRsvp;
}

/// @nodoc
class _$CalendarEventCopyWithImpl<$Res, $Val extends CalendarEvent>
    implements $CalendarEventCopyWith<$Res> {
  _$CalendarEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? eventDescriptionFromHost = freezed,
    Object? startDatetime = freezed,
    Object? endDatetime = freezed,
    Object? location = freezed,
    Object? venue = freezed,
    Object? duration = freezed,
    Object? eventType = freezed,
    Object? category = freezed,
    Object? status = freezed,
    Object? createdBy = freezed,
    Object? requiresRsvp = freezed,
    Object? maxAttendees = freezed,
    Object? rsvpCounts = freezed,
    Object? userRsvp = freezed,
    Object? canRsvp = freezed,
    Object? isUpcoming = freezed,
    Object? isToday = freezed,
    Object? eventImageUrl = freezed,
    Object? createdAt = freezed,
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
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDescriptionFromHost: freezed == eventDescriptionFromHost
          ? _value.eventDescriptionFromHost
          : eventDescriptionFromHost // ignore: cast_nullable_to_non_nullable
              as String?,
      startDatetime: freezed == startDatetime
          ? _value.startDatetime
          : startDatetime // ignore: cast_nullable_to_non_nullable
              as String?,
      endDatetime: freezed == endDatetime
          ? _value.endDatetime
          : endDatetime // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      eventType: freezed == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      requiresRsvp: freezed == requiresRsvp
          ? _value.requiresRsvp
          : requiresRsvp // ignore: cast_nullable_to_non_nullable
              as bool?,
      maxAttendees: freezed == maxAttendees
          ? _value.maxAttendees
          : maxAttendees // ignore: cast_nullable_to_non_nullable
              as int?,
      rsvpCounts: freezed == rsvpCounts
          ? _value.rsvpCounts
          : rsvpCounts // ignore: cast_nullable_to_non_nullable
              as CalendarRsvpCounts?,
      userRsvp: freezed == userRsvp
          ? _value.userRsvp
          : userRsvp // ignore: cast_nullable_to_non_nullable
              as CalendarUserRsvp?,
      canRsvp: freezed == canRsvp
          ? _value.canRsvp
          : canRsvp // ignore: cast_nullable_to_non_nullable
              as bool?,
      isUpcoming: freezed == isUpcoming
          ? _value.isUpcoming
          : isUpcoming // ignore: cast_nullable_to_non_nullable
              as bool?,
      isToday: freezed == isToday
          ? _value.isToday
          : isToday // ignore: cast_nullable_to_non_nullable
              as bool?,
      eventImageUrl: freezed == eventImageUrl
          ? _value.eventImageUrl
          : eventImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalendarRsvpCountsCopyWith<$Res>? get rsvpCounts {
    if (_value.rsvpCounts == null) {
      return null;
    }

    return $CalendarRsvpCountsCopyWith<$Res>(_value.rsvpCounts!, (value) {
      return _then(_value.copyWith(rsvpCounts: value) as $Val);
    });
  }

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalendarUserRsvpCopyWith<$Res>? get userRsvp {
    if (_value.userRsvp == null) {
      return null;
    }

    return $CalendarUserRsvpCopyWith<$Res>(_value.userRsvp!, (value) {
      return _then(_value.copyWith(userRsvp: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CalendarEventImplCopyWith<$Res>
    implements $CalendarEventCopyWith<$Res> {
  factory _$$CalendarEventImplCopyWith(
          _$CalendarEventImpl value, $Res Function(_$CalendarEventImpl) then) =
      __$$CalendarEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? title,
      String? description,
      String? eventDescriptionFromHost,
      String? startDatetime,
      String? endDatetime,
      String? location,
      String? venue,
      String? duration,
      String? eventType,
      String? category,
      String? status,
      String? createdBy,
      bool? requiresRsvp,
      int? maxAttendees,
      CalendarRsvpCounts? rsvpCounts,
      CalendarUserRsvp? userRsvp,
      bool? canRsvp,
      bool? isUpcoming,
      bool? isToday,
      String? eventImageUrl,
      String? createdAt});

  @override
  $CalendarRsvpCountsCopyWith<$Res>? get rsvpCounts;
  @override
  $CalendarUserRsvpCopyWith<$Res>? get userRsvp;
}

/// @nodoc
class __$$CalendarEventImplCopyWithImpl<$Res>
    extends _$CalendarEventCopyWithImpl<$Res, _$CalendarEventImpl>
    implements _$$CalendarEventImplCopyWith<$Res> {
  __$$CalendarEventImplCopyWithImpl(
      _$CalendarEventImpl _value, $Res Function(_$CalendarEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? eventDescriptionFromHost = freezed,
    Object? startDatetime = freezed,
    Object? endDatetime = freezed,
    Object? location = freezed,
    Object? venue = freezed,
    Object? duration = freezed,
    Object? eventType = freezed,
    Object? category = freezed,
    Object? status = freezed,
    Object? createdBy = freezed,
    Object? requiresRsvp = freezed,
    Object? maxAttendees = freezed,
    Object? rsvpCounts = freezed,
    Object? userRsvp = freezed,
    Object? canRsvp = freezed,
    Object? isUpcoming = freezed,
    Object? isToday = freezed,
    Object? eventImageUrl = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$CalendarEventImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      eventDescriptionFromHost: freezed == eventDescriptionFromHost
          ? _value.eventDescriptionFromHost
          : eventDescriptionFromHost // ignore: cast_nullable_to_non_nullable
              as String?,
      startDatetime: freezed == startDatetime
          ? _value.startDatetime
          : startDatetime // ignore: cast_nullable_to_non_nullable
              as String?,
      endDatetime: freezed == endDatetime
          ? _value.endDatetime
          : endDatetime // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      venue: freezed == venue
          ? _value.venue
          : venue // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      eventType: freezed == eventType
          ? _value.eventType
          : eventType // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as String?,
      requiresRsvp: freezed == requiresRsvp
          ? _value.requiresRsvp
          : requiresRsvp // ignore: cast_nullable_to_non_nullable
              as bool?,
      maxAttendees: freezed == maxAttendees
          ? _value.maxAttendees
          : maxAttendees // ignore: cast_nullable_to_non_nullable
              as int?,
      rsvpCounts: freezed == rsvpCounts
          ? _value.rsvpCounts
          : rsvpCounts // ignore: cast_nullable_to_non_nullable
              as CalendarRsvpCounts?,
      userRsvp: freezed == userRsvp
          ? _value.userRsvp
          : userRsvp // ignore: cast_nullable_to_non_nullable
              as CalendarUserRsvp?,
      canRsvp: freezed == canRsvp
          ? _value.canRsvp
          : canRsvp // ignore: cast_nullable_to_non_nullable
              as bool?,
      isUpcoming: freezed == isUpcoming
          ? _value.isUpcoming
          : isUpcoming // ignore: cast_nullable_to_non_nullable
              as bool?,
      isToday: freezed == isToday
          ? _value.isToday
          : isToday // ignore: cast_nullable_to_non_nullable
              as bool?,
      eventImageUrl: freezed == eventImageUrl
          ? _value.eventImageUrl
          : eventImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CalendarEventImpl implements _CalendarEvent {
  const _$CalendarEventImpl(
      {this.id,
      this.title,
      this.description,
      this.eventDescriptionFromHost,
      this.startDatetime,
      this.endDatetime,
      this.location,
      this.venue,
      this.duration,
      this.eventType,
      this.category,
      this.status,
      this.createdBy,
      this.requiresRsvp,
      this.maxAttendees,
      this.rsvpCounts,
      this.userRsvp,
      this.canRsvp,
      this.isUpcoming,
      this.isToday,
      this.eventImageUrl,
      this.createdAt});

  factory _$CalendarEventImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalendarEventImplFromJson(json);

  @override
  final int? id;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? eventDescriptionFromHost;
  @override
  final String? startDatetime;
  @override
  final String? endDatetime;
  @override
  final String? location;
  @override
  final String? venue;
  @override
  final String? duration;
  @override
  final String? eventType;
  @override
  final String? category;
  @override
  final String? status;
  @override
  final String? createdBy;
  @override
  final bool? requiresRsvp;
  @override
  final int? maxAttendees;
  @override
  final CalendarRsvpCounts? rsvpCounts;
  @override
  final CalendarUserRsvp? userRsvp;
  @override
  final bool? canRsvp;
  @override
  final bool? isUpcoming;
  @override
  final bool? isToday;
  @override
  final String? eventImageUrl;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'CalendarEvent(id: $id, title: $title, description: $description, eventDescriptionFromHost: $eventDescriptionFromHost, startDatetime: $startDatetime, endDatetime: $endDatetime, location: $location, venue: $venue, duration: $duration, eventType: $eventType, category: $category, status: $status, createdBy: $createdBy, requiresRsvp: $requiresRsvp, maxAttendees: $maxAttendees, rsvpCounts: $rsvpCounts, userRsvp: $userRsvp, canRsvp: $canRsvp, isUpcoming: $isUpcoming, isToday: $isToday, eventImageUrl: $eventImageUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarEventImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(
                    other.eventDescriptionFromHost, eventDescriptionFromHost) ||
                other.eventDescriptionFromHost == eventDescriptionFromHost) &&
            (identical(other.startDatetime, startDatetime) ||
                other.startDatetime == startDatetime) &&
            (identical(other.endDatetime, endDatetime) ||
                other.endDatetime == endDatetime) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.venue, venue) || other.venue == venue) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.eventType, eventType) ||
                other.eventType == eventType) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.requiresRsvp, requiresRsvp) ||
                other.requiresRsvp == requiresRsvp) &&
            (identical(other.maxAttendees, maxAttendees) ||
                other.maxAttendees == maxAttendees) &&
            (identical(other.rsvpCounts, rsvpCounts) ||
                other.rsvpCounts == rsvpCounts) &&
            (identical(other.userRsvp, userRsvp) ||
                other.userRsvp == userRsvp) &&
            (identical(other.canRsvp, canRsvp) || other.canRsvp == canRsvp) &&
            (identical(other.isUpcoming, isUpcoming) ||
                other.isUpcoming == isUpcoming) &&
            (identical(other.isToday, isToday) || other.isToday == isToday) &&
            (identical(other.eventImageUrl, eventImageUrl) ||
                other.eventImageUrl == eventImageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        title,
        description,
        eventDescriptionFromHost,
        startDatetime,
        endDatetime,
        location,
        venue,
        duration,
        eventType,
        category,
        status,
        createdBy,
        requiresRsvp,
        maxAttendees,
        rsvpCounts,
        userRsvp,
        canRsvp,
        isUpcoming,
        isToday,
        eventImageUrl,
        createdAt
      ]);

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarEventImplCopyWith<_$CalendarEventImpl> get copyWith =>
      __$$CalendarEventImplCopyWithImpl<_$CalendarEventImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalendarEventImplToJson(
      this,
    );
  }
}

abstract class _CalendarEvent implements CalendarEvent {
  const factory _CalendarEvent(
      {final int? id,
      final String? title,
      final String? description,
      final String? eventDescriptionFromHost,
      final String? startDatetime,
      final String? endDatetime,
      final String? location,
      final String? venue,
      final String? duration,
      final String? eventType,
      final String? category,
      final String? status,
      final String? createdBy,
      final bool? requiresRsvp,
      final int? maxAttendees,
      final CalendarRsvpCounts? rsvpCounts,
      final CalendarUserRsvp? userRsvp,
      final bool? canRsvp,
      final bool? isUpcoming,
      final bool? isToday,
      final String? eventImageUrl,
      final String? createdAt}) = _$CalendarEventImpl;

  factory _CalendarEvent.fromJson(Map<String, dynamic> json) =
      _$CalendarEventImpl.fromJson;

  @override
  int? get id;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get eventDescriptionFromHost;
  @override
  String? get startDatetime;
  @override
  String? get endDatetime;
  @override
  String? get location;
  @override
  String? get venue;
  @override
  String? get duration;
  @override
  String? get eventType;
  @override
  String? get category;
  @override
  String? get status;
  @override
  String? get createdBy;
  @override
  bool? get requiresRsvp;
  @override
  int? get maxAttendees;
  @override
  CalendarRsvpCounts? get rsvpCounts;
  @override
  CalendarUserRsvp? get userRsvp;
  @override
  bool? get canRsvp;
  @override
  bool? get isUpcoming;
  @override
  bool? get isToday;
  @override
  String? get eventImageUrl;
  @override
  String? get createdAt;

  /// Create a copy of CalendarEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalendarEventImplCopyWith<_$CalendarEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
