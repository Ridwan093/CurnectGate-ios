// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'digital_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DigitalId _$DigitalIdFromJson(Map<String, dynamic> json) {
  return _DigitalId.fromJson(json);
}

/// @nodoc
mixin _$DigitalId {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'estate_id')
  int? get estateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'digital_id_code')
  String? get digitalIdCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'qr_code_url')
  String? get qrCodeUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'qr_code_public_id')
  String? get qrCodePublicId => throw _privateConstructorUsedError;
  @JsonKey(name: 'qr_code_data')
  String? get qrCodeData => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'access_permissions')
  AccessPermissions? get accessPermissions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'restrictions')
  dynamic get restrictions => throw _privateConstructorUsedError;
  @JsonKey(name: 'deactivation_reason')
  dynamic get deactivationReason => throw _privateConstructorUsedError;
  @JsonKey(name: 'deactivated_by')
  int? get deactivatedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  int? get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'activated_at')
  String? get activatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'deactivated_at')
  dynamic get deactivatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_used_at')
  String? get lastUsedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'usage_count')
  int? get usageCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this DigitalId to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DigitalId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DigitalIdCopyWith<DigitalId> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DigitalIdCopyWith<$Res> {
  factory $DigitalIdCopyWith(DigitalId value, $Res Function(DigitalId) then) =
      _$DigitalIdCopyWithImpl<$Res, DigitalId>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'estate_id') int? estateId,
      @JsonKey(name: 'digital_id_code') String? digitalIdCode,
      @JsonKey(name: 'qr_code_url') String? qrCodeUrl,
      @JsonKey(name: 'qr_code_public_id') String? qrCodePublicId,
      @JsonKey(name: 'qr_code_data') String? qrCodeData,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'access_permissions') AccessPermissions? accessPermissions,
      @JsonKey(name: 'restrictions') dynamic restrictions,
      @JsonKey(name: 'deactivation_reason') dynamic deactivationReason,
      @JsonKey(name: 'deactivated_by') int? deactivatedBy,
      @JsonKey(name: 'created_by') int? createdBy,
      @JsonKey(name: 'activated_at') String? activatedAt,
      @JsonKey(name: 'deactivated_at') dynamic deactivatedAt,
      @JsonKey(name: 'last_used_at') String? lastUsedAt,
      @JsonKey(name: 'usage_count') int? usageCount,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});

  $AccessPermissionsCopyWith<$Res>? get accessPermissions;
}

/// @nodoc
class _$DigitalIdCopyWithImpl<$Res, $Val extends DigitalId>
    implements $DigitalIdCopyWith<$Res> {
  _$DigitalIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DigitalId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? estateId = freezed,
    Object? digitalIdCode = freezed,
    Object? qrCodeUrl = freezed,
    Object? qrCodePublicId = freezed,
    Object? qrCodeData = freezed,
    Object? status = freezed,
    Object? accessPermissions = freezed,
    Object? restrictions = freezed,
    Object? deactivationReason = freezed,
    Object? deactivatedBy = freezed,
    Object? createdBy = freezed,
    Object? activatedAt = freezed,
    Object? deactivatedAt = freezed,
    Object? lastUsedAt = freezed,
    Object? usageCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      digitalIdCode: freezed == digitalIdCode
          ? _value.digitalIdCode
          : digitalIdCode // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodeUrl: freezed == qrCodeUrl
          ? _value.qrCodeUrl
          : qrCodeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodePublicId: freezed == qrCodePublicId
          ? _value.qrCodePublicId
          : qrCodePublicId // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodeData: freezed == qrCodeData
          ? _value.qrCodeData
          : qrCodeData // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      accessPermissions: freezed == accessPermissions
          ? _value.accessPermissions
          : accessPermissions // ignore: cast_nullable_to_non_nullable
              as AccessPermissions?,
      restrictions: freezed == restrictions
          ? _value.restrictions
          : restrictions // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deactivationReason: freezed == deactivationReason
          ? _value.deactivationReason
          : deactivationReason // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deactivatedBy: freezed == deactivatedBy
          ? _value.deactivatedBy
          : deactivatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      activatedAt: freezed == activatedAt
          ? _value.activatedAt
          : activatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deactivatedAt: freezed == deactivatedAt
          ? _value.deactivatedAt
          : deactivatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastUsedAt: freezed == lastUsedAt
          ? _value.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      usageCount: freezed == usageCount
          ? _value.usageCount
          : usageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of DigitalId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AccessPermissionsCopyWith<$Res>? get accessPermissions {
    if (_value.accessPermissions == null) {
      return null;
    }

    return $AccessPermissionsCopyWith<$Res>(_value.accessPermissions!, (value) {
      return _then(_value.copyWith(accessPermissions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DigitalIdImplCopyWith<$Res>
    implements $DigitalIdCopyWith<$Res> {
  factory _$$DigitalIdImplCopyWith(
          _$DigitalIdImpl value, $Res Function(_$DigitalIdImpl) then) =
      __$$DigitalIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'estate_id') int? estateId,
      @JsonKey(name: 'digital_id_code') String? digitalIdCode,
      @JsonKey(name: 'qr_code_url') String? qrCodeUrl,
      @JsonKey(name: 'qr_code_public_id') String? qrCodePublicId,
      @JsonKey(name: 'qr_code_data') String? qrCodeData,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'access_permissions') AccessPermissions? accessPermissions,
      @JsonKey(name: 'restrictions') dynamic restrictions,
      @JsonKey(name: 'deactivation_reason') dynamic deactivationReason,
      @JsonKey(name: 'deactivated_by') int? deactivatedBy,
      @JsonKey(name: 'created_by') int? createdBy,
      @JsonKey(name: 'activated_at') String? activatedAt,
      @JsonKey(name: 'deactivated_at') dynamic deactivatedAt,
      @JsonKey(name: 'last_used_at') String? lastUsedAt,
      @JsonKey(name: 'usage_count') int? usageCount,
      @JsonKey(name: 'created_at') String? createdAt,
      @JsonKey(name: 'updated_at') String? updatedAt});

  @override
  $AccessPermissionsCopyWith<$Res>? get accessPermissions;
}

/// @nodoc
class __$$DigitalIdImplCopyWithImpl<$Res>
    extends _$DigitalIdCopyWithImpl<$Res, _$DigitalIdImpl>
    implements _$$DigitalIdImplCopyWith<$Res> {
  __$$DigitalIdImplCopyWithImpl(
      _$DigitalIdImpl _value, $Res Function(_$DigitalIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of DigitalId
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? estateId = freezed,
    Object? digitalIdCode = freezed,
    Object? qrCodeUrl = freezed,
    Object? qrCodePublicId = freezed,
    Object? qrCodeData = freezed,
    Object? status = freezed,
    Object? accessPermissions = freezed,
    Object? restrictions = freezed,
    Object? deactivationReason = freezed,
    Object? deactivatedBy = freezed,
    Object? createdBy = freezed,
    Object? activatedAt = freezed,
    Object? deactivatedAt = freezed,
    Object? lastUsedAt = freezed,
    Object? usageCount = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$DigitalIdImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      digitalIdCode: freezed == digitalIdCode
          ? _value.digitalIdCode
          : digitalIdCode // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodeUrl: freezed == qrCodeUrl
          ? _value.qrCodeUrl
          : qrCodeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodePublicId: freezed == qrCodePublicId
          ? _value.qrCodePublicId
          : qrCodePublicId // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCodeData: freezed == qrCodeData
          ? _value.qrCodeData
          : qrCodeData // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      accessPermissions: freezed == accessPermissions
          ? _value.accessPermissions
          : accessPermissions // ignore: cast_nullable_to_non_nullable
              as AccessPermissions?,
      restrictions: freezed == restrictions
          ? _value.restrictions
          : restrictions // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deactivationReason: freezed == deactivationReason
          ? _value.deactivationReason
          : deactivationReason // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deactivatedBy: freezed == deactivatedBy
          ? _value.deactivatedBy
          : deactivatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      activatedAt: freezed == activatedAt
          ? _value.activatedAt
          : activatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deactivatedAt: freezed == deactivatedAt
          ? _value.deactivatedAt
          : deactivatedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastUsedAt: freezed == lastUsedAt
          ? _value.lastUsedAt
          : lastUsedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      usageCount: freezed == usageCount
          ? _value.usageCount
          : usageCount // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$DigitalIdImpl implements _DigitalId {
  const _$DigitalIdImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'user_id') this.userId,
      @JsonKey(name: 'estate_id') this.estateId,
      @JsonKey(name: 'digital_id_code') this.digitalIdCode,
      @JsonKey(name: 'qr_code_url') this.qrCodeUrl,
      @JsonKey(name: 'qr_code_public_id') this.qrCodePublicId,
      @JsonKey(name: 'qr_code_data') this.qrCodeData,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'access_permissions') this.accessPermissions,
      @JsonKey(name: 'restrictions') this.restrictions,
      @JsonKey(name: 'deactivation_reason') this.deactivationReason,
      @JsonKey(name: 'deactivated_by') this.deactivatedBy,
      @JsonKey(name: 'created_by') this.createdBy,
      @JsonKey(name: 'activated_at') this.activatedAt,
      @JsonKey(name: 'deactivated_at') this.deactivatedAt,
      @JsonKey(name: 'last_used_at') this.lastUsedAt,
      @JsonKey(name: 'usage_count') this.usageCount,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'updated_at') this.updatedAt});

  factory _$DigitalIdImpl.fromJson(Map<String, dynamic> json) =>
      _$$DigitalIdImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'estate_id')
  final int? estateId;
  @override
  @JsonKey(name: 'digital_id_code')
  final String? digitalIdCode;
  @override
  @JsonKey(name: 'qr_code_url')
  final String? qrCodeUrl;
  @override
  @JsonKey(name: 'qr_code_public_id')
  final String? qrCodePublicId;
  @override
  @JsonKey(name: 'qr_code_data')
  final String? qrCodeData;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'access_permissions')
  final AccessPermissions? accessPermissions;
  @override
  @JsonKey(name: 'restrictions')
  final dynamic restrictions;
  @override
  @JsonKey(name: 'deactivation_reason')
  final dynamic deactivationReason;
  @override
  @JsonKey(name: 'deactivated_by')
  final int? deactivatedBy;
  @override
  @JsonKey(name: 'created_by')
  final int? createdBy;
  @override
  @JsonKey(name: 'activated_at')
  final String? activatedAt;
  @override
  @JsonKey(name: 'deactivated_at')
  final dynamic deactivatedAt;
  @override
  @JsonKey(name: 'last_used_at')
  final String? lastUsedAt;
  @override
  @JsonKey(name: 'usage_count')
  final int? usageCount;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String? updatedAt;

  @override
  String toString() {
    return 'DigitalId(id: $id, userId: $userId, estateId: $estateId, digitalIdCode: $digitalIdCode, qrCodeUrl: $qrCodeUrl, qrCodePublicId: $qrCodePublicId, qrCodeData: $qrCodeData, status: $status, accessPermissions: $accessPermissions, restrictions: $restrictions, deactivationReason: $deactivationReason, deactivatedBy: $deactivatedBy, createdBy: $createdBy, activatedAt: $activatedAt, deactivatedAt: $deactivatedAt, lastUsedAt: $lastUsedAt, usageCount: $usageCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DigitalIdImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            (identical(other.digitalIdCode, digitalIdCode) ||
                other.digitalIdCode == digitalIdCode) &&
            (identical(other.qrCodeUrl, qrCodeUrl) ||
                other.qrCodeUrl == qrCodeUrl) &&
            (identical(other.qrCodePublicId, qrCodePublicId) ||
                other.qrCodePublicId == qrCodePublicId) &&
            (identical(other.qrCodeData, qrCodeData) ||
                other.qrCodeData == qrCodeData) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.accessPermissions, accessPermissions) ||
                other.accessPermissions == accessPermissions) &&
            const DeepCollectionEquality()
                .equals(other.restrictions, restrictions) &&
            const DeepCollectionEquality()
                .equals(other.deactivationReason, deactivationReason) &&
            (identical(other.deactivatedBy, deactivatedBy) ||
                other.deactivatedBy == deactivatedBy) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.activatedAt, activatedAt) ||
                other.activatedAt == activatedAt) &&
            const DeepCollectionEquality()
                .equals(other.deactivatedAt, deactivatedAt) &&
            (identical(other.lastUsedAt, lastUsedAt) ||
                other.lastUsedAt == lastUsedAt) &&
            (identical(other.usageCount, usageCount) ||
                other.usageCount == usageCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        estateId,
        digitalIdCode,
        qrCodeUrl,
        qrCodePublicId,
        qrCodeData,
        status,
        accessPermissions,
        const DeepCollectionEquality().hash(restrictions),
        const DeepCollectionEquality().hash(deactivationReason),
        deactivatedBy,
        createdBy,
        activatedAt,
        const DeepCollectionEquality().hash(deactivatedAt),
        lastUsedAt,
        usageCount,
        createdAt,
        updatedAt
      ]);

  /// Create a copy of DigitalId
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DigitalIdImplCopyWith<_$DigitalIdImpl> get copyWith =>
      __$$DigitalIdImplCopyWithImpl<_$DigitalIdImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DigitalIdImplToJson(
      this,
    );
  }
}

abstract class _DigitalId implements DigitalId {
  const factory _DigitalId(
      {@JsonKey(name: 'id') final int? id,
      @JsonKey(name: 'user_id') final int? userId,
      @JsonKey(name: 'estate_id') final int? estateId,
      @JsonKey(name: 'digital_id_code') final String? digitalIdCode,
      @JsonKey(name: 'qr_code_url') final String? qrCodeUrl,
      @JsonKey(name: 'qr_code_public_id') final String? qrCodePublicId,
      @JsonKey(name: 'qr_code_data') final String? qrCodeData,
      @JsonKey(name: 'status') final String? status,
      @JsonKey(name: 'access_permissions')
      final AccessPermissions? accessPermissions,
      @JsonKey(name: 'restrictions') final dynamic restrictions,
      @JsonKey(name: 'deactivation_reason') final dynamic deactivationReason,
      @JsonKey(name: 'deactivated_by') final int? deactivatedBy,
      @JsonKey(name: 'created_by') final int? createdBy,
      @JsonKey(name: 'activated_at') final String? activatedAt,
      @JsonKey(name: 'deactivated_at') final dynamic deactivatedAt,
      @JsonKey(name: 'last_used_at') final String? lastUsedAt,
      @JsonKey(name: 'usage_count') final int? usageCount,
      @JsonKey(name: 'created_at') final String? createdAt,
      @JsonKey(name: 'updated_at') final String? updatedAt}) = _$DigitalIdImpl;

  factory _DigitalId.fromJson(Map<String, dynamic> json) =
      _$DigitalIdImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'estate_id')
  int? get estateId;
  @override
  @JsonKey(name: 'digital_id_code')
  String? get digitalIdCode;
  @override
  @JsonKey(name: 'qr_code_url')
  String? get qrCodeUrl;
  @override
  @JsonKey(name: 'qr_code_public_id')
  String? get qrCodePublicId;
  @override
  @JsonKey(name: 'qr_code_data')
  String? get qrCodeData;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'access_permissions')
  AccessPermissions? get accessPermissions;
  @override
  @JsonKey(name: 'restrictions')
  dynamic get restrictions;
  @override
  @JsonKey(name: 'deactivation_reason')
  dynamic get deactivationReason;
  @override
  @JsonKey(name: 'deactivated_by')
  int? get deactivatedBy;
  @override
  @JsonKey(name: 'created_by')
  int? get createdBy;
  @override
  @JsonKey(name: 'activated_at')
  String? get activatedAt;
  @override
  @JsonKey(name: 'deactivated_at')
  dynamic get deactivatedAt;
  @override
  @JsonKey(name: 'last_used_at')
  String? get lastUsedAt;
  @override
  @JsonKey(name: 'usage_count')
  int? get usageCount;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt;

  /// Create a copy of DigitalId
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DigitalIdImplCopyWith<_$DigitalIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
