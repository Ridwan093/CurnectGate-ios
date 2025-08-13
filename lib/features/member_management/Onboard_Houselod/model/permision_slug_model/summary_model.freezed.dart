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
  @JsonKey(name: 'role_permissions')
  int? get rolePermissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'explicit_permissions')
  int? get explicitPermissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_permissions')
  int? get activePermissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'denied_permissions')
  int? get deniedPermissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_permissions')
  int? get expiredPermissions => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'role_permissions') int? rolePermissions,
      @JsonKey(name: 'explicit_permissions') int? explicitPermissions,
      @JsonKey(name: 'active_permissions') int? activePermissions,
      @JsonKey(name: 'denied_permissions') int? deniedPermissions,
      @JsonKey(name: 'expired_permissions') int? expiredPermissions});
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
    Object? rolePermissions = freezed,
    Object? explicitPermissions = freezed,
    Object? activePermissions = freezed,
    Object? deniedPermissions = freezed,
    Object? expiredPermissions = freezed,
  }) {
    return _then(_value.copyWith(
      totalPermissions: freezed == totalPermissions
          ? _value.totalPermissions
          : totalPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      rolePermissions: freezed == rolePermissions
          ? _value.rolePermissions
          : rolePermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      explicitPermissions: freezed == explicitPermissions
          ? _value.explicitPermissions
          : explicitPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      activePermissions: freezed == activePermissions
          ? _value.activePermissions
          : activePermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      deniedPermissions: freezed == deniedPermissions
          ? _value.deniedPermissions
          : deniedPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      expiredPermissions: freezed == expiredPermissions
          ? _value.expiredPermissions
          : expiredPermissions // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'role_permissions') int? rolePermissions,
      @JsonKey(name: 'explicit_permissions') int? explicitPermissions,
      @JsonKey(name: 'active_permissions') int? activePermissions,
      @JsonKey(name: 'denied_permissions') int? deniedPermissions,
      @JsonKey(name: 'expired_permissions') int? expiredPermissions});
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
    Object? rolePermissions = freezed,
    Object? explicitPermissions = freezed,
    Object? activePermissions = freezed,
    Object? deniedPermissions = freezed,
    Object? expiredPermissions = freezed,
  }) {
    return _then(_$SummaryImpl(
      totalPermissions: freezed == totalPermissions
          ? _value.totalPermissions
          : totalPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      rolePermissions: freezed == rolePermissions
          ? _value.rolePermissions
          : rolePermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      explicitPermissions: freezed == explicitPermissions
          ? _value.explicitPermissions
          : explicitPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      activePermissions: freezed == activePermissions
          ? _value.activePermissions
          : activePermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      deniedPermissions: freezed == deniedPermissions
          ? _value.deniedPermissions
          : deniedPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      expiredPermissions: freezed == expiredPermissions
          ? _value.expiredPermissions
          : expiredPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SummaryImpl implements _Summary {
  const _$SummaryImpl(
      {@JsonKey(name: 'total_permissions') this.totalPermissions,
      @JsonKey(name: 'role_permissions') this.rolePermissions,
      @JsonKey(name: 'explicit_permissions') this.explicitPermissions,
      @JsonKey(name: 'active_permissions') this.activePermissions,
      @JsonKey(name: 'denied_permissions') this.deniedPermissions,
      @JsonKey(name: 'expired_permissions') this.expiredPermissions});

  factory _$SummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SummaryImplFromJson(json);

  @override
  @JsonKey(name: 'total_permissions')
  final int? totalPermissions;
  @override
  @JsonKey(name: 'role_permissions')
  final int? rolePermissions;
  @override
  @JsonKey(name: 'explicit_permissions')
  final int? explicitPermissions;
  @override
  @JsonKey(name: 'active_permissions')
  final int? activePermissions;
  @override
  @JsonKey(name: 'denied_permissions')
  final int? deniedPermissions;
  @override
  @JsonKey(name: 'expired_permissions')
  final int? expiredPermissions;

  @override
  String toString() {
    return 'Summary(totalPermissions: $totalPermissions, rolePermissions: $rolePermissions, explicitPermissions: $explicitPermissions, activePermissions: $activePermissions, deniedPermissions: $deniedPermissions, expiredPermissions: $expiredPermissions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SummaryImpl &&
            (identical(other.totalPermissions, totalPermissions) ||
                other.totalPermissions == totalPermissions) &&
            (identical(other.rolePermissions, rolePermissions) ||
                other.rolePermissions == rolePermissions) &&
            (identical(other.explicitPermissions, explicitPermissions) ||
                other.explicitPermissions == explicitPermissions) &&
            (identical(other.activePermissions, activePermissions) ||
                other.activePermissions == activePermissions) &&
            (identical(other.deniedPermissions, deniedPermissions) ||
                other.deniedPermissions == deniedPermissions) &&
            (identical(other.expiredPermissions, expiredPermissions) ||
                other.expiredPermissions == expiredPermissions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalPermissions,
      rolePermissions,
      explicitPermissions,
      activePermissions,
      deniedPermissions,
      expiredPermissions);

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
      @JsonKey(name: 'role_permissions') final int? rolePermissions,
      @JsonKey(name: 'explicit_permissions') final int? explicitPermissions,
      @JsonKey(name: 'active_permissions') final int? activePermissions,
      @JsonKey(name: 'denied_permissions') final int? deniedPermissions,
      @JsonKey(name: 'expired_permissions')
      final int? expiredPermissions}) = _$SummaryImpl;

  factory _Summary.fromJson(Map<String, dynamic> json) = _$SummaryImpl.fromJson;

  @override
  @JsonKey(name: 'total_permissions')
  int? get totalPermissions;
  @override
  @JsonKey(name: 'role_permissions')
  int? get rolePermissions;
  @override
  @JsonKey(name: 'explicit_permissions')
  int? get explicitPermissions;
  @override
  @JsonKey(name: 'active_permissions')
  int? get activePermissions;
  @override
  @JsonKey(name: 'denied_permissions')
  int? get deniedPermissions;
  @override
  @JsonKey(name: 'expired_permissions')
  int? get expiredPermissions;

  /// Create a copy of Summary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SummaryImplCopyWith<_$SummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
