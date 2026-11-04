// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_permissions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccessPermissions _$AccessPermissionsFromJson(Map<String, dynamic> json) {
  return _AccessPermissions.fromJson(json);
}

/// @nodoc
mixin _$AccessPermissions {
  @JsonKey(name: 'gate_access')
  bool? get gateAccess => throw _privateConstructorUsedError;
  @JsonKey(name: 'night_access')
  bool? get nightAccess => throw _privateConstructorUsedError;
  @JsonKey(name: 'facility_access')
  bool? get facilityAccess => throw _privateConstructorUsedError;
  @JsonKey(name: 'emergency_access')
  bool? get emergencyAccess => throw _privateConstructorUsedError;

  /// Serializes this AccessPermissions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccessPermissions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccessPermissionsCopyWith<AccessPermissions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessPermissionsCopyWith<$Res> {
  factory $AccessPermissionsCopyWith(
          AccessPermissions value, $Res Function(AccessPermissions) then) =
      _$AccessPermissionsCopyWithImpl<$Res, AccessPermissions>;
  @useResult
  $Res call(
      {@JsonKey(name: 'gate_access') bool? gateAccess,
      @JsonKey(name: 'night_access') bool? nightAccess,
      @JsonKey(name: 'facility_access') bool? facilityAccess,
      @JsonKey(name: 'emergency_access') bool? emergencyAccess});
}

/// @nodoc
class _$AccessPermissionsCopyWithImpl<$Res, $Val extends AccessPermissions>
    implements $AccessPermissionsCopyWith<$Res> {
  _$AccessPermissionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccessPermissions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gateAccess = freezed,
    Object? nightAccess = freezed,
    Object? facilityAccess = freezed,
    Object? emergencyAccess = freezed,
  }) {
    return _then(_value.copyWith(
      gateAccess: freezed == gateAccess
          ? _value.gateAccess
          : gateAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      nightAccess: freezed == nightAccess
          ? _value.nightAccess
          : nightAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      facilityAccess: freezed == facilityAccess
          ? _value.facilityAccess
          : facilityAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      emergencyAccess: freezed == emergencyAccess
          ? _value.emergencyAccess
          : emergencyAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccessPermissionsImplCopyWith<$Res>
    implements $AccessPermissionsCopyWith<$Res> {
  factory _$$AccessPermissionsImplCopyWith(_$AccessPermissionsImpl value,
          $Res Function(_$AccessPermissionsImpl) then) =
      __$$AccessPermissionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'gate_access') bool? gateAccess,
      @JsonKey(name: 'night_access') bool? nightAccess,
      @JsonKey(name: 'facility_access') bool? facilityAccess,
      @JsonKey(name: 'emergency_access') bool? emergencyAccess});
}

/// @nodoc
class __$$AccessPermissionsImplCopyWithImpl<$Res>
    extends _$AccessPermissionsCopyWithImpl<$Res, _$AccessPermissionsImpl>
    implements _$$AccessPermissionsImplCopyWith<$Res> {
  __$$AccessPermissionsImplCopyWithImpl(_$AccessPermissionsImpl _value,
      $Res Function(_$AccessPermissionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccessPermissions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gateAccess = freezed,
    Object? nightAccess = freezed,
    Object? facilityAccess = freezed,
    Object? emergencyAccess = freezed,
  }) {
    return _then(_$AccessPermissionsImpl(
      gateAccess: freezed == gateAccess
          ? _value.gateAccess
          : gateAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      nightAccess: freezed == nightAccess
          ? _value.nightAccess
          : nightAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      facilityAccess: freezed == facilityAccess
          ? _value.facilityAccess
          : facilityAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      emergencyAccess: freezed == emergencyAccess
          ? _value.emergencyAccess
          : emergencyAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$AccessPermissionsImpl implements _AccessPermissions {
  const _$AccessPermissionsImpl(
      {@JsonKey(name: 'gate_access') this.gateAccess,
      @JsonKey(name: 'night_access') this.nightAccess,
      @JsonKey(name: 'facility_access') this.facilityAccess,
      @JsonKey(name: 'emergency_access') this.emergencyAccess});

  factory _$AccessPermissionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$AccessPermissionsImplFromJson(json);

  @override
  @JsonKey(name: 'gate_access')
  final bool? gateAccess;
  @override
  @JsonKey(name: 'night_access')
  final bool? nightAccess;
  @override
  @JsonKey(name: 'facility_access')
  final bool? facilityAccess;
  @override
  @JsonKey(name: 'emergency_access')
  final bool? emergencyAccess;

  @override
  String toString() {
    return 'AccessPermissions(gateAccess: $gateAccess, nightAccess: $nightAccess, facilityAccess: $facilityAccess, emergencyAccess: $emergencyAccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessPermissionsImpl &&
            (identical(other.gateAccess, gateAccess) ||
                other.gateAccess == gateAccess) &&
            (identical(other.nightAccess, nightAccess) ||
                other.nightAccess == nightAccess) &&
            (identical(other.facilityAccess, facilityAccess) ||
                other.facilityAccess == facilityAccess) &&
            (identical(other.emergencyAccess, emergencyAccess) ||
                other.emergencyAccess == emergencyAccess));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, gateAccess, nightAccess, facilityAccess, emergencyAccess);

  /// Create a copy of AccessPermissions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessPermissionsImplCopyWith<_$AccessPermissionsImpl> get copyWith =>
      __$$AccessPermissionsImplCopyWithImpl<_$AccessPermissionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccessPermissionsImplToJson(
      this,
    );
  }
}

abstract class _AccessPermissions implements AccessPermissions {
  const factory _AccessPermissions(
          {@JsonKey(name: 'gate_access') final bool? gateAccess,
          @JsonKey(name: 'night_access') final bool? nightAccess,
          @JsonKey(name: 'facility_access') final bool? facilityAccess,
          @JsonKey(name: 'emergency_access') final bool? emergencyAccess}) =
      _$AccessPermissionsImpl;

  factory _AccessPermissions.fromJson(Map<String, dynamic> json) =
      _$AccessPermissionsImpl.fromJson;

  @override
  @JsonKey(name: 'gate_access')
  bool? get gateAccess;
  @override
  @JsonKey(name: 'night_access')
  bool? get nightAccess;
  @override
  @JsonKey(name: 'facility_access')
  bool? get facilityAccess;
  @override
  @JsonKey(name: 'emergency_access')
  bool? get emergencyAccess;

  /// Create a copy of AccessPermissions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccessPermissionsImplCopyWith<_$AccessPermissionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
