// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionItem _$TransactionItemFromJson(Map<String, dynamic> json) {
  return _TransactionItem.fromJson(json);
}

/// @nodoc
mixin _$TransactionItem {
  int? get id => throw _privateConstructorUsedError;
  int? get estateId => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  int? get walletId => throw _privateConstructorUsedError;
  String? get transactionReference => throw _privateConstructorUsedError;
  String? get paymentReference => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get paymentGateway => throw _privateConstructorUsedError;
  String? get transactionType => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Metadata? get metadata => throw _privateConstructorUsedError;
  String? get paidAt => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;
  List<DueItem>? get dues => throw _privateConstructorUsedError;
  Receipt? get receipt => throw _privateConstructorUsedError;

  /// Serializes this TransactionItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionItemCopyWith<TransactionItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionItemCopyWith<$Res> {
  factory $TransactionItemCopyWith(
          TransactionItem value, $Res Function(TransactionItem) then) =
      _$TransactionItemCopyWithImpl<$Res, TransactionItem>;
  @useResult
  $Res call(
      {int? id,
      int? estateId,
      int? userId,
      int? walletId,
      String? transactionReference,
      String? paymentReference,
      String? amount,
      String? paymentMethod,
      String? paymentGateway,
      String? transactionType,
      String? status,
      String? description,
      Metadata? metadata,
      String? paidAt,
      String? createdAt,
      String? updatedAt,
      List<DueItem>? dues,
      Receipt? receipt});

  $MetadataCopyWith<$Res>? get metadata;
  $ReceiptCopyWith<$Res>? get receipt;
}

/// @nodoc
class _$TransactionItemCopyWithImpl<$Res, $Val extends TransactionItem>
    implements $TransactionItemCopyWith<$Res> {
  _$TransactionItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estateId = freezed,
    Object? userId = freezed,
    Object? walletId = freezed,
    Object? transactionReference = freezed,
    Object? paymentReference = freezed,
    Object? amount = freezed,
    Object? paymentMethod = freezed,
    Object? paymentGateway = freezed,
    Object? transactionType = freezed,
    Object? status = freezed,
    Object? description = freezed,
    Object? metadata = freezed,
    Object? paidAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? dues = freezed,
    Object? receipt = freezed,
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
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionReference: freezed == transactionReference
          ? _value.transactionReference
          : transactionReference // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentReference: freezed == paymentReference
          ? _value.paymentReference
          : paymentReference // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentGateway: freezed == paymentGateway
          ? _value.paymentGateway
          : paymentGateway // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Metadata?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      dues: freezed == dues
          ? _value.dues
          : dues // ignore: cast_nullable_to_non_nullable
              as List<DueItem>?,
      receipt: freezed == receipt
          ? _value.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as Receipt?,
    ) as $Val);
  }

  /// Create a copy of TransactionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $MetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }

  /// Create a copy of TransactionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReceiptCopyWith<$Res>? get receipt {
    if (_value.receipt == null) {
      return null;
    }

    return $ReceiptCopyWith<$Res>(_value.receipt!, (value) {
      return _then(_value.copyWith(receipt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TransactionItemImplCopyWith<$Res>
    implements $TransactionItemCopyWith<$Res> {
  factory _$$TransactionItemImplCopyWith(_$TransactionItemImpl value,
          $Res Function(_$TransactionItemImpl) then) =
      __$$TransactionItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? estateId,
      int? userId,
      int? walletId,
      String? transactionReference,
      String? paymentReference,
      String? amount,
      String? paymentMethod,
      String? paymentGateway,
      String? transactionType,
      String? status,
      String? description,
      Metadata? metadata,
      String? paidAt,
      String? createdAt,
      String? updatedAt,
      List<DueItem>? dues,
      Receipt? receipt});

  @override
  $MetadataCopyWith<$Res>? get metadata;
  @override
  $ReceiptCopyWith<$Res>? get receipt;
}

/// @nodoc
class __$$TransactionItemImplCopyWithImpl<$Res>
    extends _$TransactionItemCopyWithImpl<$Res, _$TransactionItemImpl>
    implements _$$TransactionItemImplCopyWith<$Res> {
  __$$TransactionItemImplCopyWithImpl(
      _$TransactionItemImpl _value, $Res Function(_$TransactionItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estateId = freezed,
    Object? userId = freezed,
    Object? walletId = freezed,
    Object? transactionReference = freezed,
    Object? paymentReference = freezed,
    Object? amount = freezed,
    Object? paymentMethod = freezed,
    Object? paymentGateway = freezed,
    Object? transactionType = freezed,
    Object? status = freezed,
    Object? description = freezed,
    Object? metadata = freezed,
    Object? paidAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? dues = freezed,
    Object? receipt = freezed,
  }) {
    return _then(_$TransactionItemImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      estateId: freezed == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      walletId: freezed == walletId
          ? _value.walletId
          : walletId // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionReference: freezed == transactionReference
          ? _value.transactionReference
          : transactionReference // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentReference: freezed == paymentReference
          ? _value.paymentReference
          : paymentReference // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentGateway: freezed == paymentGateway
          ? _value.paymentGateway
          : paymentGateway // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Metadata?,
      paidAt: freezed == paidAt
          ? _value.paidAt
          : paidAt // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      dues: freezed == dues
          ? _value._dues
          : dues // ignore: cast_nullable_to_non_nullable
              as List<DueItem>?,
      receipt: freezed == receipt
          ? _value.receipt
          : receipt // ignore: cast_nullable_to_non_nullable
              as Receipt?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$TransactionItemImpl implements _TransactionItem {
  const _$TransactionItemImpl(
      {this.id,
      this.estateId,
      this.userId,
      this.walletId,
      this.transactionReference,
      this.paymentReference,
      this.amount,
      this.paymentMethod,
      this.paymentGateway,
      this.transactionType,
      this.status,
      this.description,
      this.metadata,
      this.paidAt,
      this.createdAt,
      this.updatedAt,
      final List<DueItem>? dues,
      this.receipt})
      : _dues = dues;

  factory _$TransactionItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionItemImplFromJson(json);

  @override
  final int? id;
  @override
  final int? estateId;
  @override
  final int? userId;
  @override
  final int? walletId;
  @override
  final String? transactionReference;
  @override
  final String? paymentReference;
  @override
  final String? amount;
  @override
  final String? paymentMethod;
  @override
  final String? paymentGateway;
  @override
  final String? transactionType;
  @override
  final String? status;
  @override
  final String? description;
  @override
  final Metadata? metadata;
  @override
  final String? paidAt;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;
  final List<DueItem>? _dues;
  @override
  List<DueItem>? get dues {
    final value = _dues;
    if (value == null) return null;
    if (_dues is EqualUnmodifiableListView) return _dues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Receipt? receipt;

  @override
  String toString() {
    return 'TransactionItem(id: $id, estateId: $estateId, userId: $userId, walletId: $walletId, transactionReference: $transactionReference, paymentReference: $paymentReference, amount: $amount, paymentMethod: $paymentMethod, paymentGateway: $paymentGateway, transactionType: $transactionType, status: $status, description: $description, metadata: $metadata, paidAt: $paidAt, createdAt: $createdAt, updatedAt: $updatedAt, dues: $dues, receipt: $receipt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.walletId, walletId) ||
                other.walletId == walletId) &&
            (identical(other.transactionReference, transactionReference) ||
                other.transactionReference == transactionReference) &&
            (identical(other.paymentReference, paymentReference) ||
                other.paymentReference == paymentReference) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.paymentGateway, paymentGateway) ||
                other.paymentGateway == paymentGateway) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.paidAt, paidAt) || other.paidAt == paidAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            const DeepCollectionEquality().equals(other._dues, _dues) &&
            (identical(other.receipt, receipt) || other.receipt == receipt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      estateId,
      userId,
      walletId,
      transactionReference,
      paymentReference,
      amount,
      paymentMethod,
      paymentGateway,
      transactionType,
      status,
      description,
      metadata,
      paidAt,
      createdAt,
      updatedAt,
      const DeepCollectionEquality().hash(_dues),
      receipt);

  /// Create a copy of TransactionItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionItemImplCopyWith<_$TransactionItemImpl> get copyWith =>
      __$$TransactionItemImplCopyWithImpl<_$TransactionItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionItemImplToJson(
      this,
    );
  }
}

abstract class _TransactionItem implements TransactionItem {
  const factory _TransactionItem(
      {final int? id,
      final int? estateId,
      final int? userId,
      final int? walletId,
      final String? transactionReference,
      final String? paymentReference,
      final String? amount,
      final String? paymentMethod,
      final String? paymentGateway,
      final String? transactionType,
      final String? status,
      final String? description,
      final Metadata? metadata,
      final String? paidAt,
      final String? createdAt,
      final String? updatedAt,
      final List<DueItem>? dues,
      final Receipt? receipt}) = _$TransactionItemImpl;

  factory _TransactionItem.fromJson(Map<String, dynamic> json) =
      _$TransactionItemImpl.fromJson;

  @override
  int? get id;
  @override
  int? get estateId;
  @override
  int? get userId;
  @override
  int? get walletId;
  @override
  String? get transactionReference;
  @override
  String? get paymentReference;
  @override
  String? get amount;
  @override
  String? get paymentMethod;
  @override
  String? get paymentGateway;
  @override
  String? get transactionType;
  @override
  String? get status;
  @override
  String? get description;
  @override
  Metadata? get metadata;
  @override
  String? get paidAt;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;
  @override
  List<DueItem>? get dues;
  @override
  Receipt? get receipt;

  /// Create a copy of TransactionItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionItemImplCopyWith<_$TransactionItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
