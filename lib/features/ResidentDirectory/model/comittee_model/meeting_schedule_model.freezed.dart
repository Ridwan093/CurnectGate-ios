// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meeting_schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MeetingSchedule _$MeetingScheduleFromJson(Map<String, dynamic> json) {
  return _MeetingSchedule.fromJson(json);
}

/// @nodoc
mixin _$MeetingSchedule {
  String? get day => throw _privateConstructorUsedError;
  String? get time => throw _privateConstructorUsedError;
  String? get frequency => throw _privateConstructorUsedError;

  /// Serializes this MeetingSchedule to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MeetingSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeetingScheduleCopyWith<MeetingSchedule> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeetingScheduleCopyWith<$Res> {
  factory $MeetingScheduleCopyWith(
          MeetingSchedule value, $Res Function(MeetingSchedule) then) =
      _$MeetingScheduleCopyWithImpl<$Res, MeetingSchedule>;
  @useResult
  $Res call({String? day, String? time, String? frequency});
}

/// @nodoc
class _$MeetingScheduleCopyWithImpl<$Res, $Val extends MeetingSchedule>
    implements $MeetingScheduleCopyWith<$Res> {
  _$MeetingScheduleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MeetingSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? time = freezed,
    Object? frequency = freezed,
  }) {
    return _then(_value.copyWith(
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MeetingScheduleImplCopyWith<$Res>
    implements $MeetingScheduleCopyWith<$Res> {
  factory _$$MeetingScheduleImplCopyWith(_$MeetingScheduleImpl value,
          $Res Function(_$MeetingScheduleImpl) then) =
      __$$MeetingScheduleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? day, String? time, String? frequency});
}

/// @nodoc
class __$$MeetingScheduleImplCopyWithImpl<$Res>
    extends _$MeetingScheduleCopyWithImpl<$Res, _$MeetingScheduleImpl>
    implements _$$MeetingScheduleImplCopyWith<$Res> {
  __$$MeetingScheduleImplCopyWithImpl(
      _$MeetingScheduleImpl _value, $Res Function(_$MeetingScheduleImpl) _then)
      : super(_value, _then);

  /// Create a copy of MeetingSchedule
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = freezed,
    Object? time = freezed,
    Object? frequency = freezed,
  }) {
    return _then(_$MeetingScheduleImpl(
      day: freezed == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as String?,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String?,
      frequency: freezed == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$MeetingScheduleImpl implements _MeetingSchedule {
  const _$MeetingScheduleImpl({this.day, this.time, this.frequency});

  factory _$MeetingScheduleImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeetingScheduleImplFromJson(json);

  @override
  final String? day;
  @override
  final String? time;
  @override
  final String? frequency;

  @override
  String toString() {
    return 'MeetingSchedule(day: $day, time: $time, frequency: $frequency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeetingScheduleImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, day, time, frequency);

  /// Create a copy of MeetingSchedule
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeetingScheduleImplCopyWith<_$MeetingScheduleImpl> get copyWith =>
      __$$MeetingScheduleImplCopyWithImpl<_$MeetingScheduleImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeetingScheduleImplToJson(
      this,
    );
  }
}

abstract class _MeetingSchedule implements MeetingSchedule {
  const factory _MeetingSchedule(
      {final String? day,
      final String? time,
      final String? frequency}) = _$MeetingScheduleImpl;

  factory _MeetingSchedule.fromJson(Map<String, dynamic> json) =
      _$MeetingScheduleImpl.fromJson;

  @override
  String? get day;
  @override
  String? get time;
  @override
  String? get frequency;

  /// Create a copy of MeetingSchedule
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeetingScheduleImplCopyWith<_$MeetingScheduleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
