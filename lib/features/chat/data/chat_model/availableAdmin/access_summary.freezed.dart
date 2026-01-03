// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccessSummary _$AccessSummaryFromJson(Map<String, dynamic> json) {
  return _AccessSummary.fromJson(json);
}

/// @nodoc
mixin _$AccessSummary {
  String? get lastGateAccess => throw _privateConstructorUsedError;
  int? get totalAccessAttemptsToday => throw _privateConstructorUsedError;
  String? get currentLocation => throw _privateConstructorUsedError;
  bool? get isCurrentlyInEstate => throw _privateConstructorUsedError;

  /// Serializes this AccessSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccessSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccessSummaryCopyWith<AccessSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessSummaryCopyWith<$Res> {
  factory $AccessSummaryCopyWith(
          AccessSummary value, $Res Function(AccessSummary) then) =
      _$AccessSummaryCopyWithImpl<$Res, AccessSummary>;
  @useResult
  $Res call(
      {String? lastGateAccess,
      int? totalAccessAttemptsToday,
      String? currentLocation,
      bool? isCurrentlyInEstate});
}

/// @nodoc
class _$AccessSummaryCopyWithImpl<$Res, $Val extends AccessSummary>
    implements $AccessSummaryCopyWith<$Res> {
  _$AccessSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccessSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastGateAccess = freezed,
    Object? totalAccessAttemptsToday = freezed,
    Object? currentLocation = freezed,
    Object? isCurrentlyInEstate = freezed,
  }) {
    return _then(_value.copyWith(
      lastGateAccess: freezed == lastGateAccess
          ? _value.lastGateAccess
          : lastGateAccess // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAccessAttemptsToday: freezed == totalAccessAttemptsToday
          ? _value.totalAccessAttemptsToday
          : totalAccessAttemptsToday // ignore: cast_nullable_to_non_nullable
              as int?,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      isCurrentlyInEstate: freezed == isCurrentlyInEstate
          ? _value.isCurrentlyInEstate
          : isCurrentlyInEstate // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccessSummaryImplCopyWith<$Res>
    implements $AccessSummaryCopyWith<$Res> {
  factory _$$AccessSummaryImplCopyWith(
          _$AccessSummaryImpl value, $Res Function(_$AccessSummaryImpl) then) =
      __$$AccessSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? lastGateAccess,
      int? totalAccessAttemptsToday,
      String? currentLocation,
      bool? isCurrentlyInEstate});
}

/// @nodoc
class __$$AccessSummaryImplCopyWithImpl<$Res>
    extends _$AccessSummaryCopyWithImpl<$Res, _$AccessSummaryImpl>
    implements _$$AccessSummaryImplCopyWith<$Res> {
  __$$AccessSummaryImplCopyWithImpl(
      _$AccessSummaryImpl _value, $Res Function(_$AccessSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccessSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lastGateAccess = freezed,
    Object? totalAccessAttemptsToday = freezed,
    Object? currentLocation = freezed,
    Object? isCurrentlyInEstate = freezed,
  }) {
    return _then(_$AccessSummaryImpl(
      lastGateAccess: freezed == lastGateAccess
          ? _value.lastGateAccess
          : lastGateAccess // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAccessAttemptsToday: freezed == totalAccessAttemptsToday
          ? _value.totalAccessAttemptsToday
          : totalAccessAttemptsToday // ignore: cast_nullable_to_non_nullable
              as int?,
      currentLocation: freezed == currentLocation
          ? _value.currentLocation
          : currentLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      isCurrentlyInEstate: freezed == isCurrentlyInEstate
          ? _value.isCurrentlyInEstate
          : isCurrentlyInEstate // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$AccessSummaryImpl implements _AccessSummary {
  const _$AccessSummaryImpl(
      {this.lastGateAccess,
      this.totalAccessAttemptsToday,
      this.currentLocation,
      this.isCurrentlyInEstate});

  factory _$AccessSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccessSummaryImplFromJson(json);

  @override
  final String? lastGateAccess;
  @override
  final int? totalAccessAttemptsToday;
  @override
  final String? currentLocation;
  @override
  final bool? isCurrentlyInEstate;

  @override
  String toString() {
    return 'AccessSummary(lastGateAccess: $lastGateAccess, totalAccessAttemptsToday: $totalAccessAttemptsToday, currentLocation: $currentLocation, isCurrentlyInEstate: $isCurrentlyInEstate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessSummaryImpl &&
            (identical(other.lastGateAccess, lastGateAccess) ||
                other.lastGateAccess == lastGateAccess) &&
            (identical(
                    other.totalAccessAttemptsToday, totalAccessAttemptsToday) ||
                other.totalAccessAttemptsToday == totalAccessAttemptsToday) &&
            (identical(other.currentLocation, currentLocation) ||
                other.currentLocation == currentLocation) &&
            (identical(other.isCurrentlyInEstate, isCurrentlyInEstate) ||
                other.isCurrentlyInEstate == isCurrentlyInEstate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, lastGateAccess,
      totalAccessAttemptsToday, currentLocation, isCurrentlyInEstate);

  /// Create a copy of AccessSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessSummaryImplCopyWith<_$AccessSummaryImpl> get copyWith =>
      __$$AccessSummaryImplCopyWithImpl<_$AccessSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccessSummaryImplToJson(
      this,
    );
  }
}

abstract class _AccessSummary implements AccessSummary {
  const factory _AccessSummary(
      {final String? lastGateAccess,
      final int? totalAccessAttemptsToday,
      final String? currentLocation,
      final bool? isCurrentlyInEstate}) = _$AccessSummaryImpl;

  factory _AccessSummary.fromJson(Map<String, dynamic> json) =
      _$AccessSummaryImpl.fromJson;

  @override
  String? get lastGateAccess;
  @override
  int? get totalAccessAttemptsToday;
  @override
  String? get currentLocation;
  @override
  bool? get isCurrentlyInEstate;

  /// Create a copy of AccessSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccessSummaryImplCopyWith<_$AccessSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
