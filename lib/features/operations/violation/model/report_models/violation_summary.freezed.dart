// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'violation_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PriorityDistribution _$PriorityDistributionFromJson(Map<String, dynamic> json) {
  return _PriorityDistribution.fromJson(json);
}

/// @nodoc
mixin _$PriorityDistribution {
  int get low => throw _privateConstructorUsedError;
  int get medium => throw _privateConstructorUsedError;
  int get high => throw _privateConstructorUsedError;
  int get urgent => throw _privateConstructorUsedError;

  /// Serializes this PriorityDistribution to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PriorityDistribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PriorityDistributionCopyWith<PriorityDistribution> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriorityDistributionCopyWith<$Res> {
  factory $PriorityDistributionCopyWith(PriorityDistribution value,
          $Res Function(PriorityDistribution) then) =
      _$PriorityDistributionCopyWithImpl<$Res, PriorityDistribution>;
  @useResult
  $Res call({int low, int medium, int high, int urgent});
}

/// @nodoc
class _$PriorityDistributionCopyWithImpl<$Res,
        $Val extends PriorityDistribution>
    implements $PriorityDistributionCopyWith<$Res> {
  _$PriorityDistributionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PriorityDistribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? low = null,
    Object? medium = null,
    Object? high = null,
    Object? urgent = null,
  }) {
    return _then(_value.copyWith(
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as int,
      medium: null == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as int,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as int,
      urgent: null == urgent
          ? _value.urgent
          : urgent // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriorityDistributionImplCopyWith<$Res>
    implements $PriorityDistributionCopyWith<$Res> {
  factory _$$PriorityDistributionImplCopyWith(_$PriorityDistributionImpl value,
          $Res Function(_$PriorityDistributionImpl) then) =
      __$$PriorityDistributionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int low, int medium, int high, int urgent});
}

/// @nodoc
class __$$PriorityDistributionImplCopyWithImpl<$Res>
    extends _$PriorityDistributionCopyWithImpl<$Res, _$PriorityDistributionImpl>
    implements _$$PriorityDistributionImplCopyWith<$Res> {
  __$$PriorityDistributionImplCopyWithImpl(_$PriorityDistributionImpl _value,
      $Res Function(_$PriorityDistributionImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriorityDistribution
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? low = null,
    Object? medium = null,
    Object? high = null,
    Object? urgent = null,
  }) {
    return _then(_$PriorityDistributionImpl(
      low: null == low
          ? _value.low
          : low // ignore: cast_nullable_to_non_nullable
              as int,
      medium: null == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as int,
      high: null == high
          ? _value.high
          : high // ignore: cast_nullable_to_non_nullable
              as int,
      urgent: null == urgent
          ? _value.urgent
          : urgent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PriorityDistributionImpl implements _PriorityDistribution {
  const _$PriorityDistributionImpl(
      {this.low = 0, this.medium = 0, this.high = 0, this.urgent = 0});

  factory _$PriorityDistributionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriorityDistributionImplFromJson(json);

  @override
  @JsonKey()
  final int low;
  @override
  @JsonKey()
  final int medium;
  @override
  @JsonKey()
  final int high;
  @override
  @JsonKey()
  final int urgent;

  @override
  String toString() {
    return 'PriorityDistribution(low: $low, medium: $medium, high: $high, urgent: $urgent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriorityDistributionImpl &&
            (identical(other.low, low) || other.low == low) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.high, high) || other.high == high) &&
            (identical(other.urgent, urgent) || other.urgent == urgent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, low, medium, high, urgent);

  /// Create a copy of PriorityDistribution
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriorityDistributionImplCopyWith<_$PriorityDistributionImpl>
      get copyWith =>
          __$$PriorityDistributionImplCopyWithImpl<_$PriorityDistributionImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriorityDistributionImplToJson(
      this,
    );
  }
}

abstract class _PriorityDistribution implements PriorityDistribution {
  const factory _PriorityDistribution(
      {final int low,
      final int medium,
      final int high,
      final int urgent}) = _$PriorityDistributionImpl;

  factory _PriorityDistribution.fromJson(Map<String, dynamic> json) =
      _$PriorityDistributionImpl.fromJson;

  @override
  int get low;
  @override
  int get medium;
  @override
  int get high;
  @override
  int get urgent;

  /// Create a copy of PriorityDistribution
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriorityDistributionImplCopyWith<_$PriorityDistributionImpl>
      get copyWith => throw _privateConstructorUsedError;
}

ViolationSummary _$ViolationSummaryFromJson(Map<String, dynamic> json) {
  return _ViolationSummary.fromJson(json);
}

/// @nodoc
mixin _$ViolationSummary {
  int get total => throw _privateConstructorUsedError;
  int get pending => throw _privateConstructorUsedError;
  int get investigating => throw _privateConstructorUsedError;
  int get resolved => throw _privateConstructorUsedError;
  int get dismissed => throw _privateConstructorUsedError;
  PriorityDistribution? get byPriority => throw _privateConstructorUsedError;

  /// Serializes this ViolationSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ViolationSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ViolationSummaryCopyWith<ViolationSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViolationSummaryCopyWith<$Res> {
  factory $ViolationSummaryCopyWith(
          ViolationSummary value, $Res Function(ViolationSummary) then) =
      _$ViolationSummaryCopyWithImpl<$Res, ViolationSummary>;
  @useResult
  $Res call(
      {int total,
      int pending,
      int investigating,
      int resolved,
      int dismissed,
      PriorityDistribution? byPriority});

  $PriorityDistributionCopyWith<$Res>? get byPriority;
}

/// @nodoc
class _$ViolationSummaryCopyWithImpl<$Res, $Val extends ViolationSummary>
    implements $ViolationSummaryCopyWith<$Res> {
  _$ViolationSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ViolationSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? pending = null,
    Object? investigating = null,
    Object? resolved = null,
    Object? dismissed = null,
    Object? byPriority = freezed,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      pending: null == pending
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as int,
      investigating: null == investigating
          ? _value.investigating
          : investigating // ignore: cast_nullable_to_non_nullable
              as int,
      resolved: null == resolved
          ? _value.resolved
          : resolved // ignore: cast_nullable_to_non_nullable
              as int,
      dismissed: null == dismissed
          ? _value.dismissed
          : dismissed // ignore: cast_nullable_to_non_nullable
              as int,
      byPriority: freezed == byPriority
          ? _value.byPriority
          : byPriority // ignore: cast_nullable_to_non_nullable
              as PriorityDistribution?,
    ) as $Val);
  }

  /// Create a copy of ViolationSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PriorityDistributionCopyWith<$Res>? get byPriority {
    if (_value.byPriority == null) {
      return null;
    }

    return $PriorityDistributionCopyWith<$Res>(_value.byPriority!, (value) {
      return _then(_value.copyWith(byPriority: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ViolationSummaryImplCopyWith<$Res>
    implements $ViolationSummaryCopyWith<$Res> {
  factory _$$ViolationSummaryImplCopyWith(_$ViolationSummaryImpl value,
          $Res Function(_$ViolationSummaryImpl) then) =
      __$$ViolationSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int total,
      int pending,
      int investigating,
      int resolved,
      int dismissed,
      PriorityDistribution? byPriority});

  @override
  $PriorityDistributionCopyWith<$Res>? get byPriority;
}

/// @nodoc
class __$$ViolationSummaryImplCopyWithImpl<$Res>
    extends _$ViolationSummaryCopyWithImpl<$Res, _$ViolationSummaryImpl>
    implements _$$ViolationSummaryImplCopyWith<$Res> {
  __$$ViolationSummaryImplCopyWithImpl(_$ViolationSummaryImpl _value,
      $Res Function(_$ViolationSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ViolationSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? pending = null,
    Object? investigating = null,
    Object? resolved = null,
    Object? dismissed = null,
    Object? byPriority = freezed,
  }) {
    return _then(_$ViolationSummaryImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      pending: null == pending
          ? _value.pending
          : pending // ignore: cast_nullable_to_non_nullable
              as int,
      investigating: null == investigating
          ? _value.investigating
          : investigating // ignore: cast_nullable_to_non_nullable
              as int,
      resolved: null == resolved
          ? _value.resolved
          : resolved // ignore: cast_nullable_to_non_nullable
              as int,
      dismissed: null == dismissed
          ? _value.dismissed
          : dismissed // ignore: cast_nullable_to_non_nullable
              as int,
      byPriority: freezed == byPriority
          ? _value.byPriority
          : byPriority // ignore: cast_nullable_to_non_nullable
              as PriorityDistribution?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ViolationSummaryImpl implements _ViolationSummary {
  const _$ViolationSummaryImpl(
      {this.total = 0,
      this.pending = 0,
      this.investigating = 0,
      this.resolved = 0,
      this.dismissed = 0,
      this.byPriority});

  factory _$ViolationSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$ViolationSummaryImplFromJson(json);

  @override
  @JsonKey()
  final int total;
  @override
  @JsonKey()
  final int pending;
  @override
  @JsonKey()
  final int investigating;
  @override
  @JsonKey()
  final int resolved;
  @override
  @JsonKey()
  final int dismissed;
  @override
  final PriorityDistribution? byPriority;

  @override
  String toString() {
    return 'ViolationSummary(total: $total, pending: $pending, investigating: $investigating, resolved: $resolved, dismissed: $dismissed, byPriority: $byPriority)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViolationSummaryImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.pending, pending) || other.pending == pending) &&
            (identical(other.investigating, investigating) ||
                other.investigating == investigating) &&
            (identical(other.resolved, resolved) ||
                other.resolved == resolved) &&
            (identical(other.dismissed, dismissed) ||
                other.dismissed == dismissed) &&
            (identical(other.byPriority, byPriority) ||
                other.byPriority == byPriority));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, pending, investigating,
      resolved, dismissed, byPriority);

  /// Create a copy of ViolationSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViolationSummaryImplCopyWith<_$ViolationSummaryImpl> get copyWith =>
      __$$ViolationSummaryImplCopyWithImpl<_$ViolationSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ViolationSummaryImplToJson(
      this,
    );
  }
}

abstract class _ViolationSummary implements ViolationSummary {
  const factory _ViolationSummary(
      {final int total,
      final int pending,
      final int investigating,
      final int resolved,
      final int dismissed,
      final PriorityDistribution? byPriority}) = _$ViolationSummaryImpl;

  factory _ViolationSummary.fromJson(Map<String, dynamic> json) =
      _$ViolationSummaryImpl.fromJson;

  @override
  int get total;
  @override
  int get pending;
  @override
  int get investigating;
  @override
  int get resolved;
  @override
  int get dismissed;
  @override
  PriorityDistribution? get byPriority;

  /// Create a copy of ViolationSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViolationSummaryImplCopyWith<_$ViolationSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
