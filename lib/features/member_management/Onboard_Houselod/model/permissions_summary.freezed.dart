// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permissions_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PermissionsSummary _$PermissionsSummaryFromJson(Map<String, dynamic> json) {
  return _PermissionsSummary.fromJson(json);
}

/// @nodoc
mixin _$PermissionsSummary {
  @JsonKey(name: 'total_permissions')
  int? get totalPermissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_permissions')
  List<dynamic>? get activePermissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'detailed_permissions')
  List<dynamic>? get detailedPermissions => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_gate_access')
  bool? get hasGateAccess => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_facility_access')
  bool? get hasFacilityAccess => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_parking_access')
  bool? get hasParkingAccess => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_visitor_invitation')
  bool? get hasVisitorInvitation => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_night_access')
  bool? get hasNightAccess => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_maintenance_request')
  bool? get hasMaintenanceRequest => throw _privateConstructorUsedError;

  /// Serializes this PermissionsSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PermissionsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermissionsSummaryCopyWith<PermissionsSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionsSummaryCopyWith<$Res> {
  factory $PermissionsSummaryCopyWith(
          PermissionsSummary value, $Res Function(PermissionsSummary) then) =
      _$PermissionsSummaryCopyWithImpl<$Res, PermissionsSummary>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_permissions') int? totalPermissions,
      @JsonKey(name: 'active_permissions') List<dynamic>? activePermissions,
      @JsonKey(name: 'detailed_permissions') List<dynamic>? detailedPermissions,
      @JsonKey(name: 'has_gate_access') bool? hasGateAccess,
      @JsonKey(name: 'has_facility_access') bool? hasFacilityAccess,
      @JsonKey(name: 'has_parking_access') bool? hasParkingAccess,
      @JsonKey(name: 'has_visitor_invitation') bool? hasVisitorInvitation,
      @JsonKey(name: 'has_night_access') bool? hasNightAccess,
      @JsonKey(name: 'has_maintenance_request') bool? hasMaintenanceRequest});
}

/// @nodoc
class _$PermissionsSummaryCopyWithImpl<$Res, $Val extends PermissionsSummary>
    implements $PermissionsSummaryCopyWith<$Res> {
  _$PermissionsSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PermissionsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPermissions = freezed,
    Object? activePermissions = freezed,
    Object? detailedPermissions = freezed,
    Object? hasGateAccess = freezed,
    Object? hasFacilityAccess = freezed,
    Object? hasParkingAccess = freezed,
    Object? hasVisitorInvitation = freezed,
    Object? hasNightAccess = freezed,
    Object? hasMaintenanceRequest = freezed,
  }) {
    return _then(_value.copyWith(
      totalPermissions: freezed == totalPermissions
          ? _value.totalPermissions
          : totalPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      activePermissions: freezed == activePermissions
          ? _value.activePermissions
          : activePermissions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      detailedPermissions: freezed == detailedPermissions
          ? _value.detailedPermissions
          : detailedPermissions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      hasGateAccess: freezed == hasGateAccess
          ? _value.hasGateAccess
          : hasGateAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasFacilityAccess: freezed == hasFacilityAccess
          ? _value.hasFacilityAccess
          : hasFacilityAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasParkingAccess: freezed == hasParkingAccess
          ? _value.hasParkingAccess
          : hasParkingAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasVisitorInvitation: freezed == hasVisitorInvitation
          ? _value.hasVisitorInvitation
          : hasVisitorInvitation // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasNightAccess: freezed == hasNightAccess
          ? _value.hasNightAccess
          : hasNightAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasMaintenanceRequest: freezed == hasMaintenanceRequest
          ? _value.hasMaintenanceRequest
          : hasMaintenanceRequest // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionsSummaryImplCopyWith<$Res>
    implements $PermissionsSummaryCopyWith<$Res> {
  factory _$$PermissionsSummaryImplCopyWith(_$PermissionsSummaryImpl value,
          $Res Function(_$PermissionsSummaryImpl) then) =
      __$$PermissionsSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_permissions') int? totalPermissions,
      @JsonKey(name: 'active_permissions') List<dynamic>? activePermissions,
      @JsonKey(name: 'detailed_permissions') List<dynamic>? detailedPermissions,
      @JsonKey(name: 'has_gate_access') bool? hasGateAccess,
      @JsonKey(name: 'has_facility_access') bool? hasFacilityAccess,
      @JsonKey(name: 'has_parking_access') bool? hasParkingAccess,
      @JsonKey(name: 'has_visitor_invitation') bool? hasVisitorInvitation,
      @JsonKey(name: 'has_night_access') bool? hasNightAccess,
      @JsonKey(name: 'has_maintenance_request') bool? hasMaintenanceRequest});
}

/// @nodoc
class __$$PermissionsSummaryImplCopyWithImpl<$Res>
    extends _$PermissionsSummaryCopyWithImpl<$Res, _$PermissionsSummaryImpl>
    implements _$$PermissionsSummaryImplCopyWith<$Res> {
  __$$PermissionsSummaryImplCopyWithImpl(_$PermissionsSummaryImpl _value,
      $Res Function(_$PermissionsSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PermissionsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPermissions = freezed,
    Object? activePermissions = freezed,
    Object? detailedPermissions = freezed,
    Object? hasGateAccess = freezed,
    Object? hasFacilityAccess = freezed,
    Object? hasParkingAccess = freezed,
    Object? hasVisitorInvitation = freezed,
    Object? hasNightAccess = freezed,
    Object? hasMaintenanceRequest = freezed,
  }) {
    return _then(_$PermissionsSummaryImpl(
      totalPermissions: freezed == totalPermissions
          ? _value.totalPermissions
          : totalPermissions // ignore: cast_nullable_to_non_nullable
              as int?,
      activePermissions: freezed == activePermissions
          ? _value._activePermissions
          : activePermissions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      detailedPermissions: freezed == detailedPermissions
          ? _value._detailedPermissions
          : detailedPermissions // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      hasGateAccess: freezed == hasGateAccess
          ? _value.hasGateAccess
          : hasGateAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasFacilityAccess: freezed == hasFacilityAccess
          ? _value.hasFacilityAccess
          : hasFacilityAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasParkingAccess: freezed == hasParkingAccess
          ? _value.hasParkingAccess
          : hasParkingAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasVisitorInvitation: freezed == hasVisitorInvitation
          ? _value.hasVisitorInvitation
          : hasVisitorInvitation // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasNightAccess: freezed == hasNightAccess
          ? _value.hasNightAccess
          : hasNightAccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasMaintenanceRequest: freezed == hasMaintenanceRequest
          ? _value.hasMaintenanceRequest
          : hasMaintenanceRequest // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PermissionsSummaryImpl implements _PermissionsSummary {
  const _$PermissionsSummaryImpl(
      {@JsonKey(name: 'total_permissions') this.totalPermissions,
      @JsonKey(name: 'active_permissions')
      final List<dynamic>? activePermissions,
      @JsonKey(name: 'detailed_permissions')
      final List<dynamic>? detailedPermissions,
      @JsonKey(name: 'has_gate_access') this.hasGateAccess,
      @JsonKey(name: 'has_facility_access') this.hasFacilityAccess,
      @JsonKey(name: 'has_parking_access') this.hasParkingAccess,
      @JsonKey(name: 'has_visitor_invitation') this.hasVisitorInvitation,
      @JsonKey(name: 'has_night_access') this.hasNightAccess,
      @JsonKey(name: 'has_maintenance_request') this.hasMaintenanceRequest})
      : _activePermissions = activePermissions,
        _detailedPermissions = detailedPermissions;

  factory _$PermissionsSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionsSummaryImplFromJson(json);

  @override
  @JsonKey(name: 'total_permissions')
  final int? totalPermissions;
  final List<dynamic>? _activePermissions;
  @override
  @JsonKey(name: 'active_permissions')
  List<dynamic>? get activePermissions {
    final value = _activePermissions;
    if (value == null) return null;
    if (_activePermissions is EqualUnmodifiableListView)
      return _activePermissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _detailedPermissions;
  @override
  @JsonKey(name: 'detailed_permissions')
  List<dynamic>? get detailedPermissions {
    final value = _detailedPermissions;
    if (value == null) return null;
    if (_detailedPermissions is EqualUnmodifiableListView)
      return _detailedPermissions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'has_gate_access')
  final bool? hasGateAccess;
  @override
  @JsonKey(name: 'has_facility_access')
  final bool? hasFacilityAccess;
  @override
  @JsonKey(name: 'has_parking_access')
  final bool? hasParkingAccess;
  @override
  @JsonKey(name: 'has_visitor_invitation')
  final bool? hasVisitorInvitation;
  @override
  @JsonKey(name: 'has_night_access')
  final bool? hasNightAccess;
  @override
  @JsonKey(name: 'has_maintenance_request')
  final bool? hasMaintenanceRequest;

  @override
  String toString() {
    return 'PermissionsSummary(totalPermissions: $totalPermissions, activePermissions: $activePermissions, detailedPermissions: $detailedPermissions, hasGateAccess: $hasGateAccess, hasFacilityAccess: $hasFacilityAccess, hasParkingAccess: $hasParkingAccess, hasVisitorInvitation: $hasVisitorInvitation, hasNightAccess: $hasNightAccess, hasMaintenanceRequest: $hasMaintenanceRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionsSummaryImpl &&
            (identical(other.totalPermissions, totalPermissions) ||
                other.totalPermissions == totalPermissions) &&
            const DeepCollectionEquality()
                .equals(other._activePermissions, _activePermissions) &&
            const DeepCollectionEquality()
                .equals(other._detailedPermissions, _detailedPermissions) &&
            (identical(other.hasGateAccess, hasGateAccess) ||
                other.hasGateAccess == hasGateAccess) &&
            (identical(other.hasFacilityAccess, hasFacilityAccess) ||
                other.hasFacilityAccess == hasFacilityAccess) &&
            (identical(other.hasParkingAccess, hasParkingAccess) ||
                other.hasParkingAccess == hasParkingAccess) &&
            (identical(other.hasVisitorInvitation, hasVisitorInvitation) ||
                other.hasVisitorInvitation == hasVisitorInvitation) &&
            (identical(other.hasNightAccess, hasNightAccess) ||
                other.hasNightAccess == hasNightAccess) &&
            (identical(other.hasMaintenanceRequest, hasMaintenanceRequest) ||
                other.hasMaintenanceRequest == hasMaintenanceRequest));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalPermissions,
      const DeepCollectionEquality().hash(_activePermissions),
      const DeepCollectionEquality().hash(_detailedPermissions),
      hasGateAccess,
      hasFacilityAccess,
      hasParkingAccess,
      hasVisitorInvitation,
      hasNightAccess,
      hasMaintenanceRequest);

  /// Create a copy of PermissionsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionsSummaryImplCopyWith<_$PermissionsSummaryImpl> get copyWith =>
      __$$PermissionsSummaryImplCopyWithImpl<_$PermissionsSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionsSummaryImplToJson(
      this,
    );
  }
}

abstract class _PermissionsSummary implements PermissionsSummary {
  const factory _PermissionsSummary(
      {@JsonKey(name: 'total_permissions') final int? totalPermissions,
      @JsonKey(name: 'active_permissions')
      final List<dynamic>? activePermissions,
      @JsonKey(name: 'detailed_permissions')
      final List<dynamic>? detailedPermissions,
      @JsonKey(name: 'has_gate_access') final bool? hasGateAccess,
      @JsonKey(name: 'has_facility_access') final bool? hasFacilityAccess,
      @JsonKey(name: 'has_parking_access') final bool? hasParkingAccess,
      @JsonKey(name: 'has_visitor_invitation') final bool? hasVisitorInvitation,
      @JsonKey(name: 'has_night_access') final bool? hasNightAccess,
      @JsonKey(name: 'has_maintenance_request')
      final bool? hasMaintenanceRequest}) = _$PermissionsSummaryImpl;

  factory _PermissionsSummary.fromJson(Map<String, dynamic> json) =
      _$PermissionsSummaryImpl.fromJson;

  @override
  @JsonKey(name: 'total_permissions')
  int? get totalPermissions;
  @override
  @JsonKey(name: 'active_permissions')
  List<dynamic>? get activePermissions;
  @override
  @JsonKey(name: 'detailed_permissions')
  List<dynamic>? get detailedPermissions;
  @override
  @JsonKey(name: 'has_gate_access')
  bool? get hasGateAccess;
  @override
  @JsonKey(name: 'has_facility_access')
  bool? get hasFacilityAccess;
  @override
  @JsonKey(name: 'has_parking_access')
  bool? get hasParkingAccess;
  @override
  @JsonKey(name: 'has_visitor_invitation')
  bool? get hasVisitorInvitation;
  @override
  @JsonKey(name: 'has_night_access')
  bool? get hasNightAccess;
  @override
  @JsonKey(name: 'has_maintenance_request')
  bool? get hasMaintenanceRequest;

  /// Create a copy of PermissionsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionsSummaryImplCopyWith<_$PermissionsSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
