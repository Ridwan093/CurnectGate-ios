// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Permission _$PermissionFromJson(Map<String, dynamic> json) {
  return _Permission.fromJson(json);
}

/// @nodoc
mixin _$Permission {
  int? get id => throw _privateConstructorUsedError;
  String? get slug => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_granted')
  bool? get isGranted => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_expired')
  bool? get isExpired => throw _privateConstructorUsedError;
  Conditions? get conditions => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  String? get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'granted_by')
  GrantedBy? get grantedBy => throw _privateConstructorUsedError;
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'granted_at')
  String? get grantedAt => throw _privateConstructorUsedError;

  /// Serializes this Permission to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Permission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermissionCopyWith<Permission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionCopyWith<$Res> {
  factory $PermissionCopyWith(
          Permission value, $Res Function(Permission) then) =
      _$PermissionCopyWithImpl<$Res, Permission>;
  @useResult
  $Res call(
      {int? id,
      String? slug,
      String? name,
      String? description,
      String? source,
      String? status,
      @JsonKey(name: 'is_granted') bool? isGranted,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'is_expired') bool? isExpired,
      Conditions? conditions,
      @JsonKey(name: 'expires_at') String? expiresAt,
      @JsonKey(name: 'granted_by') GrantedBy? grantedBy,
      String? reason,
      @JsonKey(name: 'granted_at') String? grantedAt});

  $ConditionsCopyWith<$Res>? get conditions;
  $GrantedByCopyWith<$Res>? get grantedBy;
}

/// @nodoc
class _$PermissionCopyWithImpl<$Res, $Val extends Permission>
    implements $PermissionCopyWith<$Res> {
  _$PermissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Permission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? source = freezed,
    Object? status = freezed,
    Object? isGranted = freezed,
    Object? isActive = freezed,
    Object? isExpired = freezed,
    Object? conditions = freezed,
    Object? expiresAt = freezed,
    Object? grantedBy = freezed,
    Object? reason = freezed,
    Object? grantedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isGranted: freezed == isGranted
          ? _value.isGranted
          : isGranted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isExpired: freezed == isExpired
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool?,
      conditions: freezed == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as Conditions?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
      grantedBy: freezed == grantedBy
          ? _value.grantedBy
          : grantedBy // ignore: cast_nullable_to_non_nullable
              as GrantedBy?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      grantedAt: freezed == grantedAt
          ? _value.grantedAt
          : grantedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of Permission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConditionsCopyWith<$Res>? get conditions {
    if (_value.conditions == null) {
      return null;
    }

    return $ConditionsCopyWith<$Res>(_value.conditions!, (value) {
      return _then(_value.copyWith(conditions: value) as $Val);
    });
  }

  /// Create a copy of Permission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GrantedByCopyWith<$Res>? get grantedBy {
    if (_value.grantedBy == null) {
      return null;
    }

    return $GrantedByCopyWith<$Res>(_value.grantedBy!, (value) {
      return _then(_value.copyWith(grantedBy: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PermissionImplCopyWith<$Res>
    implements $PermissionCopyWith<$Res> {
  factory _$$PermissionImplCopyWith(
          _$PermissionImpl value, $Res Function(_$PermissionImpl) then) =
      __$$PermissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String? slug,
      String? name,
      String? description,
      String? source,
      String? status,
      @JsonKey(name: 'is_granted') bool? isGranted,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'is_expired') bool? isExpired,
      Conditions? conditions,
      @JsonKey(name: 'expires_at') String? expiresAt,
      @JsonKey(name: 'granted_by') GrantedBy? grantedBy,
      String? reason,
      @JsonKey(name: 'granted_at') String? grantedAt});

  @override
  $ConditionsCopyWith<$Res>? get conditions;
  @override
  $GrantedByCopyWith<$Res>? get grantedBy;
}

/// @nodoc
class __$$PermissionImplCopyWithImpl<$Res>
    extends _$PermissionCopyWithImpl<$Res, _$PermissionImpl>
    implements _$$PermissionImplCopyWith<$Res> {
  __$$PermissionImplCopyWithImpl(
      _$PermissionImpl _value, $Res Function(_$PermissionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Permission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? slug = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? source = freezed,
    Object? status = freezed,
    Object? isGranted = freezed,
    Object? isActive = freezed,
    Object? isExpired = freezed,
    Object? conditions = freezed,
    Object? expiresAt = freezed,
    Object? grantedBy = freezed,
    Object? reason = freezed,
    Object? grantedAt = freezed,
  }) {
    return _then(_$PermissionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      slug: freezed == slug
          ? _value.slug
          : slug // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      isGranted: freezed == isGranted
          ? _value.isGranted
          : isGranted // ignore: cast_nullable_to_non_nullable
              as bool?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isExpired: freezed == isExpired
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool?,
      conditions: freezed == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as Conditions?,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
      grantedBy: freezed == grantedBy
          ? _value.grantedBy
          : grantedBy // ignore: cast_nullable_to_non_nullable
              as GrantedBy?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      grantedAt: freezed == grantedAt
          ? _value.grantedAt
          : grantedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionImpl implements _Permission {
  const _$PermissionImpl(
      {this.id,
      this.slug,
      this.name,
      this.description,
      this.source,
      this.status,
      @JsonKey(name: 'is_granted') this.isGranted,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'is_expired') this.isExpired,
      this.conditions,
      @JsonKey(name: 'expires_at') this.expiresAt,
      @JsonKey(name: 'granted_by') this.grantedBy,
      this.reason,
      @JsonKey(name: 'granted_at') this.grantedAt});

  factory _$PermissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionImplFromJson(json);

  @override
  final int? id;
  @override
  final String? slug;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final String? source;
  @override
  final String? status;
  @override
  @JsonKey(name: 'is_granted')
  final bool? isGranted;
  @override
  @JsonKey(name: 'is_active')
  final bool? isActive;
  @override
  @JsonKey(name: 'is_expired')
  final bool? isExpired;
  @override
  final Conditions? conditions;
  @override
  @JsonKey(name: 'expires_at')
  final String? expiresAt;
  @override
  @JsonKey(name: 'granted_by')
  final GrantedBy? grantedBy;
  @override
  final String? reason;
  @override
  @JsonKey(name: 'granted_at')
  final String? grantedAt;

  @override
  String toString() {
    return 'Permission(id: $id, slug: $slug, name: $name, description: $description, source: $source, status: $status, isGranted: $isGranted, isActive: $isActive, isExpired: $isExpired, conditions: $conditions, expiresAt: $expiresAt, grantedBy: $grantedBy, reason: $reason, grantedAt: $grantedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.slug, slug) || other.slug == slug) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isGranted, isGranted) ||
                other.isGranted == isGranted) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isExpired, isExpired) ||
                other.isExpired == isExpired) &&
            (identical(other.conditions, conditions) ||
                other.conditions == conditions) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.grantedBy, grantedBy) ||
                other.grantedBy == grantedBy) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            (identical(other.grantedAt, grantedAt) ||
                other.grantedAt == grantedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      slug,
      name,
      description,
      source,
      status,
      isGranted,
      isActive,
      isExpired,
      conditions,
      expiresAt,
      grantedBy,
      reason,
      grantedAt);

  /// Create a copy of Permission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionImplCopyWith<_$PermissionImpl> get copyWith =>
      __$$PermissionImplCopyWithImpl<_$PermissionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionImplToJson(
      this,
    );
  }
}

abstract class _Permission implements Permission {
  const factory _Permission(
      {final int? id,
      final String? slug,
      final String? name,
      final String? description,
      final String? source,
      final String? status,
      @JsonKey(name: 'is_granted') final bool? isGranted,
      @JsonKey(name: 'is_active') final bool? isActive,
      @JsonKey(name: 'is_expired') final bool? isExpired,
      final Conditions? conditions,
      @JsonKey(name: 'expires_at') final String? expiresAt,
      @JsonKey(name: 'granted_by') final GrantedBy? grantedBy,
      final String? reason,
      @JsonKey(name: 'granted_at') final String? grantedAt}) = _$PermissionImpl;

  factory _Permission.fromJson(Map<String, dynamic> json) =
      _$PermissionImpl.fromJson;

  @override
  int? get id;
  @override
  String? get slug;
  @override
  String? get name;
  @override
  String? get description;
  @override
  String? get source;
  @override
  String? get status;
  @override
  @JsonKey(name: 'is_granted')
  bool? get isGranted;
  @override
  @JsonKey(name: 'is_active')
  bool? get isActive;
  @override
  @JsonKey(name: 'is_expired')
  bool? get isExpired;
  @override
  Conditions? get conditions;
  @override
  @JsonKey(name: 'expires_at')
  String? get expiresAt;
  @override
  @JsonKey(name: 'granted_by')
  GrantedBy? get grantedBy;
  @override
  String? get reason;
  @override
  @JsonKey(name: 'granted_at')
  String? get grantedAt;

  /// Create a copy of Permission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionImplCopyWith<_$PermissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
