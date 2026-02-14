// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'household_permissions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HouseholdPermissions _$HouseholdPermissionsFromJson(Map<String, dynamic> json) {
  return _HouseholdPermissions.fromJson(json);
}

/// @nodoc
mixin _$HouseholdPermissions {
  GateAccess? get gateAccess => throw _privateConstructorUsedError;
  NightAccess? get nightAccess => throw _privateConstructorUsedError;
  FacilityAccess? get facilityAccess => throw _privateConstructorUsedError;
  VisitorInvitation? get visitorInvitation =>
      throw _privateConstructorUsedError;

  /// Serializes this HouseholdPermissions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HouseholdPermissions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HouseholdPermissionsCopyWith<HouseholdPermissions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdPermissionsCopyWith<$Res> {
  factory $HouseholdPermissionsCopyWith(HouseholdPermissions value,
          $Res Function(HouseholdPermissions) then) =
      _$HouseholdPermissionsCopyWithImpl<$Res, HouseholdPermissions>;
  @useResult
  $Res call(
      {GateAccess? gateAccess,
      NightAccess? nightAccess,
      FacilityAccess? facilityAccess,
      VisitorInvitation? visitorInvitation});

  $GateAccessCopyWith<$Res>? get gateAccess;
  $NightAccessCopyWith<$Res>? get nightAccess;
  $FacilityAccessCopyWith<$Res>? get facilityAccess;
  $VisitorInvitationCopyWith<$Res>? get visitorInvitation;
}

/// @nodoc
class _$HouseholdPermissionsCopyWithImpl<$Res,
        $Val extends HouseholdPermissions>
    implements $HouseholdPermissionsCopyWith<$Res> {
  _$HouseholdPermissionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HouseholdPermissions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gateAccess = freezed,
    Object? nightAccess = freezed,
    Object? facilityAccess = freezed,
    Object? visitorInvitation = freezed,
  }) {
    return _then(_value.copyWith(
      gateAccess: freezed == gateAccess
          ? _value.gateAccess
          : gateAccess // ignore: cast_nullable_to_non_nullable
              as GateAccess?,
      nightAccess: freezed == nightAccess
          ? _value.nightAccess
          : nightAccess // ignore: cast_nullable_to_non_nullable
              as NightAccess?,
      facilityAccess: freezed == facilityAccess
          ? _value.facilityAccess
          : facilityAccess // ignore: cast_nullable_to_non_nullable
              as FacilityAccess?,
      visitorInvitation: freezed == visitorInvitation
          ? _value.visitorInvitation
          : visitorInvitation // ignore: cast_nullable_to_non_nullable
              as VisitorInvitation?,
    ) as $Val);
  }

  /// Create a copy of HouseholdPermissions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GateAccessCopyWith<$Res>? get gateAccess {
    if (_value.gateAccess == null) {
      return null;
    }

    return $GateAccessCopyWith<$Res>(_value.gateAccess!, (value) {
      return _then(_value.copyWith(gateAccess: value) as $Val);
    });
  }

  /// Create a copy of HouseholdPermissions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $NightAccessCopyWith<$Res>? get nightAccess {
    if (_value.nightAccess == null) {
      return null;
    }

    return $NightAccessCopyWith<$Res>(_value.nightAccess!, (value) {
      return _then(_value.copyWith(nightAccess: value) as $Val);
    });
  }

  /// Create a copy of HouseholdPermissions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FacilityAccessCopyWith<$Res>? get facilityAccess {
    if (_value.facilityAccess == null) {
      return null;
    }

    return $FacilityAccessCopyWith<$Res>(_value.facilityAccess!, (value) {
      return _then(_value.copyWith(facilityAccess: value) as $Val);
    });
  }

  /// Create a copy of HouseholdPermissions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VisitorInvitationCopyWith<$Res>? get visitorInvitation {
    if (_value.visitorInvitation == null) {
      return null;
    }

    return $VisitorInvitationCopyWith<$Res>(_value.visitorInvitation!, (value) {
      return _then(_value.copyWith(visitorInvitation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HouseholdPermissionsImplCopyWith<$Res>
    implements $HouseholdPermissionsCopyWith<$Res> {
  factory _$$HouseholdPermissionsImplCopyWith(_$HouseholdPermissionsImpl value,
          $Res Function(_$HouseholdPermissionsImpl) then) =
      __$$HouseholdPermissionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {GateAccess? gateAccess,
      NightAccess? nightAccess,
      FacilityAccess? facilityAccess,
      VisitorInvitation? visitorInvitation});

  @override
  $GateAccessCopyWith<$Res>? get gateAccess;
  @override
  $NightAccessCopyWith<$Res>? get nightAccess;
  @override
  $FacilityAccessCopyWith<$Res>? get facilityAccess;
  @override
  $VisitorInvitationCopyWith<$Res>? get visitorInvitation;
}

/// @nodoc
class __$$HouseholdPermissionsImplCopyWithImpl<$Res>
    extends _$HouseholdPermissionsCopyWithImpl<$Res, _$HouseholdPermissionsImpl>
    implements _$$HouseholdPermissionsImplCopyWith<$Res> {
  __$$HouseholdPermissionsImplCopyWithImpl(_$HouseholdPermissionsImpl _value,
      $Res Function(_$HouseholdPermissionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of HouseholdPermissions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gateAccess = freezed,
    Object? nightAccess = freezed,
    Object? facilityAccess = freezed,
    Object? visitorInvitation = freezed,
  }) {
    return _then(_$HouseholdPermissionsImpl(
      gateAccess: freezed == gateAccess
          ? _value.gateAccess
          : gateAccess // ignore: cast_nullable_to_non_nullable
              as GateAccess?,
      nightAccess: freezed == nightAccess
          ? _value.nightAccess
          : nightAccess // ignore: cast_nullable_to_non_nullable
              as NightAccess?,
      facilityAccess: freezed == facilityAccess
          ? _value.facilityAccess
          : facilityAccess // ignore: cast_nullable_to_non_nullable
              as FacilityAccess?,
      visitorInvitation: freezed == visitorInvitation
          ? _value.visitorInvitation
          : visitorInvitation // ignore: cast_nullable_to_non_nullable
              as VisitorInvitation?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$HouseholdPermissionsImpl implements _HouseholdPermissions {
  const _$HouseholdPermissionsImpl(
      {this.gateAccess,
      this.nightAccess,
      this.facilityAccess,
      this.visitorInvitation});

  factory _$HouseholdPermissionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseholdPermissionsImplFromJson(json);

  @override
  final GateAccess? gateAccess;
  @override
  final NightAccess? nightAccess;
  @override
  final FacilityAccess? facilityAccess;
  @override
  final VisitorInvitation? visitorInvitation;

  @override
  String toString() {
    return 'HouseholdPermissions(gateAccess: $gateAccess, nightAccess: $nightAccess, facilityAccess: $facilityAccess, visitorInvitation: $visitorInvitation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdPermissionsImpl &&
            (identical(other.gateAccess, gateAccess) ||
                other.gateAccess == gateAccess) &&
            (identical(other.nightAccess, nightAccess) ||
                other.nightAccess == nightAccess) &&
            (identical(other.facilityAccess, facilityAccess) ||
                other.facilityAccess == facilityAccess) &&
            (identical(other.visitorInvitation, visitorInvitation) ||
                other.visitorInvitation == visitorInvitation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, gateAccess, nightAccess, facilityAccess, visitorInvitation);

  /// Create a copy of HouseholdPermissions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdPermissionsImplCopyWith<_$HouseholdPermissionsImpl>
      get copyWith =>
          __$$HouseholdPermissionsImplCopyWithImpl<_$HouseholdPermissionsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HouseholdPermissionsImplToJson(
      this,
    );
  }
}

abstract class _HouseholdPermissions implements HouseholdPermissions {
  const factory _HouseholdPermissions(
      {final GateAccess? gateAccess,
      final NightAccess? nightAccess,
      final FacilityAccess? facilityAccess,
      final VisitorInvitation? visitorInvitation}) = _$HouseholdPermissionsImpl;

  factory _HouseholdPermissions.fromJson(Map<String, dynamic> json) =
      _$HouseholdPermissionsImpl.fromJson;

  @override
  GateAccess? get gateAccess;
  @override
  NightAccess? get nightAccess;
  @override
  FacilityAccess? get facilityAccess;
  @override
  VisitorInvitation? get visitorInvitation;

  /// Create a copy of HouseholdPermissions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HouseholdPermissionsImplCopyWith<_$HouseholdPermissionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
