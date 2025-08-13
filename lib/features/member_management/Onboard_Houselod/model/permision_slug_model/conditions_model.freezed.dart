// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conditions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Conditions _$ConditionsFromJson(Map<String, dynamic> json) {
  return _Conditions.fromJson(json);
}

/// @nodoc
mixin _$Conditions {
  @JsonKey(name: 'time_restrictions')
  Map<String, TimeRestriction>? get timeRestrictions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'requires_approval')
  bool? get requiresApproval => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_visitors_per_day')
  int? get maxVisitorsPerDay => throw _privateConstructorUsedError;
  List<String>? get facilities => throw _privateConstructorUsedError;
  bool? get moderated => throw _privateConstructorUsedError;
  @JsonKey(name: 'posting_limits')
  Map<String, int>? get postingLimits => throw _privateConstructorUsedError;

  /// Serializes this Conditions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Conditions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConditionsCopyWith<Conditions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConditionsCopyWith<$Res> {
  factory $ConditionsCopyWith(
          Conditions value, $Res Function(Conditions) then) =
      _$ConditionsCopyWithImpl<$Res, Conditions>;
  @useResult
  $Res call(
      {@JsonKey(name: 'time_restrictions')
      Map<String, TimeRestriction>? timeRestrictions,
      @JsonKey(name: 'requires_approval') bool? requiresApproval,
      @JsonKey(name: 'max_visitors_per_day') int? maxVisitorsPerDay,
      List<String>? facilities,
      bool? moderated,
      @JsonKey(name: 'posting_limits') Map<String, int>? postingLimits});
}

/// @nodoc
class _$ConditionsCopyWithImpl<$Res, $Val extends Conditions>
    implements $ConditionsCopyWith<$Res> {
  _$ConditionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Conditions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeRestrictions = freezed,
    Object? requiresApproval = freezed,
    Object? maxVisitorsPerDay = freezed,
    Object? facilities = freezed,
    Object? moderated = freezed,
    Object? postingLimits = freezed,
  }) {
    return _then(_value.copyWith(
      timeRestrictions: freezed == timeRestrictions
          ? _value.timeRestrictions
          : timeRestrictions // ignore: cast_nullable_to_non_nullable
              as Map<String, TimeRestriction>?,
      requiresApproval: freezed == requiresApproval
          ? _value.requiresApproval
          : requiresApproval // ignore: cast_nullable_to_non_nullable
              as bool?,
      maxVisitorsPerDay: freezed == maxVisitorsPerDay
          ? _value.maxVisitorsPerDay
          : maxVisitorsPerDay // ignore: cast_nullable_to_non_nullable
              as int?,
      facilities: freezed == facilities
          ? _value.facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      moderated: freezed == moderated
          ? _value.moderated
          : moderated // ignore: cast_nullable_to_non_nullable
              as bool?,
      postingLimits: freezed == postingLimits
          ? _value.postingLimits
          : postingLimits // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConditionsImplCopyWith<$Res>
    implements $ConditionsCopyWith<$Res> {
  factory _$$ConditionsImplCopyWith(
          _$ConditionsImpl value, $Res Function(_$ConditionsImpl) then) =
      __$$ConditionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'time_restrictions')
      Map<String, TimeRestriction>? timeRestrictions,
      @JsonKey(name: 'requires_approval') bool? requiresApproval,
      @JsonKey(name: 'max_visitors_per_day') int? maxVisitorsPerDay,
      List<String>? facilities,
      bool? moderated,
      @JsonKey(name: 'posting_limits') Map<String, int>? postingLimits});
}

/// @nodoc
class __$$ConditionsImplCopyWithImpl<$Res>
    extends _$ConditionsCopyWithImpl<$Res, _$ConditionsImpl>
    implements _$$ConditionsImplCopyWith<$Res> {
  __$$ConditionsImplCopyWithImpl(
      _$ConditionsImpl _value, $Res Function(_$ConditionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Conditions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timeRestrictions = freezed,
    Object? requiresApproval = freezed,
    Object? maxVisitorsPerDay = freezed,
    Object? facilities = freezed,
    Object? moderated = freezed,
    Object? postingLimits = freezed,
  }) {
    return _then(_$ConditionsImpl(
      timeRestrictions: freezed == timeRestrictions
          ? _value._timeRestrictions
          : timeRestrictions // ignore: cast_nullable_to_non_nullable
              as Map<String, TimeRestriction>?,
      requiresApproval: freezed == requiresApproval
          ? _value.requiresApproval
          : requiresApproval // ignore: cast_nullable_to_non_nullable
              as bool?,
      maxVisitorsPerDay: freezed == maxVisitorsPerDay
          ? _value.maxVisitorsPerDay
          : maxVisitorsPerDay // ignore: cast_nullable_to_non_nullable
              as int?,
      facilities: freezed == facilities
          ? _value._facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      moderated: freezed == moderated
          ? _value.moderated
          : moderated // ignore: cast_nullable_to_non_nullable
              as bool?,
      postingLimits: freezed == postingLimits
          ? _value._postingLimits
          : postingLimits // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConditionsImpl implements _Conditions {
  const _$ConditionsImpl(
      {@JsonKey(name: 'time_restrictions')
      final Map<String, TimeRestriction>? timeRestrictions,
      @JsonKey(name: 'requires_approval') this.requiresApproval,
      @JsonKey(name: 'max_visitors_per_day') this.maxVisitorsPerDay,
      final List<String>? facilities,
      this.moderated,
      @JsonKey(name: 'posting_limits') final Map<String, int>? postingLimits})
      : _timeRestrictions = timeRestrictions,
        _facilities = facilities,
        _postingLimits = postingLimits;

  factory _$ConditionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConditionsImplFromJson(json);

  final Map<String, TimeRestriction>? _timeRestrictions;
  @override
  @JsonKey(name: 'time_restrictions')
  Map<String, TimeRestriction>? get timeRestrictions {
    final value = _timeRestrictions;
    if (value == null) return null;
    if (_timeRestrictions is EqualUnmodifiableMapView) return _timeRestrictions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey(name: 'requires_approval')
  final bool? requiresApproval;
  @override
  @JsonKey(name: 'max_visitors_per_day')
  final int? maxVisitorsPerDay;
  final List<String>? _facilities;
  @override
  List<String>? get facilities {
    final value = _facilities;
    if (value == null) return null;
    if (_facilities is EqualUnmodifiableListView) return _facilities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? moderated;
  final Map<String, int>? _postingLimits;
  @override
  @JsonKey(name: 'posting_limits')
  Map<String, int>? get postingLimits {
    final value = _postingLimits;
    if (value == null) return null;
    if (_postingLimits is EqualUnmodifiableMapView) return _postingLimits;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'Conditions(timeRestrictions: $timeRestrictions, requiresApproval: $requiresApproval, maxVisitorsPerDay: $maxVisitorsPerDay, facilities: $facilities, moderated: $moderated, postingLimits: $postingLimits)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConditionsImpl &&
            const DeepCollectionEquality()
                .equals(other._timeRestrictions, _timeRestrictions) &&
            (identical(other.requiresApproval, requiresApproval) ||
                other.requiresApproval == requiresApproval) &&
            (identical(other.maxVisitorsPerDay, maxVisitorsPerDay) ||
                other.maxVisitorsPerDay == maxVisitorsPerDay) &&
            const DeepCollectionEquality()
                .equals(other._facilities, _facilities) &&
            (identical(other.moderated, moderated) ||
                other.moderated == moderated) &&
            const DeepCollectionEquality()
                .equals(other._postingLimits, _postingLimits));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_timeRestrictions),
      requiresApproval,
      maxVisitorsPerDay,
      const DeepCollectionEquality().hash(_facilities),
      moderated,
      const DeepCollectionEquality().hash(_postingLimits));

  /// Create a copy of Conditions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConditionsImplCopyWith<_$ConditionsImpl> get copyWith =>
      __$$ConditionsImplCopyWithImpl<_$ConditionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConditionsImplToJson(
      this,
    );
  }
}

abstract class _Conditions implements Conditions {
  const factory _Conditions(
      {@JsonKey(name: 'time_restrictions')
      final Map<String, TimeRestriction>? timeRestrictions,
      @JsonKey(name: 'requires_approval') final bool? requiresApproval,
      @JsonKey(name: 'max_visitors_per_day') final int? maxVisitorsPerDay,
      final List<String>? facilities,
      final bool? moderated,
      @JsonKey(name: 'posting_limits')
      final Map<String, int>? postingLimits}) = _$ConditionsImpl;

  factory _Conditions.fromJson(Map<String, dynamic> json) =
      _$ConditionsImpl.fromJson;

  @override
  @JsonKey(name: 'time_restrictions')
  Map<String, TimeRestriction>? get timeRestrictions;
  @override
  @JsonKey(name: 'requires_approval')
  bool? get requiresApproval;
  @override
  @JsonKey(name: 'max_visitors_per_day')
  int? get maxVisitorsPerDay;
  @override
  List<String>? get facilities;
  @override
  bool? get moderated;
  @override
  @JsonKey(name: 'posting_limits')
  Map<String, int>? get postingLimits;

  /// Create a copy of Conditions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConditionsImplCopyWith<_$ConditionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
