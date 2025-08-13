// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return _Summary.fromJson(json);
}

/// @nodoc
mixin _$Summary {
  @JsonKey(name: 'total_permissions')
  int? get totalPermissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'granted_permissions')
  int? get grantedPermissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_permissions')
  int? get activePermissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_permissions')
  int? get expiredPermissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'conditional_permissions')
  int? get conditionalPermissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'role_based_permissions')
  int? get roleBasedPermissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'explicit_permissions')
  int? get explicitPermissions => throw _privateConstructorUsedError;

  /// Serializes this Summary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SummaryCopyWith<Summary> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SummaryCopyWith<$Res> {
  factory $SummaryCopyWith(Summary value, $Res Function(Summary) then) =
      _$SummaryCopyWithImpl<$Res, Summary>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_permissions') int? totalPermissions,
      @JsonKey(name: 'granted_permissions') int? grantedPermissions,
      @JsonKey(name: 'active_permissions') int? activePermissions,
      @JsonKey(name: 'expired_permissions') int? expiredPermissions,
      @JsonKey(name: 'conditional_permissions') int? conditionalPermissions,
      @JsonKey(name: 'role_based_permissions') int? roleBasedPermissions,
      @JsonKey(name: 'explicit_permissions') int? explicitPermissions});
}

/// @nodoc
class _$SummaryCopyWithImpl<$Res, $Val extends Summary>
    implements $SummaryCopyWith<$Res> {
  _$SummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPermissions = freezed,
    Object? grantedPermissions = freezed,
    Object? activePermissions = freezed,
    Object? expiredPermissions = freezed,
    Object? conditionalPermissions = freezed,
    Object? roleBasedPermissions = freezed,
    Object? explicitPermissions = freezed,
  }) {
    return _then(_value.copyWith(
      totalPermissions: freezed == totalPermissions
          ? _value.totalPermissions
          : totalPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      grantedPermissions: freezed == grantedPermissions
          ? _value.grantedPermissions
          : grantedPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      activePermissions: freezed == activePermissions
          ? _value.activePermissions
          : activePermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      expiredPermissions: freezed == expiredPermissions
          ? _value.expiredPermissions
          : expiredPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      conditionalPermissions: freezed == conditionalPermissions
          ? _value.conditionalPermissions
          : conditionalPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      roleBasedPermissions: freezed == roleBasedPermissions
          ? _value.roleBasedPermissions
          : roleBasedPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      explicitPermissions: freezed == explicitPermissions
          ? _value.explicitPermissions
          : explicitPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SummaryImplCopyWith<$Res> implements $SummaryCopyWith<$Res> {
  factory _$$SummaryImplCopyWith(
          _$SummaryImpl value, $Res Function(_$SummaryImpl) then) =
      __$$SummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_permissions') int? totalPermissions,
      @JsonKey(name: 'granted_permissions') int? grantedPermissions,
      @JsonKey(name: 'active_permissions') int? activePermissions,
      @JsonKey(name: 'expired_permissions') int? expiredPermissions,
      @JsonKey(name: 'conditional_permissions') int? conditionalPermissions,
      @JsonKey(name: 'role_based_permissions') int? roleBasedPermissions,
      @JsonKey(name: 'explicit_permissions') int? explicitPermissions});
}

/// @nodoc
class __$$SummaryImplCopyWithImpl<$Res>
    extends _$SummaryCopyWithImpl<$Res, _$SummaryImpl>
    implements _$$SummaryImplCopyWith<$Res> {
  __$$SummaryImplCopyWithImpl(
      _$SummaryImpl _value, $Res Function(_$SummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPermissions = freezed,
    Object? grantedPermissions = freezed,
    Object? activePermissions = freezed,
    Object? expiredPermissions = freezed,
    Object? conditionalPermissions = freezed,
    Object? roleBasedPermissions = freezed,
    Object? explicitPermissions = freezed,
  }) {
    return _then(_$SummaryImpl(
      totalPermissions: freezed == totalPermissions
          ? _value.totalPermissions
          : totalPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      grantedPermissions: freezed == grantedPermissions
          ? _value.grantedPermissions
          : grantedPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      activePermissions: freezed == activePermissions
          ? _value.activePermissions
          : activePermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      expiredPermissions: freezed == expiredPermissions
          ? _value.expiredPermissions
          : expiredPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      conditionalPermissions: freezed == conditionalPermissions
          ? _value.conditionalPermissions
          : conditionalPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      roleBasedPermissions: freezed == roleBasedPermissions
          ? _value.roleBasedPermissions
          : roleBasedPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      explicitPermissions: freezed == explicitPermissions
          ? _value.explicitPermissions
          : explicitPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryImpl implements _Summary {
  const _$SummaryImpl(
      {@JsonKey(name: 'total_permissions') this.totalPermissions,
      @JsonKey(name: 'granted_permissions') this.grantedPermissions,
      @JsonKey(name: 'active_permissions') this.activePermissions,
      @JsonKey(name: 'expired_permissions') this.expiredPermissions,
      @JsonKey(name: 'conditional_permissions') this.conditionalPermissions,
      @JsonKey(name: 'role_based_permissions') this.roleBasedPermissions,
      @JsonKey(name: 'explicit_permissions') this.explicitPermissions});

  factory _$SummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryImplFromJson(json);

  @override
  @JsonKey(name: 'total_permissions')
  final int? totalPermissions;
  @override
  @JsonKey(name: 'granted_permissions')
  final int? grantedPermissions;
  @override
  @JsonKey(name: 'active_permissions')
  final int? activePermissions;
  @override
  @JsonKey(name: 'expired_permissions')
  final int? expiredPermissions;
  @override
  @JsonKey(name: 'conditional_permissions')
  final int? conditionalPermissions;
  @override
  @JsonKey(name: 'role_based_permissions')
  final int? roleBasedPermissions;
  @override
  @JsonKey(name: 'explicit_permissions')
  final int? explicitPermissions;

  @override
  String toString() {
    return 'Summary(totalPermissions: $totalPermissions, grantedPermissions: $grantedPermissions, activePermissions: $activePermissions, expiredPermissions: $expiredPermissions, conditionalPermissions: $conditionalPermissions, roleBasedPermissions: $roleBasedPermissions, explicitPermissions: $explicitPermissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryImpl &&
            (identical(other.totalPermissions, totalPermissions) ||
                other.totalPermissions == totalPermissions) &&
            (identical(other.grantedPermissions, grantedPermissions) ||
                other.grantedPermissions == grantedPermissions) &&
            (identical(other.activePermissions, activePermissions) ||
                other.activePermissions == activePermissions) &&
            (identical(other.expiredPermissions, expiredPermissions) ||
                other.expiredPermissions == expiredPermissions) &&
            (identical(other.conditionalPermissions, conditionalPermissions) ||
                other.conditionalPermissions == conditionalPermissions) &&
            (identical(other.roleBasedPermissions, roleBasedPermissions) ||
                other.roleBasedPermissions == roleBasedPermissions) &&
            (identical(other.explicitPermissions, explicitPermissions) ||
                other.explicitPermissions == explicitPermissions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalPermissions,
      grantedPermissions,
      activePermissions,
      expiredPermissions,
      conditionalPermissions,
      roleBasedPermissions,
      explicitPermissions);

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SummaryImplCopyWith<_$SummaryImpl> get copyWith =>
      __$$SummaryImplCopyWithImpl<_$SummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SummaryImplToJson(
      this,
    );
  }
}

abstract class _Summary implements Summary {
  const factory _Summary(
      {@JsonKey(name: 'total_permissions') final int? totalPermissions,
      @JsonKey(name: 'granted_permissions') final int? grantedPermissions,
      @JsonKey(name: 'active_permissions') final int? activePermissions,
      @JsonKey(name: 'expired_permissions') final int? expiredPermissions,
      @JsonKey(name: 'conditional_permissions')
      final int? conditionalPermissions,
      @JsonKey(name: 'role_based_permissions') final int? roleBasedPermissions,
      @JsonKey(name: 'explicit_permissions')
      final int? explicitPermissions}) = _$SummaryImpl;

  factory _Summary.fromJson(Map<String, dynamic> json) = _$SummaryImpl.fromJson;

  @override
  @JsonKey(name: 'total_permissions')
  int? get totalPermissions;
  @override
  @JsonKey(name: 'granted_permissions')
  int? get grantedPermissions;
  @override
  @JsonKey(name: 'active_permissions')
  int? get activePermissions;
  @override
  @JsonKey(name: 'expired_permissions')
  int? get expiredPermissions;
  @override
  @JsonKey(name: 'conditional_permissions')
  int? get conditionalPermissions;
  @override
  @JsonKey(name: 'role_based_permissions')
  int? get roleBasedPermissions;
  @override
  @JsonKey(name: 'explicit_permissions')
  int? get explicitPermissions;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryImplCopyWith<_$SummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
