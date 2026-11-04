// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'permit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Permit _$PermitFromJson(Map<String, dynamic> json) {
  return _Permit.fromJson(json);
}

/// @nodoc
mixin _$Permit {
  int? get id => throw _privateConstructorUsedError;
  int? get estateId => throw _privateConstructorUsedError;
  int? get propertyId => throw _privateConstructorUsedError;
  int? get residentId => throw _privateConstructorUsedError;
  int? get visitorOtpId => throw _privateConstructorUsedError;
  String? get guestPhoneNumber => throw _privateConstructorUsedError;
  String? get guestName => throw _privateConstructorUsedError;
  String? get itemsDescription => throw _privateConstructorUsedError;
  dynamic get estimatedValue => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  dynamic get usedAt => throw _privateConstructorUsedError;
  dynamic get usedBy => throw _privateConstructorUsedError;
  dynamic get revokedAt => throw _privateConstructorUsedError;
  User? get revokedBy => throw _privateConstructorUsedError;
  String? get revocationReason => throw _privateConstructorUsedError;
  bool? get isResolved => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  StatusBadge? get statusBadge => throw _privateConstructorUsedError;
  List<PermitItem>? get items => throw _privateConstructorUsedError;
  VisitorOtp? get visitorOtp => throw _privateConstructorUsedError;
  Property? get property => throw _privateConstructorUsedError;

  /// Serializes this Permit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Permit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PermitCopyWith<Permit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PermitCopyWith<$Res> {
  factory $PermitCopyWith(Permit value, $Res Function(Permit) then) =
      _$PermitCopyWithImpl<$Res, Permit>;
  @useResult
  $Res call(
      {int? id,
      int? estateId,
      int? propertyId,
      int? residentId,
      int? visitorOtpId,
      String? guestPhoneNumber,
      String? guestName,
      String? itemsDescription,
      dynamic estimatedValue,
      String? status,
      dynamic usedAt,
      dynamic usedBy,
      dynamic revokedAt,
      User? revokedBy,
      String? revocationReason,
      bool? isResolved,
      String? createdAt,
      String? updatedAt,
      StatusBadge? statusBadge,
      List<PermitItem>? items,
      VisitorOtp? visitorOtp,
      Property? property});

  $UserCopyWith<$Res>? get revokedBy;
  $StatusBadgeCopyWith<$Res>? get statusBadge;
  $VisitorOtpCopyWith<$Res>? get visitorOtp;
  $PropertyCopyWith<$Res>? get property;
}

/// @nodoc
class _$PermitCopyWithImpl<$Res, $Val extends Permit>
    implements $PermitCopyWith<$Res> {
  _$PermitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Permit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estateId = freezed,
    Object? propertyId = freezed,
    Object? residentId = freezed,
    Object? visitorOtpId = freezed,
    Object? guestPhoneNumber = freezed,
    Object? guestName = freezed,
    Object? itemsDescription = freezed,
    Object? estimatedValue = freezed,
    Object? status = freezed,
    Object? usedAt = freezed,
    Object? usedBy = freezed,
    Object? revokedAt = freezed,
    Object? revokedBy = freezed,
    Object? revocationReason = freezed,
    Object? isResolved = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? statusBadge = freezed,
    Object? items = freezed,
    Object? visitorOtp = freezed,
    Object? property = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      propertyId: freezed == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as int?,
      residentId: freezed == residentId
          ? _value.residentId
          : residentId // ignore: cast_nullable_to_non_nullable
              as int?,
      visitorOtpId: freezed == visitorOtpId
          ? _value.visitorOtpId
          : visitorOtpId // ignore: cast_nullable_to_non_nullable
              as int?,
      guestPhoneNumber: freezed == guestPhoneNumber
          ? _value.guestPhoneNumber
          : guestPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      guestName: freezed == guestName
          ? _value.guestName
          : guestName // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsDescription: freezed == itemsDescription
          ? _value.itemsDescription
          : itemsDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedValue: freezed == estimatedValue
          ? _value.estimatedValue
          : estimatedValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      usedAt: freezed == usedAt
          ? _value.usedAt
          : usedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      usedBy: freezed == usedBy
          ? _value.usedBy
          : usedBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      revokedAt: freezed == revokedAt
          ? _value.revokedAt
          : revokedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      revokedBy: freezed == revokedBy
          ? _value.revokedBy
          : revokedBy // ignore: cast_nullable_to_non_nullable
              as User?,
      revocationReason: freezed == revocationReason
          ? _value.revocationReason
          : revocationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      isResolved: freezed == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      statusBadge: freezed == statusBadge
          ? _value.statusBadge
          : statusBadge // ignore: cast_nullable_to_non_nullable
              as StatusBadge?,
      items: freezed == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PermitItem>?,
      visitorOtp: freezed == visitorOtp
          ? _value.visitorOtp
          : visitorOtp // ignore: cast_nullable_to_non_nullable
              as VisitorOtp?,
      property: freezed == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as Property?,
    ) as $Val);
  }

  /// Create a copy of Permit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res>? get revokedBy {
    if (_value.revokedBy == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.revokedBy!, (value) {
      return _then(_value.copyWith(revokedBy: value) as $Val);
    });
  }

  /// Create a copy of Permit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusBadgeCopyWith<$Res>? get statusBadge {
    if (_value.statusBadge == null) {
      return null;
    }

    return $StatusBadgeCopyWith<$Res>(_value.statusBadge!, (value) {
      return _then(_value.copyWith(statusBadge: value) as $Val);
    });
  }

  /// Create a copy of Permit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VisitorOtpCopyWith<$Res>? get visitorOtp {
    if (_value.visitorOtp == null) {
      return null;
    }

    return $VisitorOtpCopyWith<$Res>(_value.visitorOtp!, (value) {
      return _then(_value.copyWith(visitorOtp: value) as $Val);
    });
  }

  /// Create a copy of Permit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PropertyCopyWith<$Res>? get property {
    if (_value.property == null) {
      return null;
    }

    return $PropertyCopyWith<$Res>(_value.property!, (value) {
      return _then(_value.copyWith(property: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PermitImplCopyWith<$Res> implements $PermitCopyWith<$Res> {
  factory _$$PermitImplCopyWith(
          _$PermitImpl value, $Res Function(_$PermitImpl) then) =
      __$$PermitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? estateId,
      int? propertyId,
      int? residentId,
      int? visitorOtpId,
      String? guestPhoneNumber,
      String? guestName,
      String? itemsDescription,
      dynamic estimatedValue,
      String? status,
      dynamic usedAt,
      dynamic usedBy,
      dynamic revokedAt,
      User? revokedBy,
      String? revocationReason,
      bool? isResolved,
      String? createdAt,
      String? updatedAt,
      StatusBadge? statusBadge,
      List<PermitItem>? items,
      VisitorOtp? visitorOtp,
      Property? property});

  @override
  $UserCopyWith<$Res>? get revokedBy;
  @override
  $StatusBadgeCopyWith<$Res>? get statusBadge;
  @override
  $VisitorOtpCopyWith<$Res>? get visitorOtp;
  @override
  $PropertyCopyWith<$Res>? get property;
}

/// @nodoc
class __$$PermitImplCopyWithImpl<$Res>
    extends _$PermitCopyWithImpl<$Res, _$PermitImpl>
    implements _$$PermitImplCopyWith<$Res> {
  __$$PermitImplCopyWithImpl(
      _$PermitImpl _value, $Res Function(_$PermitImpl) _then)
      : super(_value, _then);

  /// Create a copy of Permit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estateId = freezed,
    Object? propertyId = freezed,
    Object? residentId = freezed,
    Object? visitorOtpId = freezed,
    Object? guestPhoneNumber = freezed,
    Object? guestName = freezed,
    Object? itemsDescription = freezed,
    Object? estimatedValue = freezed,
    Object? status = freezed,
    Object? usedAt = freezed,
    Object? usedBy = freezed,
    Object? revokedAt = freezed,
    Object? revokedBy = freezed,
    Object? revocationReason = freezed,
    Object? isResolved = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? statusBadge = freezed,
    Object? items = freezed,
    Object? visitorOtp = freezed,
    Object? property = freezed,
  }) {
    return _then(_$PermitImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      propertyId: freezed == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as int?,
      residentId: freezed == residentId
          ? _value.residentId
          : residentId // ignore: cast_nullable_to_non_nullable
              as int?,
      visitorOtpId: freezed == visitorOtpId
          ? _value.visitorOtpId
          : visitorOtpId // ignore: cast_nullable_to_non_nullable
              as int?,
      guestPhoneNumber: freezed == guestPhoneNumber
          ? _value.guestPhoneNumber
          : guestPhoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      guestName: freezed == guestName
          ? _value.guestName
          : guestName // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsDescription: freezed == itemsDescription
          ? _value.itemsDescription
          : itemsDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      estimatedValue: freezed == estimatedValue
          ? _value.estimatedValue
          : estimatedValue // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      usedAt: freezed == usedAt
          ? _value.usedAt
          : usedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      usedBy: freezed == usedBy
          ? _value.usedBy
          : usedBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
      revokedAt: freezed == revokedAt
          ? _value.revokedAt
          : revokedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      revokedBy: freezed == revokedBy
          ? _value.revokedBy
          : revokedBy // ignore: cast_nullable_to_non_nullable
              as User?,
      revocationReason: freezed == revocationReason
          ? _value.revocationReason
          : revocationReason // ignore: cast_nullable_to_non_nullable
              as String?,
      isResolved: freezed == isResolved
          ? _value.isResolved
          : isResolved // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      statusBadge: freezed == statusBadge
          ? _value.statusBadge
          : statusBadge // ignore: cast_nullable_to_non_nullable
              as StatusBadge?,
      items: freezed == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<PermitItem>?,
      visitorOtp: freezed == visitorOtp
          ? _value.visitorOtp
          : visitorOtp // ignore: cast_nullable_to_non_nullable
              as VisitorOtp?,
      property: freezed == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as Property?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PermitImpl implements _Permit {
  const _$PermitImpl(
      {this.id,
      this.estateId,
      this.propertyId,
      this.residentId,
      this.visitorOtpId,
      this.guestPhoneNumber,
      this.guestName,
      this.itemsDescription,
      this.estimatedValue,
      this.status,
      this.usedAt,
      this.usedBy,
      this.revokedAt,
      this.revokedBy,
      this.revocationReason,
      this.isResolved,
      this.createdAt,
      this.updatedAt,
      this.statusBadge,
      final List<PermitItem>? items,
      this.visitorOtp,
      this.property})
      : _items = items;

  factory _$PermitImpl.fromJson(Map<String, dynamic> json) =>
      _$$PermitImplFromJson(json);

  @override
  final int? id;
  @override
  final int? estateId;
  @override
  final int? propertyId;
  @override
  final int? residentId;
  @override
  final int? visitorOtpId;
  @override
  final String? guestPhoneNumber;
  @override
  final String? guestName;
  @override
  final String? itemsDescription;
  @override
  final dynamic estimatedValue;
  @override
  final String? status;
  @override
  final dynamic usedAt;
  @override
  final dynamic usedBy;
  @override
  final dynamic revokedAt;
  @override
  final User? revokedBy;
  @override
  final String? revocationReason;
  @override
  final bool? isResolved;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final StatusBadge? statusBadge;
  final List<PermitItem>? _items;
  @override
  List<PermitItem>? get items {
    final value = _items;
    if (value == null) return null;
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final VisitorOtp? visitorOtp;
  @override
  final Property? property;

  @override
  String toString() {
    return 'Permit(id: $id, estateId: $estateId, propertyId: $propertyId, residentId: $residentId, visitorOtpId: $visitorOtpId, guestPhoneNumber: $guestPhoneNumber, guestName: $guestName, itemsDescription: $itemsDescription, estimatedValue: $estimatedValue, status: $status, usedAt: $usedAt, usedBy: $usedBy, revokedAt: $revokedAt, revokedBy: $revokedBy, revocationReason: $revocationReason, isResolved: $isResolved, createdAt: $createdAt, updatedAt: $updatedAt, statusBadge: $statusBadge, items: $items, visitorOtp: $visitorOtp, property: $property)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PermitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.residentId, residentId) ||
                other.residentId == residentId) &&
            (identical(other.visitorOtpId, visitorOtpId) ||
                other.visitorOtpId == visitorOtpId) &&
            (identical(other.guestPhoneNumber, guestPhoneNumber) ||
                other.guestPhoneNumber == guestPhoneNumber) &&
            (identical(other.guestName, guestName) ||
                other.guestName == guestName) &&
            (identical(other.itemsDescription, itemsDescription) ||
                other.itemsDescription == itemsDescription) &&
            const DeepCollectionEquality()
                .equals(other.estimatedValue, estimatedValue) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.usedAt, usedAt) &&
            const DeepCollectionEquality().equals(other.usedBy, usedBy) &&
            const DeepCollectionEquality().equals(other.revokedAt, revokedAt) &&
            (identical(other.revokedBy, revokedBy) ||
                other.revokedBy == revokedBy) &&
            (identical(other.revocationReason, revocationReason) ||
                other.revocationReason == revocationReason) &&
            (identical(other.isResolved, isResolved) ||
                other.isResolved == isResolved) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.statusBadge, statusBadge) ||
                other.statusBadge == statusBadge) &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.visitorOtp, visitorOtp) ||
                other.visitorOtp == visitorOtp) &&
            (identical(other.property, property) ||
                other.property == property));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        estateId,
        propertyId,
        residentId,
        visitorOtpId,
        guestPhoneNumber,
        guestName,
        itemsDescription,
        const DeepCollectionEquality().hash(estimatedValue),
        status,
        const DeepCollectionEquality().hash(usedAt),
        const DeepCollectionEquality().hash(usedBy),
        const DeepCollectionEquality().hash(revokedAt),
        revokedBy,
        revocationReason,
        isResolved,
        createdAt,
        updatedAt,
        statusBadge,
        const DeepCollectionEquality().hash(_items),
        visitorOtp,
        property
      ]);

  /// Create a copy of Permit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PermitImplCopyWith<_$PermitImpl> get copyWith =>
      __$$PermitImplCopyWithImpl<_$PermitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PermitImplToJson(
      this,
    );
  }
}

abstract class _Permit implements Permit {
  const factory _Permit(
      {final int? id,
      final int? estateId,
      final int? propertyId,
      final int? residentId,
      final int? visitorOtpId,
      final String? guestPhoneNumber,
      final String? guestName,
      final String? itemsDescription,
      final dynamic estimatedValue,
      final String? status,
      final dynamic usedAt,
      final dynamic usedBy,
      final dynamic revokedAt,
      final User? revokedBy,
      final String? revocationReason,
      final bool? isResolved,
      final String? createdAt,
      final String? updatedAt,
      final StatusBadge? statusBadge,
      final List<PermitItem>? items,
      final VisitorOtp? visitorOtp,
      final Property? property}) = _$PermitImpl;

  factory _Permit.fromJson(Map<String, dynamic> json) = _$PermitImpl.fromJson;

  @override
  int? get id;
  @override
  int? get estateId;
  @override
  int? get propertyId;
  @override
  int? get residentId;
  @override
  int? get visitorOtpId;
  @override
  String? get guestPhoneNumber;
  @override
  String? get guestName;
  @override
  String? get itemsDescription;
  @override
  dynamic get estimatedValue;
  @override
  String? get status;
  @override
  dynamic get usedAt;
  @override
  dynamic get usedBy;
  @override
  dynamic get revokedAt;
  @override
  User? get revokedBy;
  @override
  String? get revocationReason;
  @override
  bool? get isResolved;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  StatusBadge? get statusBadge;
  @override
  List<PermitItem>? get items;
  @override
  VisitorOtp? get visitorOtp;
  @override
  Property? get property;

  /// Create a copy of Permit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PermitImplCopyWith<_$PermitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
