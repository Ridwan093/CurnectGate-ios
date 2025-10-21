// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event_codes_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EventCodesData _$EventCodesDataFromJson(Map<String, dynamic> json) {
  return _EventCodesData.fromJson(json);
}

/// @nodoc
mixin _$EventCodesData {
  int? get total => throw _privateConstructorUsedError;
  int? get active => throw _privateConstructorUsedError;
  int? get pending => throw _privateConstructorUsedError;
  int? get expired => throw _privateConstructorUsedError;
  int? get revoked => throw _privateConstructorUsedError;
  List<EventCode>? get eventCodes => throw _privateConstructorUsedError;

  /// Serializes this EventCodesData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EventCodesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EventCodesDataCopyWith<EventCodesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCodesDataCopyWith<$Res> {
  factory $EventCodesDataCopyWith(
          EventCodesData value, $Res Function(EventCodesData) then) =
      _$EventCodesDataCopyWithImpl<$Res, EventCodesData>;
  @useResult
  $Res call(
      {int? total,
      int? active,
      int? pending,
      int? expired,
      int? revoked,
      List<EventCode>? eventCodes});
}

/// @nodoc
class _$EventCodesDataCopyWithImpl<$Res, $Val extends EventCodesData>
    implements $EventCodesDataCopyWith<$Res> {
  _$EventCodesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EventCodesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? active = freezed,
    Object? pending = freezed,
    Object? expired = freezed,
    Object? revoked = freezed,
    Object? eventCodes = freezed,
  }) {
    return _then(_value.copyWith(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int?,
      pending: freezed == pending
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as int?,
      expired: freezed == expired
          ? _value.expired
          : expired // ignore: cast_nullable_to_non_nullable
              as int?,
      revoked: freezed == revoked
          ? _value.revoked
          : revoked // ignore: cast_nullable_to_non_nullable
              as int?,
      eventCodes: freezed == eventCodes
          ? _value.eventCodes
          : eventCodes // ignore: cast_nullable_to_non_nullable
              as List<EventCode>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventCodesDataImplCopyWith<$Res>
    implements $EventCodesDataCopyWith<$Res> {
  factory _$$EventCodesDataImplCopyWith(_$EventCodesDataImpl value,
          $Res Function(_$EventCodesDataImpl) then) =
      __$$EventCodesDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? total,
      int? active,
      int? pending,
      int? expired,
      int? revoked,
      List<EventCode>? eventCodes});
}

/// @nodoc
class __$$EventCodesDataImplCopyWithImpl<$Res>
    extends _$EventCodesDataCopyWithImpl<$Res, _$EventCodesDataImpl>
    implements _$$EventCodesDataImplCopyWith<$Res> {
  __$$EventCodesDataImplCopyWithImpl(
      _$EventCodesDataImpl _value, $Res Function(_$EventCodesDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of EventCodesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = freezed,
    Object? active = freezed,
    Object? pending = freezed,
    Object? expired = freezed,
    Object? revoked = freezed,
    Object? eventCodes = freezed,
  }) {
    return _then(_$EventCodesDataImpl(
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int?,
      active: freezed == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as int?,
      pending: freezed == pending
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as int?,
      expired: freezed == expired
          ? _value.expired
          : expired // ignore: cast_nullable_to_non_nullable
              as int?,
      revoked: freezed == revoked
          ? _value.revoked
          : revoked // ignore: cast_nullable_to_non_nullable
              as int?,
      eventCodes: freezed == eventCodes
          ? _value._eventCodes
          : eventCodes // ignore: cast_nullable_to_non_nullable
              as List<EventCode>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$EventCodesDataImpl implements _EventCodesData {
  const _$EventCodesDataImpl(
      {this.total,
      this.active,
      this.pending,
      this.expired,
      this.revoked,
      final List<EventCode>? eventCodes})
      : _eventCodes = eventCodes;

  factory _$EventCodesDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$EventCodesDataImplFromJson(json);

  @override
  final int? total;
  @override
  final int? active;
  @override
  final int? pending;
  @override
  final int? expired;
  @override
  final int? revoked;
  final List<EventCode>? _eventCodes;
  @override
  List<EventCode>? get eventCodes {
    final value = _eventCodes;
    if (value == null) return null;
    if (_eventCodes is EqualUnmodifiableListView) return _eventCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'EventCodesData(total: $total, active: $active, pending: $pending, expired: $expired, revoked: $revoked, eventCodes: $eventCodes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventCodesDataImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.active, active) || other.active == active) &&
            (identical(other.pending, pending) || other.pending == pending) &&
            (identical(other.expired, expired) || other.expired == expired) &&
            (identical(other.revoked, revoked) || other.revoked == revoked) &&
            const DeepCollectionEquality()
                .equals(other._eventCodes, _eventCodes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, active, pending, expired,
      revoked, const DeepCollectionEquality().hash(_eventCodes));

  /// Create a copy of EventCodesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventCodesDataImplCopyWith<_$EventCodesDataImpl> get copyWith =>
      __$$EventCodesDataImplCopyWithImpl<_$EventCodesDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EventCodesDataImplToJson(
      this,
    );
  }
}

abstract class _EventCodesData implements EventCodesData {
  const factory _EventCodesData(
      {final int? total,
      final int? active,
      final int? pending,
      final int? expired,
      final int? revoked,
      final List<EventCode>? eventCodes}) = _$EventCodesDataImpl;

  factory _EventCodesData.fromJson(Map<String, dynamic> json) =
      _$EventCodesDataImpl.fromJson;

  @override
  int? get total;
  @override
  int? get active;
  @override
  int? get pending;
  @override
  int? get expired;
  @override
  int? get revoked;
  @override
  List<EventCode>? get eventCodes;

  /// Create a copy of EventCodesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventCodesDataImplCopyWith<_$EventCodesDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
