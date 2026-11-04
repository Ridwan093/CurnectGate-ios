// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'work_order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WorkOrder _$WorkOrderFromJson(Map<String, dynamic> json) {
  return _WorkOrder.fromJson(json);
}

/// @nodoc
mixin _$WorkOrder {
  int? get id => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  int? get estateId => throw _privateConstructorUsedError;
  int? get propertyId => throw _privateConstructorUsedError;
  int? get workorderCategoryId => throw _privateConstructorUsedError;
  int? get estateAddressId => throw _privateConstructorUsedError;
  String? get vendorName => throw _privateConstructorUsedError;
  String? get vendorEmail => throw _privateConstructorUsedError;
  String? get vendorPhone => throw _privateConstructorUsedError;
  String? get address => throw _privateConstructorUsedError;
  String? get startDate => throw _privateConstructorUsedError;
  String? get endDate => throw _privateConstructorUsedError;
  String? get dailyTimeWindow => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get numberOfWorkers => throw _privateConstructorUsedError;
  String? get vendorAccessCode => throw _privateConstructorUsedError;
  bool? get allowedEntry => throw _privateConstructorUsedError;
  List<Photo>? get beforePhotos => throw _privateConstructorUsedError;
  List<Photo>? get afterPhotos => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  int? get assignedBy => throw _privateConstructorUsedError;
  int? get validatedBy => throw _privateConstructorUsedError;
  String? get validatedAt => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  Category? get category => throw _privateConstructorUsedError;
  Property? get property => throw _privateConstructorUsedError;
  EstateAddress? get estateAddress => throw _privateConstructorUsedError;
  List<Worker>? get workers => throw _privateConstructorUsedError;

  /// Serializes this WorkOrder to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WorkOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkOrderCopyWith<WorkOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkOrderCopyWith<$Res> {
  factory $WorkOrderCopyWith(WorkOrder value, $Res Function(WorkOrder) then) =
      _$WorkOrderCopyWithImpl<$Res, WorkOrder>;
  @useResult
  $Res call(
      {int? id,
      int? userId,
      int? estateId,
      int? propertyId,
      int? workorderCategoryId,
      int? estateAddressId,
      String? vendorName,
      String? vendorEmail,
      String? vendorPhone,
      String? address,
      String? startDate,
      String? endDate,
      String? dailyTimeWindow,
      String? description,
      int? numberOfWorkers,
      String? vendorAccessCode,
      bool? allowedEntry,
      List<Photo>? beforePhotos,
      List<Photo>? afterPhotos,
      String? status,
      int? assignedBy,
      int? validatedBy,
      String? validatedAt,
      String? createdAt,
      String? updatedAt,
      Category? category,
      Property? property,
      EstateAddress? estateAddress,
      List<Worker>? workers});

  $CategoryCopyWith<$Res>? get category;
  $PropertyCopyWith<$Res>? get property;
  $EstateAddressCopyWith<$Res>? get estateAddress;
}

/// @nodoc
class _$WorkOrderCopyWithImpl<$Res, $Val extends WorkOrder>
    implements $WorkOrderCopyWith<$Res> {
  _$WorkOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WorkOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? estateId = freezed,
    Object? propertyId = freezed,
    Object? workorderCategoryId = freezed,
    Object? estateAddressId = freezed,
    Object? vendorName = freezed,
    Object? vendorEmail = freezed,
    Object? vendorPhone = freezed,
    Object? address = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? dailyTimeWindow = freezed,
    Object? description = freezed,
    Object? numberOfWorkers = freezed,
    Object? vendorAccessCode = freezed,
    Object? allowedEntry = freezed,
    Object? beforePhotos = freezed,
    Object? afterPhotos = freezed,
    Object? status = freezed,
    Object? assignedBy = freezed,
    Object? validatedBy = freezed,
    Object? validatedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? category = freezed,
    Object? property = freezed,
    Object? estateAddress = freezed,
    Object? workers = freezed,
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
      propertyId: freezed == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as int?,
      workorderCategoryId: freezed == workorderCategoryId
          ? _value.workorderCategoryId
          : workorderCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      estateAddressId: freezed == estateAddressId
          ? _value.estateAddressId
          : estateAddressId // ignore: cast_nullable_to_non_nullable
              as int?,
      vendorName: freezed == vendorName
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorEmail: freezed == vendorEmail
          ? _value.vendorEmail
          : vendorEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorPhone: freezed == vendorPhone
          ? _value.vendorPhone
          : vendorPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      dailyTimeWindow: freezed == dailyTimeWindow
          ? _value.dailyTimeWindow
          : dailyTimeWindow // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfWorkers: freezed == numberOfWorkers
          ? _value.numberOfWorkers
          : numberOfWorkers // ignore: cast_nullable_to_non_nullable
              as int?,
      vendorAccessCode: freezed == vendorAccessCode
          ? _value.vendorAccessCode
          : vendorAccessCode // ignore: cast_nullable_to_non_nullable
              as String?,
      allowedEntry: freezed == allowedEntry
          ? _value.allowedEntry
          : allowedEntry // ignore: cast_nullable_to_non_nullable
              as bool?,
      beforePhotos: freezed == beforePhotos
          ? _value.beforePhotos
          : beforePhotos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
      afterPhotos: freezed == afterPhotos
          ? _value.afterPhotos
          : afterPhotos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedBy: freezed == assignedBy
          ? _value.assignedBy
          : assignedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      validatedBy: freezed == validatedBy
          ? _value.validatedBy
          : validatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      validatedAt: freezed == validatedAt
          ? _value.validatedAt
          : validatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      property: freezed == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as Property?,
      estateAddress: freezed == estateAddress
          ? _value.estateAddress
          : estateAddress // ignore: cast_nullable_to_non_nullable
              as EstateAddress?,
      workers: freezed == workers
          ? _value.workers
          : workers // ignore: cast_nullable_to_non_nullable
              as List<Worker>?,
    ) as $Val);
  }

  /// Create a copy of WorkOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res>? get category {
    if (_value.category == null) {
      return null;
    }

    return $CategoryCopyWith<$Res>(_value.category!, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }

  /// Create a copy of WorkOrder
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

  /// Create a copy of WorkOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EstateAddressCopyWith<$Res>? get estateAddress {
    if (_value.estateAddress == null) {
      return null;
    }

    return $EstateAddressCopyWith<$Res>(_value.estateAddress!, (value) {
      return _then(_value.copyWith(estateAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WorkOrderImplCopyWith<$Res>
    implements $WorkOrderCopyWith<$Res> {
  factory _$$WorkOrderImplCopyWith(
          _$WorkOrderImpl value, $Res Function(_$WorkOrderImpl) then) =
      __$$WorkOrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? userId,
      int? estateId,
      int? propertyId,
      int? workorderCategoryId,
      int? estateAddressId,
      String? vendorName,
      String? vendorEmail,
      String? vendorPhone,
      String? address,
      String? startDate,
      String? endDate,
      String? dailyTimeWindow,
      String? description,
      int? numberOfWorkers,
      String? vendorAccessCode,
      bool? allowedEntry,
      List<Photo>? beforePhotos,
      List<Photo>? afterPhotos,
      String? status,
      int? assignedBy,
      int? validatedBy,
      String? validatedAt,
      String? createdAt,
      String? updatedAt,
      Category? category,
      Property? property,
      EstateAddress? estateAddress,
      List<Worker>? workers});

  @override
  $CategoryCopyWith<$Res>? get category;
  @override
  $PropertyCopyWith<$Res>? get property;
  @override
  $EstateAddressCopyWith<$Res>? get estateAddress;
}

/// @nodoc
class __$$WorkOrderImplCopyWithImpl<$Res>
    extends _$WorkOrderCopyWithImpl<$Res, _$WorkOrderImpl>
    implements _$$WorkOrderImplCopyWith<$Res> {
  __$$WorkOrderImplCopyWithImpl(
      _$WorkOrderImpl _value, $Res Function(_$WorkOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of WorkOrder
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? estateId = freezed,
    Object? propertyId = freezed,
    Object? workorderCategoryId = freezed,
    Object? estateAddressId = freezed,
    Object? vendorName = freezed,
    Object? vendorEmail = freezed,
    Object? vendorPhone = freezed,
    Object? address = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? dailyTimeWindow = freezed,
    Object? description = freezed,
    Object? numberOfWorkers = freezed,
    Object? vendorAccessCode = freezed,
    Object? allowedEntry = freezed,
    Object? beforePhotos = freezed,
    Object? afterPhotos = freezed,
    Object? status = freezed,
    Object? assignedBy = freezed,
    Object? validatedBy = freezed,
    Object? validatedAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? category = freezed,
    Object? property = freezed,
    Object? estateAddress = freezed,
    Object? workers = freezed,
  }) {
    return _then(_$WorkOrderImpl(
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
      propertyId: freezed == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as int?,
      workorderCategoryId: freezed == workorderCategoryId
          ? _value.workorderCategoryId
          : workorderCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      estateAddressId: freezed == estateAddressId
          ? _value.estateAddressId
          : estateAddressId // ignore: cast_nullable_to_non_nullable
              as int?,
      vendorName: freezed == vendorName
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorEmail: freezed == vendorEmail
          ? _value.vendorEmail
          : vendorEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorPhone: freezed == vendorPhone
          ? _value.vendorPhone
          : vendorPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
      dailyTimeWindow: freezed == dailyTimeWindow
          ? _value.dailyTimeWindow
          : dailyTimeWindow // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfWorkers: freezed == numberOfWorkers
          ? _value.numberOfWorkers
          : numberOfWorkers // ignore: cast_nullable_to_non_nullable
              as int?,
      vendorAccessCode: freezed == vendorAccessCode
          ? _value.vendorAccessCode
          : vendorAccessCode // ignore: cast_nullable_to_non_nullable
              as String?,
      allowedEntry: freezed == allowedEntry
          ? _value.allowedEntry
          : allowedEntry // ignore: cast_nullable_to_non_nullable
              as bool?,
      beforePhotos: freezed == beforePhotos
          ? _value._beforePhotos
          : beforePhotos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
      afterPhotos: freezed == afterPhotos
          ? _value._afterPhotos
          : afterPhotos // ignore: cast_nullable_to_non_nullable
              as List<Photo>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      assignedBy: freezed == assignedBy
          ? _value.assignedBy
          : assignedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      validatedBy: freezed == validatedBy
          ? _value.validatedBy
          : validatedBy // ignore: cast_nullable_to_non_nullable
              as int?,
      validatedAt: freezed == validatedAt
          ? _value.validatedAt
          : validatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category?,
      property: freezed == property
          ? _value.property
          : property // ignore: cast_nullable_to_non_nullable
              as Property?,
      estateAddress: freezed == estateAddress
          ? _value.estateAddress
          : estateAddress // ignore: cast_nullable_to_non_nullable
              as EstateAddress?,
      workers: freezed == workers
          ? _value._workers
          : workers // ignore: cast_nullable_to_non_nullable
              as List<Worker>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$WorkOrderImpl implements _WorkOrder {
  const _$WorkOrderImpl(
      {this.id,
      this.userId,
      this.estateId,
      this.propertyId,
      this.workorderCategoryId,
      this.estateAddressId,
      this.vendorName,
      this.vendorEmail,
      this.vendorPhone,
      this.address,
      this.startDate,
      this.endDate,
      this.dailyTimeWindow,
      this.description,
      this.numberOfWorkers,
      this.vendorAccessCode,
      this.allowedEntry,
      final List<Photo>? beforePhotos,
      final List<Photo>? afterPhotos,
      this.status,
      this.assignedBy,
      this.validatedBy,
      this.validatedAt,
      this.createdAt,
      this.updatedAt,
      this.category,
      this.property,
      this.estateAddress,
      final List<Worker>? workers})
      : _beforePhotos = beforePhotos,
        _afterPhotos = afterPhotos,
        _workers = workers;

  factory _$WorkOrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkOrderImplFromJson(json);

  @override
  final int? id;
  @override
  final int? userId;
  @override
  final int? estateId;
  @override
  final int? propertyId;
  @override
  final int? workorderCategoryId;
  @override
  final int? estateAddressId;
  @override
  final String? vendorName;
  @override
  final String? vendorEmail;
  @override
  final String? vendorPhone;
  @override
  final String? address;
  @override
  final String? startDate;
  @override
  final String? endDate;
  @override
  final String? dailyTimeWindow;
  @override
  final String? description;
  @override
  final int? numberOfWorkers;
  @override
  final String? vendorAccessCode;
  @override
  final bool? allowedEntry;
  final List<Photo>? _beforePhotos;
  @override
  List<Photo>? get beforePhotos {
    final value = _beforePhotos;
    if (value == null) return null;
    if (_beforePhotos is EqualUnmodifiableListView) return _beforePhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Photo>? _afterPhotos;
  @override
  List<Photo>? get afterPhotos {
    final value = _afterPhotos;
    if (value == null) return null;
    if (_afterPhotos is EqualUnmodifiableListView) return _afterPhotos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? status;
  @override
  final int? assignedBy;
  @override
  final int? validatedBy;
  @override
  final String? validatedAt;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final Category? category;
  @override
  final Property? property;
  @override
  final EstateAddress? estateAddress;
  final List<Worker>? _workers;
  @override
  List<Worker>? get workers {
    final value = _workers;
    if (value == null) return null;
    if (_workers is EqualUnmodifiableListView) return _workers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'WorkOrder(id: $id, userId: $userId, estateId: $estateId, propertyId: $propertyId, workorderCategoryId: $workorderCategoryId, estateAddressId: $estateAddressId, vendorName: $vendorName, vendorEmail: $vendorEmail, vendorPhone: $vendorPhone, address: $address, startDate: $startDate, endDate: $endDate, dailyTimeWindow: $dailyTimeWindow, description: $description, numberOfWorkers: $numberOfWorkers, vendorAccessCode: $vendorAccessCode, allowedEntry: $allowedEntry, beforePhotos: $beforePhotos, afterPhotos: $afterPhotos, status: $status, assignedBy: $assignedBy, validatedBy: $validatedBy, validatedAt: $validatedAt, createdAt: $createdAt, updatedAt: $updatedAt, category: $category, property: $property, estateAddress: $estateAddress, workers: $workers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkOrderImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.workorderCategoryId, workorderCategoryId) ||
                other.workorderCategoryId == workorderCategoryId) &&
            (identical(other.estateAddressId, estateAddressId) ||
                other.estateAddressId == estateAddressId) &&
            (identical(other.vendorName, vendorName) ||
                other.vendorName == vendorName) &&
            (identical(other.vendorEmail, vendorEmail) ||
                other.vendorEmail == vendorEmail) &&
            (identical(other.vendorPhone, vendorPhone) ||
                other.vendorPhone == vendorPhone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.dailyTimeWindow, dailyTimeWindow) ||
                other.dailyTimeWindow == dailyTimeWindow) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.numberOfWorkers, numberOfWorkers) ||
                other.numberOfWorkers == numberOfWorkers) &&
            (identical(other.vendorAccessCode, vendorAccessCode) ||
                other.vendorAccessCode == vendorAccessCode) &&
            (identical(other.allowedEntry, allowedEntry) ||
                other.allowedEntry == allowedEntry) &&
            const DeepCollectionEquality()
                .equals(other._beforePhotos, _beforePhotos) &&
            const DeepCollectionEquality()
                .equals(other._afterPhotos, _afterPhotos) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.assignedBy, assignedBy) ||
                other.assignedBy == assignedBy) &&
            (identical(other.validatedBy, validatedBy) ||
                other.validatedBy == validatedBy) &&
            (identical(other.validatedAt, validatedAt) ||
                other.validatedAt == validatedAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.property, property) ||
                other.property == property) &&
            (identical(other.estateAddress, estateAddress) ||
                other.estateAddress == estateAddress) &&
            const DeepCollectionEquality().equals(other._workers, _workers));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        estateId,
        propertyId,
        workorderCategoryId,
        estateAddressId,
        vendorName,
        vendorEmail,
        vendorPhone,
        address,
        startDate,
        endDate,
        dailyTimeWindow,
        description,
        numberOfWorkers,
        vendorAccessCode,
        allowedEntry,
        const DeepCollectionEquality().hash(_beforePhotos),
        const DeepCollectionEquality().hash(_afterPhotos),
        status,
        assignedBy,
        validatedBy,
        validatedAt,
        createdAt,
        updatedAt,
        category,
        property,
        estateAddress,
        const DeepCollectionEquality().hash(_workers)
      ]);

  /// Create a copy of WorkOrder
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkOrderImplCopyWith<_$WorkOrderImpl> get copyWith =>
      __$$WorkOrderImplCopyWithImpl<_$WorkOrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkOrderImplToJson(
      this,
    );
  }
}

abstract class _WorkOrder implements WorkOrder {
  const factory _WorkOrder(
      {final int? id,
      final int? userId,
      final int? estateId,
      final int? propertyId,
      final int? workorderCategoryId,
      final int? estateAddressId,
      final String? vendorName,
      final String? vendorEmail,
      final String? vendorPhone,
      final String? address,
      final String? startDate,
      final String? endDate,
      final String? dailyTimeWindow,
      final String? description,
      final int? numberOfWorkers,
      final String? vendorAccessCode,
      final bool? allowedEntry,
      final List<Photo>? beforePhotos,
      final List<Photo>? afterPhotos,
      final String? status,
      final int? assignedBy,
      final int? validatedBy,
      final String? validatedAt,
      final String? createdAt,
      final String? updatedAt,
      final Category? category,
      final Property? property,
      final EstateAddress? estateAddress,
      final List<Worker>? workers}) = _$WorkOrderImpl;

  factory _WorkOrder.fromJson(Map<String, dynamic> json) =
      _$WorkOrderImpl.fromJson;

  @override
  int? get id;
  @override
  int? get userId;
  @override
  int? get estateId;
  @override
  int? get propertyId;
  @override
  int? get workorderCategoryId;
  @override
  int? get estateAddressId;
  @override
  String? get vendorName;
  @override
  String? get vendorEmail;
  @override
  String? get vendorPhone;
  @override
  String? get address;
  @override
  String? get startDate;
  @override
  String? get endDate;
  @override
  String? get dailyTimeWindow;
  @override
  String? get description;
  @override
  int? get numberOfWorkers;
  @override
  String? get vendorAccessCode;
  @override
  bool? get allowedEntry;
  @override
  List<Photo>? get beforePhotos;
  @override
  List<Photo>? get afterPhotos;
  @override
  String? get status;
  @override
  int? get assignedBy;
  @override
  int? get validatedBy;
  @override
  String? get validatedAt;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  Category? get category;
  @override
  Property? get property;
  @override
  EstateAddress? get estateAddress;
  @override
  List<Worker>? get workers;

  /// Create a copy of WorkOrder
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkOrderImplCopyWith<_$WorkOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
