// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'member_permission_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MemberPermission _$MemberPermissionFromJson(Map<String, dynamic> json) {
  return _MemberPermission.fromJson(json);
}

/// @nodoc
mixin _$MemberPermission {
  PermissionInfo? get permission => throw _privateConstructorUsedError;
  PermissionStatus? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'grant_details')
  GrantDetails? get grantDetails => throw _privateConstructorUsedError;
  @JsonKey(name: 'effective_status')
  String? get effectiveStatus => throw _privateConstructorUsedError;

  /// Serializes this MemberPermission to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MemberPermission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MemberPermissionCopyWith<MemberPermission> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MemberPermissionCopyWith<$Res> {
  factory $MemberPermissionCopyWith(
          MemberPermission value, $Res Function(MemberPermission) then) =
      _$MemberPermissionCopyWithImpl<$Res, MemberPermission>;
  @useResult
  $Res call(
      {PermissionInfo? permission,
      PermissionStatus? status,
      @JsonKey(name: 'grant_details') GrantDetails? grantDetails,
      @JsonKey(name: 'effective_status') String? effectiveStatus});

  $PermissionInfoCopyWith<$Res>? get permission;
  $PermissionStatusCopyWith<$Res>? get status;
  $GrantDetailsCopyWith<$Res>? get grantDetails;
}

/// @nodoc
class _$MemberPermissionCopyWithImpl<$Res, $Val extends MemberPermission>
    implements $MemberPermissionCopyWith<$Res> {
  _$MemberPermissionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MemberPermission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = freezed,
    Object? status = freezed,
    Object? grantDetails = freezed,
    Object? effectiveStatus = freezed,
  }) {
    return _then(_value.copyWith(
      permission: freezed == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as PermissionInfo?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PermissionStatus?,
      grantDetails: freezed == grantDetails
          ? _value.grantDetails
          : grantDetails // ignore: cast_nullable_to_non_nullable
              as GrantDetails?,
      effectiveStatus: freezed == effectiveStatus
          ? _value.effectiveStatus
          : effectiveStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of MemberPermission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PermissionInfoCopyWith<$Res>? get permission {
    if (_value.permission == null) {
      return null;
    }

    return $PermissionInfoCopyWith<$Res>(_value.permission!, (value) {
      return _then(_value.copyWith(permission: value) as $Val);
    });
  }

  /// Create a copy of MemberPermission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PermissionStatusCopyWith<$Res>? get status {
    if (_value.status == null) {
      return null;
    }

    return $PermissionStatusCopyWith<$Res>(_value.status!, (value) {
      return _then(_value.copyWith(status: value) as $Val);
    });
  }

  /// Create a copy of MemberPermission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GrantDetailsCopyWith<$Res>? get grantDetails {
    if (_value.grantDetails == null) {
      return null;
    }

    return $GrantDetailsCopyWith<$Res>(_value.grantDetails!, (value) {
      return _then(_value.copyWith(grantDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MemberPermissionImplCopyWith<$Res>
    implements $MemberPermissionCopyWith<$Res> {
  factory _$$MemberPermissionImplCopyWith(_$MemberPermissionImpl value,
          $Res Function(_$MemberPermissionImpl) then) =
      __$$MemberPermissionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PermissionInfo? permission,
      PermissionStatus? status,
      @JsonKey(name: 'grant_details') GrantDetails? grantDetails,
      @JsonKey(name: 'effective_status') String? effectiveStatus});

  @override
  $PermissionInfoCopyWith<$Res>? get permission;
  @override
  $PermissionStatusCopyWith<$Res>? get status;
  @override
  $GrantDetailsCopyWith<$Res>? get grantDetails;
}

/// @nodoc
class __$$MemberPermissionImplCopyWithImpl<$Res>
    extends _$MemberPermissionCopyWithImpl<$Res, _$MemberPermissionImpl>
    implements _$$MemberPermissionImplCopyWith<$Res> {
  __$$MemberPermissionImplCopyWithImpl(_$MemberPermissionImpl _value,
      $Res Function(_$MemberPermissionImpl) _then)
      : super(_value, _then);

  /// Create a copy of MemberPermission
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? permission = freezed,
    Object? status = freezed,
    Object? grantDetails = freezed,
    Object? effectiveStatus = freezed,
  }) {
    return _then(_$MemberPermissionImpl(
      permission: freezed == permission
          ? _value.permission
          : permission // ignore: cast_nullable_to_non_nullable
              as PermissionInfo?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PermissionStatus?,
      grantDetails: freezed == grantDetails
          ? _value.grantDetails
          : grantDetails // ignore: cast_nullable_to_non_nullable
              as GrantDetails?,
      effectiveStatus: freezed == effectiveStatus
          ? _value.effectiveStatus
          : effectiveStatus // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MemberPermissionImpl implements _MemberPermission {
  const _$MemberPermissionImpl(
      {this.permission,
      this.status,
      @JsonKey(name: 'grant_details') this.grantDetails,
      @JsonKey(name: 'effective_status') this.effectiveStatus});

  factory _$MemberPermissionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MemberPermissionImplFromJson(json);

  @override
  final PermissionInfo? permission;
  @override
  final PermissionStatus? status;
  @override
  @JsonKey(name: 'grant_details')
  final GrantDetails? grantDetails;
  @override
  @JsonKey(name: 'effective_status')
  final String? effectiveStatus;

  @override
  String toString() {
    return 'MemberPermission(permission: $permission, status: $status, grantDetails: $grantDetails, effectiveStatus: $effectiveStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MemberPermissionImpl &&
            (identical(other.permission, permission) ||
                other.permission == permission) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.grantDetails, grantDetails) ||
                other.grantDetails == grantDetails) &&
            (identical(other.effectiveStatus, effectiveStatus) ||
                other.effectiveStatus == effectiveStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, permission, status, grantDetails, effectiveStatus);

  /// Create a copy of MemberPermission
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MemberPermissionImplCopyWith<_$MemberPermissionImpl> get copyWith =>
      __$$MemberPermissionImplCopyWithImpl<_$MemberPermissionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MemberPermissionImplToJson(
      this,
    );
  }
}

abstract class _MemberPermission implements MemberPermission {
  const factory _MemberPermission(
          {final PermissionInfo? permission,
          final PermissionStatus? status,
          @JsonKey(name: 'grant_details') final GrantDetails? grantDetails,
          @JsonKey(name: 'effective_status') final String? effectiveStatus}) =
      _$MemberPermissionImpl;

  factory _MemberPermission.fromJson(Map<String, dynamic> json) =
      _$MemberPermissionImpl.fromJson;

  @override
  PermissionInfo? get permission;
  @override
  PermissionStatus? get status;
  @override
  @JsonKey(name: 'grant_details')
  GrantDetails? get grantDetails;
  @override
  @JsonKey(name: 'effective_status')
  String? get effectiveStatus;

  /// Create a copy of MemberPermission
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MemberPermissionImplCopyWith<_$MemberPermissionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
