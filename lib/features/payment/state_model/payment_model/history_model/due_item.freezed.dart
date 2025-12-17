// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'due_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DueItem _$DueItemFromJson(Map<String, dynamic> json) {
  return _DueItem.fromJson(json);
}

/// @nodoc
mixin _$DueItem {
  int? get id => throw _privateConstructorUsedError;
  int? get estateId => throw _privateConstructorUsedError;
  int? get feeCategoryId => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  int? get propertyId => throw _privateConstructorUsedError;
  int? get createdBy => throw _privateConstructorUsedError;
  String? get referenceNumber => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;
  String? get amountPaid => throw _privateConstructorUsedError;
  String? get balance => throw _privateConstructorUsedError;
  String? get dueDate => throw _privateConstructorUsedError;
  String? get issueDate => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  bool? get isMandatory => throw _privateConstructorUsedError;
  bool? get allowPartialPayment => throw _privateConstructorUsedError;
  bool? get lateFeeApplied => throw _privateConstructorUsedError;
  dynamic get attachments => throw _privateConstructorUsedError;
  String? get internalNotes => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  dynamic get deletedAt => throw _privateConstructorUsedError;
  Pivot? get pivot => throw _privateConstructorUsedError;

  /// Serializes this DueItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DueItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DueItemCopyWith<DueItem> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DueItemCopyWith<$Res> {
  factory $DueItemCopyWith(DueItem value, $Res Function(DueItem) then) =
      _$DueItemCopyWithImpl<$Res, DueItem>;
  @useResult
  $Res call(
      {int? id,
      int? estateId,
      int? feeCategoryId,
      int? userId,
      int? propertyId,
      int? createdBy,
      String? referenceNumber,
      String? amount,
      String? amountPaid,
      String? balance,
      String? dueDate,
      String? issueDate,
      String? description,
      String? status,
      String? type,
      bool? isMandatory,
      bool? allowPartialPayment,
      bool? lateFeeApplied,
      dynamic attachments,
      String? internalNotes,
      String? createdAt,
      String? updatedAt,
      dynamic deletedAt,
      Pivot? pivot});

  $PivotCopyWith<$Res>? get pivot;
}

/// @nodoc
class _$DueItemCopyWithImpl<$Res, $Val extends DueItem>
    implements $DueItemCopyWith<$Res> {
  _$DueItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DueItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estateId = freezed,
    Object? feeCategoryId = freezed,
    Object? userId = freezed,
    Object? propertyId = freezed,
    Object? createdBy = freezed,
    Object? referenceNumber = freezed,
    Object? amount = freezed,
    Object? amountPaid = freezed,
    Object? balance = freezed,
    Object? dueDate = freezed,
    Object? issueDate = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? isMandatory = freezed,
    Object? allowPartialPayment = freezed,
    Object? lateFeeApplied = freezed,
    Object? attachments = freezed,
    Object? internalNotes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? pivot = freezed,
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
      feeCategoryId: freezed == feeCategoryId
          ? _value.feeCategoryId
          : feeCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      propertyId: freezed == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNumber: freezed == referenceNumber
          ? _value.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      amountPaid: freezed == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isMandatory: freezed == isMandatory
          ? _value.isMandatory
          : isMandatory // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowPartialPayment: freezed == allowPartialPayment
          ? _value.allowPartialPayment
          : allowPartialPayment // ignore: cast_nullable_to_non_nullable
              as bool?,
      lateFeeApplied: freezed == lateFeeApplied
          ? _value.lateFeeApplied
          : lateFeeApplied // ignore: cast_nullable_to_non_nullable
              as bool?,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as dynamic,
      internalNotes: freezed == internalNotes
          ? _value.internalNotes
          : internalNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pivot: freezed == pivot
          ? _value.pivot
          : pivot // ignore: cast_nullable_to_non_nullable
              as Pivot?,
    ) as $Val);
  }

  /// Create a copy of DueItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PivotCopyWith<$Res>? get pivot {
    if (_value.pivot == null) {
      return null;
    }

    return $PivotCopyWith<$Res>(_value.pivot!, (value) {
      return _then(_value.copyWith(pivot: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DueItemImplCopyWith<$Res> implements $DueItemCopyWith<$Res> {
  factory _$$DueItemImplCopyWith(
          _$DueItemImpl value, $Res Function(_$DueItemImpl) then) =
      __$$DueItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? estateId,
      int? feeCategoryId,
      int? userId,
      int? propertyId,
      int? createdBy,
      String? referenceNumber,
      String? amount,
      String? amountPaid,
      String? balance,
      String? dueDate,
      String? issueDate,
      String? description,
      String? status,
      String? type,
      bool? isMandatory,
      bool? allowPartialPayment,
      bool? lateFeeApplied,
      dynamic attachments,
      String? internalNotes,
      String? createdAt,
      String? updatedAt,
      dynamic deletedAt,
      Pivot? pivot});

  @override
  $PivotCopyWith<$Res>? get pivot;
}

/// @nodoc
class __$$DueItemImplCopyWithImpl<$Res>
    extends _$DueItemCopyWithImpl<$Res, _$DueItemImpl>
    implements _$$DueItemImplCopyWith<$Res> {
  __$$DueItemImplCopyWithImpl(
      _$DueItemImpl _value, $Res Function(_$DueItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of DueItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estateId = freezed,
    Object? feeCategoryId = freezed,
    Object? userId = freezed,
    Object? propertyId = freezed,
    Object? createdBy = freezed,
    Object? referenceNumber = freezed,
    Object? amount = freezed,
    Object? amountPaid = freezed,
    Object? balance = freezed,
    Object? dueDate = freezed,
    Object? issueDate = freezed,
    Object? description = freezed,
    Object? status = freezed,
    Object? type = freezed,
    Object? isMandatory = freezed,
    Object? allowPartialPayment = freezed,
    Object? lateFeeApplied = freezed,
    Object? attachments = freezed,
    Object? internalNotes = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? deletedAt = freezed,
    Object? pivot = freezed,
  }) {
    return _then(_$DueItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      feeCategoryId: freezed == feeCategoryId
          ? _value.feeCategoryId
          : feeCategoryId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      propertyId: freezed == propertyId
          ? _value.propertyId
          : propertyId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdBy: freezed == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int?,
      referenceNumber: freezed == referenceNumber
          ? _value.referenceNumber
          : referenceNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      amountPaid: freezed == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as String?,
      balance: freezed == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      issueDate: freezed == issueDate
          ? _value.issueDate
          : issueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      isMandatory: freezed == isMandatory
          ? _value.isMandatory
          : isMandatory // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowPartialPayment: freezed == allowPartialPayment
          ? _value.allowPartialPayment
          : allowPartialPayment // ignore: cast_nullable_to_non_nullable
              as bool?,
      lateFeeApplied: freezed == lateFeeApplied
          ? _value.lateFeeApplied
          : lateFeeApplied // ignore: cast_nullable_to_non_nullable
              as bool?,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as dynamic,
      internalNotes: freezed == internalNotes
          ? _value.internalNotes
          : internalNotes // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      deletedAt: freezed == deletedAt
          ? _value.deletedAt
          : deletedAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      pivot: freezed == pivot
          ? _value.pivot
          : pivot // ignore: cast_nullable_to_non_nullable
              as Pivot?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$DueItemImpl implements _DueItem {
  const _$DueItemImpl(
      {this.id,
      this.estateId,
      this.feeCategoryId,
      this.userId,
      this.propertyId,
      this.createdBy,
      this.referenceNumber,
      this.amount,
      this.amountPaid,
      this.balance,
      this.dueDate,
      this.issueDate,
      this.description,
      this.status,
      this.type,
      this.isMandatory,
      this.allowPartialPayment,
      this.lateFeeApplied,
      this.attachments,
      this.internalNotes,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.pivot});

  factory _$DueItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DueItemImplFromJson(json);

  @override
  final int? id;
  @override
  final int? estateId;
  @override
  final int? feeCategoryId;
  @override
  final int? userId;
  @override
  final int? propertyId;
  @override
  final int? createdBy;
  @override
  final String? referenceNumber;
  @override
  final String? amount;
  @override
  final String? amountPaid;
  @override
  final String? balance;
  @override
  final String? dueDate;
  @override
  final String? issueDate;
  @override
  final String? description;
  @override
  final String? status;
  @override
  final String? type;
  @override
  final bool? isMandatory;
  @override
  final bool? allowPartialPayment;
  @override
  final bool? lateFeeApplied;
  @override
  final dynamic attachments;
  @override
  final String? internalNotes;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  @override
  final dynamic deletedAt;
  @override
  final Pivot? pivot;

  @override
  String toString() {
    return 'DueItem(id: $id, estateId: $estateId, feeCategoryId: $feeCategoryId, userId: $userId, propertyId: $propertyId, createdBy: $createdBy, referenceNumber: $referenceNumber, amount: $amount, amountPaid: $amountPaid, balance: $balance, dueDate: $dueDate, issueDate: $issueDate, description: $description, status: $status, type: $type, isMandatory: $isMandatory, allowPartialPayment: $allowPartialPayment, lateFeeApplied: $lateFeeApplied, attachments: $attachments, internalNotes: $internalNotes, createdAt: $createdAt, updatedAt: $updatedAt, deletedAt: $deletedAt, pivot: $pivot)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DueItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            (identical(other.feeCategoryId, feeCategoryId) ||
                other.feeCategoryId == feeCategoryId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.propertyId, propertyId) ||
                other.propertyId == propertyId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.referenceNumber, referenceNumber) ||
                other.referenceNumber == referenceNumber) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.amountPaid, amountPaid) ||
                other.amountPaid == amountPaid) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.issueDate, issueDate) ||
                other.issueDate == issueDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isMandatory, isMandatory) ||
                other.isMandatory == isMandatory) &&
            (identical(other.allowPartialPayment, allowPartialPayment) ||
                other.allowPartialPayment == allowPartialPayment) &&
            (identical(other.lateFeeApplied, lateFeeApplied) ||
                other.lateFeeApplied == lateFeeApplied) &&
            const DeepCollectionEquality()
                .equals(other.attachments, attachments) &&
            (identical(other.internalNotes, internalNotes) ||
                other.internalNotes == internalNotes) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other.deletedAt, deletedAt) &&
            (identical(other.pivot, pivot) || other.pivot == pivot));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        estateId,
        feeCategoryId,
        userId,
        propertyId,
        createdBy,
        referenceNumber,
        amount,
        amountPaid,
        balance,
        dueDate,
        issueDate,
        description,
        status,
        type,
        isMandatory,
        allowPartialPayment,
        lateFeeApplied,
        const DeepCollectionEquality().hash(attachments),
        internalNotes,
        createdAt,
        updatedAt,
        const DeepCollectionEquality().hash(deletedAt),
        pivot
      ]);

  /// Create a copy of DueItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DueItemImplCopyWith<_$DueItemImpl> get copyWith =>
      __$$DueItemImplCopyWithImpl<_$DueItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DueItemImplToJson(
      this,
    );
  }
}

abstract class _DueItem implements DueItem {
  const factory _DueItem(
      {final int? id,
      final int? estateId,
      final int? feeCategoryId,
      final int? userId,
      final int? propertyId,
      final int? createdBy,
      final String? referenceNumber,
      final String? amount,
      final String? amountPaid,
      final String? balance,
      final String? dueDate,
      final String? issueDate,
      final String? description,
      final String? status,
      final String? type,
      final bool? isMandatory,
      final bool? allowPartialPayment,
      final bool? lateFeeApplied,
      final dynamic attachments,
      final String? internalNotes,
      final String? createdAt,
      final String? updatedAt,
      final dynamic deletedAt,
      final Pivot? pivot}) = _$DueItemImpl;

  factory _DueItem.fromJson(Map<String, dynamic> json) = _$DueItemImpl.fromJson;

  @override
  int? get id;
  @override
  int? get estateId;
  @override
  int? get feeCategoryId;
  @override
  int? get userId;
  @override
  int? get propertyId;
  @override
  int? get createdBy;
  @override
  String? get referenceNumber;
  @override
  String? get amount;
  @override
  String? get amountPaid;
  @override
  String? get balance;
  @override
  String? get dueDate;
  @override
  String? get issueDate;
  @override
  String? get description;
  @override
  String? get status;
  @override
  String? get type;
  @override
  bool? get isMandatory;
  @override
  bool? get allowPartialPayment;
  @override
  bool? get lateFeeApplied;
  @override
  dynamic get attachments;
  @override
  String? get internalNotes;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  dynamic get deletedAt;
  @override
  Pivot? get pivot;

  /// Create a copy of DueItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DueItemImplCopyWith<_$DueItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
