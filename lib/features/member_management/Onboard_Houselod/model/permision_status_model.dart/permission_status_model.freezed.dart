// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permission_status_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PermissionStatus _$PermissionStatusFromJson(Map<String, dynamic> json) {
  return _PermissionStatus.fromJson(json);
}

/// @nodoc
mixin _$PermissionStatus {
  @JsonKey(name: 'is_granted')
  bool? get isGranted => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool? get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_expired')
  bool? get isExpired => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_conditions')
  bool? get hasConditions => throw _privateConstructorUsedError;
  @JsonKey(name: 'grant_source')
  String? get grantSource => throw _privateConstructorUsedError;
  @JsonKey(name: 'role_granted')
  bool? get roleGranted => throw _privateConstructorUsedError;

  /// Serializes this PermissionStatus to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PermissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermissionStatusCopyWith<PermissionStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermissionStatusCopyWith<$Res> {
  factory $PermissionStatusCopyWith(
          PermissionStatus value, $Res Function(PermissionStatus) then) =
      _$PermissionStatusCopyWithImpl<$Res, PermissionStatus>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_granted') bool? isGranted,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'is_expired') bool? isExpired,
      @JsonKey(name: 'has_conditions') bool? hasConditions,
      @JsonKey(name: 'grant_source') String? grantSource,
      @JsonKey(name: 'role_granted') bool? roleGranted});
}

/// @nodoc
class _$PermissionStatusCopyWithImpl<$Res, $Val extends PermissionStatus>
    implements $PermissionStatusCopyWith<$Res> {
  _$PermissionStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PermissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isGranted = freezed,
    Object? isActive = freezed,
    Object? isExpired = freezed,
    Object? hasConditions = freezed,
    Object? grantSource = freezed,
    Object? roleGranted = freezed,
  }) {
    return _then(_value.copyWith(
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
      hasConditions: freezed == hasConditions
          ? _value.hasConditions
          : hasConditions // ignore: cast_nullable_to_non_nullable
              as bool?,
      grantSource: freezed == grantSource
          ? _value.grantSource
          : grantSource // ignore: cast_nullable_to_non_nullable
              as String?,
      roleGranted: freezed == roleGranted
          ? _value.roleGranted
          : roleGranted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PermissionStatusImplCopyWith<$Res>
    implements $PermissionStatusCopyWith<$Res> {
  factory _$$PermissionStatusImplCopyWith(_$PermissionStatusImpl value,
          $Res Function(_$PermissionStatusImpl) then) =
      __$$PermissionStatusImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_granted') bool? isGranted,
      @JsonKey(name: 'is_active') bool? isActive,
      @JsonKey(name: 'is_expired') bool? isExpired,
      @JsonKey(name: 'has_conditions') bool? hasConditions,
      @JsonKey(name: 'grant_source') String? grantSource,
      @JsonKey(name: 'role_granted') bool? roleGranted});
}

/// @nodoc
class __$$PermissionStatusImplCopyWithImpl<$Res>
    extends _$PermissionStatusCopyWithImpl<$Res, _$PermissionStatusImpl>
    implements _$$PermissionStatusImplCopyWith<$Res> {
  __$$PermissionStatusImplCopyWithImpl(_$PermissionStatusImpl _value,
      $Res Function(_$PermissionStatusImpl) _then)
      : super(_value, _then);

  /// Create a copy of PermissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isGranted = freezed,
    Object? isActive = freezed,
    Object? isExpired = freezed,
    Object? hasConditions = freezed,
    Object? grantSource = freezed,
    Object? roleGranted = freezed,
  }) {
    return _then(_$PermissionStatusImpl(
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
      hasConditions: freezed == hasConditions
          ? _value.hasConditions
          : hasConditions // ignore: cast_nullable_to_non_nullable
              as bool?,
      grantSource: freezed == grantSource
          ? _value.grantSource
          : grantSource // ignore: cast_nullable_to_non_nullable
              as String?,
      roleGranted: freezed == roleGranted
          ? _value.roleGranted
          : roleGranted // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PermissionStatusImpl implements _PermissionStatus {
  const _$PermissionStatusImpl(
      {@JsonKey(name: 'is_granted') this.isGranted,
      @JsonKey(name: 'is_active') this.isActive,
      @JsonKey(name: 'is_expired') this.isExpired,
      @JsonKey(name: 'has_conditions') this.hasConditions,
      @JsonKey(name: 'grant_source') this.grantSource,
      @JsonKey(name: 'role_granted') this.roleGranted});

  factory _$PermissionStatusImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermissionStatusImplFromJson(json);

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
  @JsonKey(name: 'has_conditions')
  final bool? hasConditions;
  @override
  @JsonKey(name: 'grant_source')
  final String? grantSource;
  @override
  @JsonKey(name: 'role_granted')
  final bool? roleGranted;

  @override
  String toString() {
    return 'PermissionStatus(isGranted: $isGranted, isActive: $isActive, isExpired: $isExpired, hasConditions: $hasConditions, grantSource: $grantSource, roleGranted: $roleGranted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermissionStatusImpl &&
            (identical(other.isGranted, isGranted) ||
                other.isGranted == isGranted) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isExpired, isExpired) ||
                other.isExpired == isExpired) &&
            (identical(other.hasConditions, hasConditions) ||
                other.hasConditions == hasConditions) &&
            (identical(other.grantSource, grantSource) ||
                other.grantSource == grantSource) &&
            (identical(other.roleGranted, roleGranted) ||
                other.roleGranted == roleGranted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, isGranted, isActive, isExpired,
      hasConditions, grantSource, roleGranted);

  /// Create a copy of PermissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermissionStatusImplCopyWith<_$PermissionStatusImpl> get copyWith =>
      __$$PermissionStatusImplCopyWithImpl<_$PermissionStatusImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermissionStatusImplToJson(
      this,
    );
  }
}

abstract class _PermissionStatus implements PermissionStatus {
  const factory _PermissionStatus(
          {@JsonKey(name: 'is_granted') final bool? isGranted,
          @JsonKey(name: 'is_active') final bool? isActive,
          @JsonKey(name: 'is_expired') final bool? isExpired,
          @JsonKey(name: 'has_conditions') final bool? hasConditions,
          @JsonKey(name: 'grant_source') final String? grantSource,
          @JsonKey(name: 'role_granted') final bool? roleGranted}) =
      _$PermissionStatusImpl;

  factory _PermissionStatus.fromJson(Map<String, dynamic> json) =
      _$PermissionStatusImpl.fromJson;

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
  @JsonKey(name: 'has_conditions')
  bool? get hasConditions;
  @override
  @JsonKey(name: 'grant_source')
  String? get grantSource;
  @override
  @JsonKey(name: 'role_granted')
  bool? get roleGranted;

  /// Create a copy of PermissionStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermissionStatusImplCopyWith<_$PermissionStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
