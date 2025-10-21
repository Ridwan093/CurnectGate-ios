// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventsData _$EventsDataFromJson(Map<String, dynamic> json) {
  return _CalendarEventsData.fromJson(json);
}

/// @nodoc
mixin _$EventsData {
  List<Event>? get events => throw _privateConstructorUsedError;
  CalendarPeriod? get period => throw _privateConstructorUsedError;

  /// Serializes this EventsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventsDataCopyWith<EventsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventsDataCopyWith<$Res> {
  factory $EventsDataCopyWith(
          EventsData value, $Res Function(EventsData) then) =
      _$EventsDataCopyWithImpl<$Res, EventsData>;
  @useResult
  $Res call({List<Event>? events, CalendarPeriod? period});

  $CalendarPeriodCopyWith<$Res>? get period;
}

/// @nodoc
class _$EventsDataCopyWithImpl<$Res, $Val extends EventsData>
    implements $EventsDataCopyWith<$Res> {
  _$EventsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = freezed,
    Object? period = freezed,
  }) {
    return _then(_value.copyWith(
      events: freezed == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as CalendarPeriod?,
    ) as $Val);
  }

  /// Create a copy of EventsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalendarPeriodCopyWith<$Res>? get period {
    if (_value.period == null) {
      return null;
    }

    return $CalendarPeriodCopyWith<$Res>(_value.period!, (value) {
      return _then(_value.copyWith(period: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CalendarEventsDataImplCopyWith<$Res>
    implements $EventsDataCopyWith<$Res> {
  factory _$$CalendarEventsDataImplCopyWith(_$CalendarEventsDataImpl value,
          $Res Function(_$CalendarEventsDataImpl) then) =
      __$$CalendarEventsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Event>? events, CalendarPeriod? period});

  @override
  $CalendarPeriodCopyWith<$Res>? get period;
}

/// @nodoc
class __$$CalendarEventsDataImplCopyWithImpl<$Res>
    extends _$EventsDataCopyWithImpl<$Res, _$CalendarEventsDataImpl>
    implements _$$CalendarEventsDataImplCopyWith<$Res> {
  __$$CalendarEventsDataImplCopyWithImpl(_$CalendarEventsDataImpl _value,
      $Res Function(_$CalendarEventsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? events = freezed,
    Object? period = freezed,
  }) {
    return _then(_$CalendarEventsDataImpl(
      events: freezed == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<Event>?,
      period: freezed == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as CalendarPeriod?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$CalendarEventsDataImpl implements _CalendarEventsData {
  const _$CalendarEventsDataImpl({final List<Event>? events, this.period})
      : _events = events;

  factory _$CalendarEventsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalendarEventsDataImplFromJson(json);

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
  final CalendarPeriod? period;

  @override
  String toString() {
    return 'EventsData(events: $events, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarEventsDataImpl &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_events), period);

  /// Create a copy of EventsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarEventsDataImplCopyWith<_$CalendarEventsDataImpl> get copyWith =>
      __$$CalendarEventsDataImplCopyWithImpl<_$CalendarEventsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalendarEventsDataImplToJson(
      this,
    );
  }
}

abstract class _CalendarEventsData implements EventsData {
  const factory _CalendarEventsData(
      {final List<Event>? events,
      final CalendarPeriod? period}) = _$CalendarEventsDataImpl;

  factory _CalendarEventsData.fromJson(Map<String, dynamic> json) =
      _$CalendarEventsDataImpl.fromJson;

  @override
  List<Event>? get events;
  @override
  CalendarPeriod? get period;

  /// Create a copy of EventsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalendarEventsDataImplCopyWith<_$CalendarEventsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
