// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rsvp_events_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RsvpEventsData _$RsvpEventsDataFromJson(Map<String, dynamic> json) {
  return _RsvpEventsData.fromJson(json);
}

/// @nodoc
mixin _$RsvpEventsData {
  String? get responseType => throw _privateConstructorUsedError;
  List<RsvpEventHistory>? get events => throw _privateConstructorUsedError;
  int? get count => throw _privateConstructorUsedError;

  /// Serializes this RsvpEventsData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RsvpEventsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RsvpEventsDataCopyWith<RsvpEventsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RsvpEventsDataCopyWith<$Res> {
  factory $RsvpEventsDataCopyWith(
          RsvpEventsData value, $Res Function(RsvpEventsData) then) =
      _$RsvpEventsDataCopyWithImpl<$Res, RsvpEventsData>;
  @useResult
  $Res call({String? responseType, List<RsvpEventHistory>? events, int? count});
}

/// @nodoc
class _$RsvpEventsDataCopyWithImpl<$Res, $Val extends RsvpEventsData>
    implements $RsvpEventsDataCopyWith<$Res> {
  _$RsvpEventsDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RsvpEventsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseType = freezed,
    Object? events = freezed,
    Object? count = freezed,
  }) {
    return _then(_value.copyWith(
      responseType: freezed == responseType
          ? _value.responseType
          : responseType // ignore: cast_nullable_to_non_nullable
              as String?,
      events: freezed == events
          ? _value.events
          : events // ignore: cast_nullable_to_non_nullable
              as List<RsvpEventHistory>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RsvpEventsDataImplCopyWith<$Res>
    implements $RsvpEventsDataCopyWith<$Res> {
  factory _$$RsvpEventsDataImplCopyWith(_$RsvpEventsDataImpl value,
          $Res Function(_$RsvpEventsDataImpl) then) =
      __$$RsvpEventsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? responseType, List<RsvpEventHistory>? events, int? count});
}

/// @nodoc
class __$$RsvpEventsDataImplCopyWithImpl<$Res>
    extends _$RsvpEventsDataCopyWithImpl<$Res, _$RsvpEventsDataImpl>
    implements _$$RsvpEventsDataImplCopyWith<$Res> {
  __$$RsvpEventsDataImplCopyWithImpl(
      _$RsvpEventsDataImpl _value, $Res Function(_$RsvpEventsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of RsvpEventsData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseType = freezed,
    Object? events = freezed,
    Object? count = freezed,
  }) {
    return _then(_$RsvpEventsDataImpl(
      responseType: freezed == responseType
          ? _value.responseType
          : responseType // ignore: cast_nullable_to_non_nullable
              as String?,
      events: freezed == events
          ? _value._events
          : events // ignore: cast_nullable_to_non_nullable
              as List<RsvpEventHistory>?,
      count: freezed == count
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$RsvpEventsDataImpl implements _RsvpEventsData {
  const _$RsvpEventsDataImpl(
      {this.responseType, final List<RsvpEventHistory>? events, this.count})
      : _events = events;

  factory _$RsvpEventsDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$RsvpEventsDataImplFromJson(json);

  @override
  final String? responseType;
  final List<RsvpEventHistory>? _events;
  @override
  List<RsvpEventHistory>? get events {
    final value = _events;
    if (value == null) return null;
    if (_events is EqualUnmodifiableListView) return _events;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int? count;

  @override
  String toString() {
    return 'RsvpEventsData(responseType: $responseType, events: $events, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RsvpEventsDataImpl &&
            (identical(other.responseType, responseType) ||
                other.responseType == responseType) &&
            const DeepCollectionEquality().equals(other._events, _events) &&
            (identical(other.count, count) || other.count == count));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, responseType,
      const DeepCollectionEquality().hash(_events), count);

  /// Create a copy of RsvpEventsData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RsvpEventsDataImplCopyWith<_$RsvpEventsDataImpl> get copyWith =>
      __$$RsvpEventsDataImplCopyWithImpl<_$RsvpEventsDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RsvpEventsDataImplToJson(
      this,
    );
  }
}

abstract class _RsvpEventsData implements RsvpEventsData {
  const factory _RsvpEventsData(
      {final String? responseType,
      final List<RsvpEventHistory>? events,
      final int? count}) = _$RsvpEventsDataImpl;

  factory _RsvpEventsData.fromJson(Map<String, dynamic> json) =
      _$RsvpEventsDataImpl.fromJson;

  @override
  String? get responseType;
  @override
  List<RsvpEventHistory>? get events;
  @override
  int? get count;

  /// Create a copy of RsvpEventsData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RsvpEventsDataImplCopyWith<_$RsvpEventsDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
