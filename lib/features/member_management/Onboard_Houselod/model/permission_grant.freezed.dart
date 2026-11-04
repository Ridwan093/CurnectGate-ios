// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_grant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PermissionGrant _$PermissionGrantFromJson(Map<String, dynamic> json) {
  return _PermissionGrant.fromJson(json);
}

/// @nodoc
mixin _$PermissionGrant {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'permission')
  Permission? get permission => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_granted')
  bool? get isGranted => throw _privateConstructorUsedError;
  @JsonKey(name: 'granted_by')
  GrantedBy? get grantedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'reason')
  String? get reason => throw _privateConstructorUsedError;
  @JsonKey(name: 'conditions')
  dynamic get conditions => throw _privateConstructorUsedError;
  @JsonKey(name: 'expires_at')
  String? get expiresAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_expired')
  bool? get isExpired => throw _privateConstructorUsedError;
  @JsonKey(name: 'days_until_expiry')
  dynamic get daysUntilExpiry => throw _privateConstructorUsedError;
  @JsonKey(name: 'granted_at')
  String? get grantedAt => throw _privateConstructorUsedError;

  /// Serializes this PermissionGrant to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PermissionGrant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermissionGrantCopyWith<PermissionGrant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionGrantCopyWith<$Res> {
  factory $PermissionGrantCopyWith(
          PermissionGrant value, $Res Function(PermissionGrant) then) =
      _$PermissionGrantCopyWithImpl<$Res, PermissionGrant>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'permission') Permission? permission,
      @JsonKey(name: 'is_granted') bool? isGranted,
      @JsonKey(name: 'granted_by') GrantedBy? grantedBy,
      @JsonKey(name: 'reason') String? reason,
      @JsonKey(name: 'conditions') dynamic conditions,
      @JsonKey(name: 'expires_at') String? expiresAt,
      @JsonKey(name: 'is_expired') bool? isExpired,
      @JsonKey(name: 'days_until_expiry') dynamic daysUntilExpiry,
      @JsonKey(name: 'granted_at') String? grantedAt});

  $PermissionCopyWith<$Res>? get permission;
  $GrantedByCopyWith<$Res>? get grantedBy;
}

/// @nodoc
class _$PermissionGrantCopyWithImpl<$Res, $Val extends PermissionGrant>
    implements $PermissionGrantCopyWith<$Res> {
  _$PermissionGrantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PermissionGrant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? permission = freezed,
    Object? isGranted = freezed,
    Object? grantedBy = freezed,
    Object? reason = freezed,
    Object? conditions = freezed,
    Object? expiresAt = freezed,
    Object? isExpired = freezed,
    Object? daysUntilExpiry = freezed,
    Object? grantedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      permission: freezed == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as Permission?,
      isGranted: freezed == isGranted
          ? _value.isGranted
          : isGranted // ignore: cast_nullable_to_non_nullable
              as bool?,
      grantedBy: freezed == grantedBy
          ? _value.grantedBy
          : grantedBy // ignore: cast_nullable_to_non_nullable
              as GrantedBy?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      conditions: freezed == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as dynamic,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isExpired: freezed == isExpired
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool?,
      daysUntilExpiry: freezed == daysUntilExpiry
          ? _value.daysUntilExpiry
          : daysUntilExpiry // ignore: cast_nullable_to_non_nullable
              as dynamic,
      grantedAt: freezed == grantedAt
          ? _value.grantedAt
          : grantedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of PermissionGrant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PermissionCopyWith<$Res>? get permission {
    if (_value.permission == null) {
      return null;
    }

    return $PermissionCopyWith<$Res>(_value.permission!, (value) {
      return _then(_value.copyWith(permission: value) as $Val);
    });
  }

  /// Create a copy of PermissionGrant
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
abstract class _$$PermissionGrantImplCopyWith<$Res>
    implements $PermissionGrantCopyWith<$Res> {
  factory _$$PermissionGrantImplCopyWith(_$PermissionGrantImpl value,
          $Res Function(_$PermissionGrantImpl) then) =
      __$$PermissionGrantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'permission') Permission? permission,
      @JsonKey(name: 'is_granted') bool? isGranted,
      @JsonKey(name: 'granted_by') GrantedBy? grantedBy,
      @JsonKey(name: 'reason') String? reason,
      @JsonKey(name: 'conditions') dynamic conditions,
      @JsonKey(name: 'expires_at') String? expiresAt,
      @JsonKey(name: 'is_expired') bool? isExpired,
      @JsonKey(name: 'days_until_expiry') dynamic daysUntilExpiry,
      @JsonKey(name: 'granted_at') String? grantedAt});

  @override
  $PermissionCopyWith<$Res>? get permission;
  @override
  $GrantedByCopyWith<$Res>? get grantedBy;
}

/// @nodoc
class __$$PermissionGrantImplCopyWithImpl<$Res>
    extends _$PermissionGrantCopyWithImpl<$Res, _$PermissionGrantImpl>
    implements _$$PermissionGrantImplCopyWith<$Res> {
  __$$PermissionGrantImplCopyWithImpl(
      _$PermissionGrantImpl _value, $Res Function(_$PermissionGrantImpl) _then)
      : super(_value, _then);

  /// Create a copy of PermissionGrant
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? permission = freezed,
    Object? isGranted = freezed,
    Object? grantedBy = freezed,
    Object? reason = freezed,
    Object? conditions = freezed,
    Object? expiresAt = freezed,
    Object? isExpired = freezed,
    Object? daysUntilExpiry = freezed,
    Object? grantedAt = freezed,
  }) {
    return _then(_$PermissionGrantImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      permission: freezed == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as Permission?,
      isGranted: freezed == isGranted
          ? _value.isGranted
          : isGranted // ignore: cast_nullable_to_non_nullable
              as bool?,
      grantedBy: freezed == grantedBy
          ? _value.grantedBy
          : grantedBy // ignore: cast_nullable_to_non_nullable
              as GrantedBy?,
      reason: freezed == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String?,
      conditions: freezed == conditions
          ? _value.conditions
          : conditions // ignore: cast_nullable_to_non_nullable
              as dynamic,
      expiresAt: freezed == expiresAt
          ? _value.expiresAt
          : expiresAt // ignore: cast_nullable_to_non_nullable
              as String?,
      isExpired: freezed == isExpired
          ? _value.isExpired
          : isExpired // ignore: cast_nullable_to_non_nullable
              as bool?,
      daysUntilExpiry: freezed == daysUntilExpiry
          ? _value.daysUntilExpiry
          : daysUntilExpiry // ignore: cast_nullable_to_non_nullable
              as dynamic,
      grantedAt: freezed == grantedAt
          ? _value.grantedAt
          : grantedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PermissionGrantImpl implements _PermissionGrant {
  const _$PermissionGrantImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'permission') this.permission,
      @JsonKey(name: 'is_granted') this.isGranted,
      @JsonKey(name: 'granted_by') this.grantedBy,
      @JsonKey(name: 'reason') this.reason,
      @JsonKey(name: 'conditions') this.conditions,
      @JsonKey(name: 'expires_at') this.expiresAt,
      @JsonKey(name: 'is_expired') this.isExpired,
      @JsonKey(name: 'days_until_expiry') this.daysUntilExpiry,
      @JsonKey(name: 'granted_at') this.grantedAt});

  factory _$PermissionGrantImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionGrantImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'permission')
  final Permission? permission;
  @override
  @JsonKey(name: 'is_granted')
  final bool? isGranted;
  @override
  @JsonKey(name: 'granted_by')
  final GrantedBy? grantedBy;
  @override
  @JsonKey(name: 'reason')
  final String? reason;
  @override
  @JsonKey(name: 'conditions')
  final dynamic conditions;
  @override
  @JsonKey(name: 'expires_at')
  final String? expiresAt;
  @override
  @JsonKey(name: 'is_expired')
  final bool? isExpired;
  @override
  @JsonKey(name: 'days_until_expiry')
  final dynamic daysUntilExpiry;
  @override
  @JsonKey(name: 'granted_at')
  final String? grantedAt;

  @override
  String toString() {
    return 'PermissionGrant(id: $id, permission: $permission, isGranted: $isGranted, grantedBy: $grantedBy, reason: $reason, conditions: $conditions, expiresAt: $expiresAt, isExpired: $isExpired, daysUntilExpiry: $daysUntilExpiry, grantedAt: $grantedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionGrantImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.isGranted, isGranted) ||
                other.isGranted == isGranted) &&
            (identical(other.grantedBy, grantedBy) ||
                other.grantedBy == grantedBy) &&
            (identical(other.reason, reason) || other.reason == reason) &&
            const DeepCollectionEquality()
                .equals(other.conditions, conditions) &&
            (identical(other.expiresAt, expiresAt) ||
                other.expiresAt == expiresAt) &&
            (identical(other.isExpired, isExpired) ||
                other.isExpired == isExpired) &&
            const DeepCollectionEquality()
                .equals(other.daysUntilExpiry, daysUntilExpiry) &&
            (identical(other.grantedAt, grantedAt) ||
                other.grantedAt == grantedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      permission,
      isGranted,
      grantedBy,
      reason,
      const DeepCollectionEquality().hash(conditions),
      expiresAt,
      isExpired,
      const DeepCollectionEquality().hash(daysUntilExpiry),
      grantedAt);

  /// Create a copy of PermissionGrant
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionGrantImplCopyWith<_$PermissionGrantImpl> get copyWith =>
      __$$PermissionGrantImplCopyWithImpl<_$PermissionGrantImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionGrantImplToJson(
      this,
    );
  }
}

abstract class _PermissionGrant implements PermissionGrant {
  const factory _PermissionGrant(
          {@JsonKey(name: 'id') final int? id,
          @JsonKey(name: 'permission') final Permission? permission,
          @JsonKey(name: 'is_granted') final bool? isGranted,
          @JsonKey(name: 'granted_by') final GrantedBy? grantedBy,
          @JsonKey(name: 'reason') final String? reason,
          @JsonKey(name: 'conditions') final dynamic conditions,
          @JsonKey(name: 'expires_at') final String? expiresAt,
          @JsonKey(name: 'is_expired') final bool? isExpired,
          @JsonKey(name: 'days_until_expiry') final dynamic daysUntilExpiry,
          @JsonKey(name: 'granted_at') final String? grantedAt}) =
      _$PermissionGrantImpl;

  factory _PermissionGrant.fromJson(Map<String, dynamic> json) =
      _$PermissionGrantImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'permission')
  Permission? get permission;
  @override
  @JsonKey(name: 'is_granted')
  bool? get isGranted;
  @override
  @JsonKey(name: 'granted_by')
  GrantedBy? get grantedBy;
  @override
  @JsonKey(name: 'reason')
  String? get reason;
  @override
  @JsonKey(name: 'conditions')
  dynamic get conditions;
  @override
  @JsonKey(name: 'expires_at')
  String? get expiresAt;
  @override
  @JsonKey(name: 'is_expired')
  bool? get isExpired;
  @override
  @JsonKey(name: 'days_until_expiry')
  dynamic get daysUntilExpiry;
  @override
  @JsonKey(name: 'granted_at')
  String? get grantedAt;

  /// Create a copy of PermissionGrant
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionGrantImplCopyWith<_$PermissionGrantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
