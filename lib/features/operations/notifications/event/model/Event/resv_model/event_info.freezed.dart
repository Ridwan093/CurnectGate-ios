// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventInfo _$EventInfoFromJson(Map<String, dynamic> json) {
  return _EventInfo.fromJson(json);
}

/// @nodoc
mixin _$EventInfo {
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
  String? get hostedBy => throw _privateConstructorUsedError;
  String? get eventImageUrl => throw _privateConstructorUsedError;
  bool? get isUpcoming => throw _privateConstructorUsedError;
  bool? get isToday => throw _privateConstructorUsedError;
  RsvpCounts? get rsvpCounts => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this EventInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventInfoCopyWith<EventInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventInfoCopyWith<$Res> {
  factory $EventInfoCopyWith(EventInfo value, $Res Function(EventInfo) then) =
      _$EventInfoCopyWithImpl<$Res, EventInfo>;
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
      String? hostedBy,
      String? eventImageUrl,
      bool? isUpcoming,
      bool? isToday,
      RsvpCounts? rsvpCounts,
      String? createdAt});

  $RsvpCountsCopyWith<$Res>? get rsvpCounts;
}

/// @nodoc
class _$EventInfoCopyWithImpl<$Res, $Val extends EventInfo>
    implements $EventInfoCopyWith<$Res> {
  _$EventInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventInfo
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
    Object? hostedBy = freezed,
    Object? eventImageUrl = freezed,
    Object? isUpcoming = freezed,
    Object? isToday = freezed,
    Object? rsvpCounts = freezed,
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
      hostedBy: freezed == hostedBy
          ? _value.hostedBy
          : hostedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      eventImageUrl: freezed == eventImageUrl
          ? _value.eventImageUrl
          : eventImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isUpcoming: freezed == isUpcoming
          ? _value.isUpcoming
          : isUpcoming // ignore: cast_nullable_to_non_nullable
              as bool?,
      isToday: freezed == isToday
          ? _value.isToday
          : isToday // ignore: cast_nullable_to_non_nullable
              as bool?,
      rsvpCounts: freezed == rsvpCounts
          ? _value.rsvpCounts
          : rsvpCounts // ignore: cast_nullable_to_non_nullable
              as RsvpCounts?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of EventInfo
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
abstract class _$$EventInfoImplCopyWith<$Res>
    implements $EventInfoCopyWith<$Res> {
  factory _$$EventInfoImplCopyWith(
          _$EventInfoImpl value, $Res Function(_$EventInfoImpl) then) =
      __$$EventInfoImplCopyWithImpl<$Res>;
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
      String? hostedBy,
      String? eventImageUrl,
      bool? isUpcoming,
      bool? isToday,
      RsvpCounts? rsvpCounts,
      String? createdAt});

  @override
  $RsvpCountsCopyWith<$Res>? get rsvpCounts;
}

/// @nodoc
class __$$EventInfoImplCopyWithImpl<$Res>
    extends _$EventInfoCopyWithImpl<$Res, _$EventInfoImpl>
    implements _$$EventInfoImplCopyWith<$Res> {
  __$$EventInfoImplCopyWithImpl(
      _$EventInfoImpl _value, $Res Function(_$EventInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventInfo
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
    Object? hostedBy = freezed,
    Object? eventImageUrl = freezed,
    Object? isUpcoming = freezed,
    Object? isToday = freezed,
    Object? rsvpCounts = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$EventInfoImpl(
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
      hostedBy: freezed == hostedBy
          ? _value.hostedBy
          : hostedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      eventImageUrl: freezed == eventImageUrl
          ? _value.eventImageUrl
          : eventImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isUpcoming: freezed == isUpcoming
          ? _value.isUpcoming
          : isUpcoming // ignore: cast_nullable_to_non_nullable
              as bool?,
      isToday: freezed == isToday
          ? _value.isToday
          : isToday // ignore: cast_nullable_to_non_nullable
              as bool?,
      rsvpCounts: freezed == rsvpCounts
          ? _value.rsvpCounts
          : rsvpCounts // ignore: cast_nullable_to_non_nullable
              as RsvpCounts?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$EventInfoImpl implements _EventInfo {
  const _$EventInfoImpl(
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
      this.hostedBy,
      this.eventImageUrl,
      this.isUpcoming,
      this.isToday,
      this.rsvpCounts,
      this.createdAt});

  factory _$EventInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventInfoImplFromJson(json);

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
  final String? hostedBy;
  @override
  final String? eventImageUrl;
  @override
  final bool? isUpcoming;
  @override
  final bool? isToday;
  @override
  final RsvpCounts? rsvpCounts;
  @override
  final String? createdAt;

  @override
  String toString() {
    return 'EventInfo(id: $id, title: $title, description: $description, eventDescriptionFromHost: $eventDescriptionFromHost, startDatetime: $startDatetime, endDatetime: $endDatetime, location: $location, venue: $venue, duration: $duration, eventType: $eventType, category: $category, status: $status, hostedBy: $hostedBy, eventImageUrl: $eventImageUrl, isUpcoming: $isUpcoming, isToday: $isToday, rsvpCounts: $rsvpCounts, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventInfoImpl &&
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
            (identical(other.hostedBy, hostedBy) ||
                other.hostedBy == hostedBy) &&
            (identical(other.eventImageUrl, eventImageUrl) ||
                other.eventImageUrl == eventImageUrl) &&
            (identical(other.isUpcoming, isUpcoming) ||
                other.isUpcoming == isUpcoming) &&
            (identical(other.isToday, isToday) || other.isToday == isToday) &&
            (identical(other.rsvpCounts, rsvpCounts) ||
                other.rsvpCounts == rsvpCounts) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
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
      hostedBy,
      eventImageUrl,
      isUpcoming,
      isToday,
      rsvpCounts,
      createdAt);

  /// Create a copy of EventInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventInfoImplCopyWith<_$EventInfoImpl> get copyWith =>
      __$$EventInfoImplCopyWithImpl<_$EventInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventInfoImplToJson(
      this,
    );
  }
}

abstract class _EventInfo implements EventInfo {
  const factory _EventInfo(
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
      final String? hostedBy,
      final String? eventImageUrl,
      final bool? isUpcoming,
      final bool? isToday,
      final RsvpCounts? rsvpCounts,
      final String? createdAt}) = _$EventInfoImpl;

  factory _EventInfo.fromJson(Map<String, dynamic> json) =
      _$EventInfoImpl.fromJson;

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
  String? get hostedBy;
  @override
  String? get eventImageUrl;
  @override
  bool? get isUpcoming;
  @override
  bool? get isToday;
  @override
  RsvpCounts? get rsvpCounts;
  @override
  String? get createdAt;

  /// Create a copy of EventInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventInfoImplCopyWith<_$EventInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
