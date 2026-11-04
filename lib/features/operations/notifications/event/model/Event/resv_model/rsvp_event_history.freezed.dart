// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rsvp_event_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RsvpEventHistory _$RsvpEventHistoryFromJson(Map<String, dynamic> json) {
  return _RsvpEventHistory.fromJson(json);
}

/// @nodoc
mixin _$RsvpEventHistory {
  int? get rsvpId => throw _privateConstructorUsedError;
  String? get response => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  bool? get addedToCalendar => throw _privateConstructorUsedError;
  String? get respondedAt => throw _privateConstructorUsedError;
  EventInfo? get event => throw _privateConstructorUsedError;

  /// Serializes this RsvpEventHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RsvpEventHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RsvpEventHistoryCopyWith<RsvpEventHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RsvpEventHistoryCopyWith<$Res> {
  factory $RsvpEventHistoryCopyWith(
          RsvpEventHistory value, $Res Function(RsvpEventHistory) then) =
      _$RsvpEventHistoryCopyWithImpl<$Res, RsvpEventHistory>;
  @useResult
  $Res call(
      {int? rsvpId,
      String? response,
      String? note,
      bool? addedToCalendar,
      String? respondedAt,
      EventInfo? event});

  $EventInfoCopyWith<$Res>? get event;
}

/// @nodoc
class _$RsvpEventHistoryCopyWithImpl<$Res, $Val extends RsvpEventHistory>
    implements $RsvpEventHistoryCopyWith<$Res> {
  _$RsvpEventHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RsvpEventHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rsvpId = freezed,
    Object? response = freezed,
    Object? note = freezed,
    Object? addedToCalendar = freezed,
    Object? respondedAt = freezed,
    Object? event = freezed,
  }) {
    return _then(_value.copyWith(
      rsvpId: freezed == rsvpId
          ? _value.rsvpId
          : rsvpId // ignore: cast_nullable_to_non_nullable
              as int?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      addedToCalendar: freezed == addedToCalendar
          ? _value.addedToCalendar
          : addedToCalendar // ignore: cast_nullable_to_non_nullable
              as bool?,
      respondedAt: freezed == respondedAt
          ? _value.respondedAt
          : respondedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as EventInfo?,
    ) as $Val);
  }

  /// Create a copy of RsvpEventHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EventInfoCopyWith<$Res>? get event {
    if (_value.event == null) {
      return null;
    }

    return $EventInfoCopyWith<$Res>(_value.event!, (value) {
      return _then(_value.copyWith(event: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RsvpEventHistoryImplCopyWith<$Res>
    implements $RsvpEventHistoryCopyWith<$Res> {
  factory _$$RsvpEventHistoryImplCopyWith(_$RsvpEventHistoryImpl value,
          $Res Function(_$RsvpEventHistoryImpl) then) =
      __$$RsvpEventHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? rsvpId,
      String? response,
      String? note,
      bool? addedToCalendar,
      String? respondedAt,
      EventInfo? event});

  @override
  $EventInfoCopyWith<$Res>? get event;
}

/// @nodoc
class __$$RsvpEventHistoryImplCopyWithImpl<$Res>
    extends _$RsvpEventHistoryCopyWithImpl<$Res, _$RsvpEventHistoryImpl>
    implements _$$RsvpEventHistoryImplCopyWith<$Res> {
  __$$RsvpEventHistoryImplCopyWithImpl(_$RsvpEventHistoryImpl _value,
      $Res Function(_$RsvpEventHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of RsvpEventHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rsvpId = freezed,
    Object? response = freezed,
    Object? note = freezed,
    Object? addedToCalendar = freezed,
    Object? respondedAt = freezed,
    Object? event = freezed,
  }) {
    return _then(_$RsvpEventHistoryImpl(
      rsvpId: freezed == rsvpId
          ? _value.rsvpId
          : rsvpId // ignore: cast_nullable_to_non_nullable
              as int?,
      response: freezed == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      addedToCalendar: freezed == addedToCalendar
          ? _value.addedToCalendar
          : addedToCalendar // ignore: cast_nullable_to_non_nullable
              as bool?,
      respondedAt: freezed == respondedAt
          ? _value.respondedAt
          : respondedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      event: freezed == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as EventInfo?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$RsvpEventHistoryImpl implements _RsvpEventHistory {
  const _$RsvpEventHistoryImpl(
      {this.rsvpId,
      this.response,
      this.note,
      this.addedToCalendar,
      this.respondedAt,
      this.event});

  factory _$RsvpEventHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$RsvpEventHistoryImplFromJson(json);

  @override
  final int? rsvpId;
  @override
  final String? response;
  @override
  final String? note;
  @override
  final bool? addedToCalendar;
  @override
  final String? respondedAt;
  @override
  final EventInfo? event;

  @override
  String toString() {
    return 'RsvpEventHistory(rsvpId: $rsvpId, response: $response, note: $note, addedToCalendar: $addedToCalendar, respondedAt: $respondedAt, event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RsvpEventHistoryImpl &&
            (identical(other.rsvpId, rsvpId) || other.rsvpId == rsvpId) &&
            (identical(other.response, response) ||
                other.response == response) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.addedToCalendar, addedToCalendar) ||
                other.addedToCalendar == addedToCalendar) &&
            (identical(other.respondedAt, respondedAt) ||
                other.respondedAt == respondedAt) &&
            (identical(other.event, event) || other.event == event));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, rsvpId, response, note, addedToCalendar, respondedAt, event);

  /// Create a copy of RsvpEventHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RsvpEventHistoryImplCopyWith<_$RsvpEventHistoryImpl> get copyWith =>
      __$$RsvpEventHistoryImplCopyWithImpl<_$RsvpEventHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RsvpEventHistoryImplToJson(
      this,
    );
  }
}

abstract class _RsvpEventHistory implements RsvpEventHistory {
  const factory _RsvpEventHistory(
      {final int? rsvpId,
      final String? response,
      final String? note,
      final bool? addedToCalendar,
      final String? respondedAt,
      final EventInfo? event}) = _$RsvpEventHistoryImpl;

  factory _RsvpEventHistory.fromJson(Map<String, dynamic> json) =
      _$RsvpEventHistoryImpl.fromJson;

  @override
  int? get rsvpId;
  @override
  String? get response;
  @override
  String? get note;
  @override
  bool? get addedToCalendar;
  @override
  String? get respondedAt;
  @override
  EventInfo? get event;

  /// Create a copy of RsvpEventHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RsvpEventHistoryImplCopyWith<_$RsvpEventHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
