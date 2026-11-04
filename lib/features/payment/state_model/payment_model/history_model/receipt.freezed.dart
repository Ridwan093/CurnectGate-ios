// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Receipt _$ReceiptFromJson(Map<String, dynamic> json) {
  return _Receipt.fromJson(json);
}

/// @nodoc
mixin _$Receipt {
  int? get id => throw _privateConstructorUsedError;
  int? get estateId => throw _privateConstructorUsedError;
  int? get userId => throw _privateConstructorUsedError;
  String? get amount => throw _privateConstructorUsedError;
  int? get paymentTransactionId => throw _privateConstructorUsedError;
  String? get receiptNumber => throw _privateConstructorUsedError;
  String? get totalAmount => throw _privateConstructorUsedError;
  List<ReceiptItem>? get itemsPaid => throw _privateConstructorUsedError;
  String? get paymentMethod => throw _privateConstructorUsedError;
  String? get balanceAfterPayment => throw _privateConstructorUsedError;
  String? get pdfUrl => throw _privateConstructorUsedError;
  String? get pdfPath => throw _privateConstructorUsedError;
  String? get pdfPublicId => throw _privateConstructorUsedError;
  bool? get emailSent => throw _privateConstructorUsedError;
  String? get issuedAt => throw _privateConstructorUsedError;
  String? get emailSentAt => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Receipt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Receipt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiptCopyWith<Receipt> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptCopyWith<$Res> {
  factory $ReceiptCopyWith(Receipt value, $Res Function(Receipt) then) =
      _$ReceiptCopyWithImpl<$Res, Receipt>;
  @useResult
  $Res call(
      {int? id,
      int? estateId,
      int? userId,
      String? amount,
      int? paymentTransactionId,
      String? receiptNumber,
      String? totalAmount,
      List<ReceiptItem>? itemsPaid,
      String? paymentMethod,
      String? balanceAfterPayment,
      String? pdfUrl,
      String? pdfPath,
      String? pdfPublicId,
      bool? emailSent,
      String? issuedAt,
      String? emailSentAt,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$ReceiptCopyWithImpl<$Res, $Val extends Receipt>
    implements $ReceiptCopyWith<$Res> {
  _$ReceiptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Receipt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estateId = freezed,
    Object? userId = freezed,
    Object? amount = freezed,
    Object? paymentTransactionId = freezed,
    Object? receiptNumber = freezed,
    Object? totalAmount = freezed,
    Object? itemsPaid = freezed,
    Object? paymentMethod = freezed,
    Object? balanceAfterPayment = freezed,
    Object? pdfUrl = freezed,
    Object? pdfPath = freezed,
    Object? pdfPublicId = freezed,
    Object? emailSent = freezed,
    Object? issuedAt = freezed,
    Object? emailSentAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
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
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentTransactionId: freezed == paymentTransactionId
          ? _value.paymentTransactionId
          : paymentTransactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      receiptNumber: freezed == receiptNumber
          ? _value.receiptNumber
          : receiptNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsPaid: freezed == itemsPaid
          ? _value.itemsPaid
          : itemsPaid // ignore: cast_nullable_to_non_nullable
              as List<ReceiptItem>?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      balanceAfterPayment: freezed == balanceAfterPayment
          ? _value.balanceAfterPayment
          : balanceAfterPayment // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfUrl: freezed == pdfUrl
          ? _value.pdfUrl
          : pdfUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfPath: freezed == pdfPath
          ? _value.pdfPath
          : pdfPath // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfPublicId: freezed == pdfPublicId
          ? _value.pdfPublicId
          : pdfPublicId // ignore: cast_nullable_to_non_nullable
              as String?,
      emailSent: freezed == emailSent
          ? _value.emailSent
          : emailSent // ignore: cast_nullable_to_non_nullable
              as bool?,
      issuedAt: freezed == issuedAt
          ? _value.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      emailSentAt: freezed == emailSentAt
          ? _value.emailSentAt
          : emailSentAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
}

/// @nodoc
abstract class _$$ReceiptImplCopyWith<$Res> implements $ReceiptCopyWith<$Res> {
  factory _$$ReceiptImplCopyWith(
          _$ReceiptImpl value, $Res Function(_$ReceiptImpl) then) =
      __$$ReceiptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? estateId,
      int? userId,
      String? amount,
      int? paymentTransactionId,
      String? receiptNumber,
      String? totalAmount,
      List<ReceiptItem>? itemsPaid,
      String? paymentMethod,
      String? balanceAfterPayment,
      String? pdfUrl,
      String? pdfPath,
      String? pdfPublicId,
      bool? emailSent,
      String? issuedAt,
      String? emailSentAt,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$$ReceiptImplCopyWithImpl<$Res>
    extends _$ReceiptCopyWithImpl<$Res, _$ReceiptImpl>
    implements _$$ReceiptImplCopyWith<$Res> {
  __$$ReceiptImplCopyWithImpl(
      _$ReceiptImpl _value, $Res Function(_$ReceiptImpl) _then)
      : super(_value, _then);

  /// Create a copy of Receipt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? estateId = freezed,
    Object? userId = freezed,
    Object? amount = freezed,
    Object? paymentTransactionId = freezed,
    Object? receiptNumber = freezed,
    Object? totalAmount = freezed,
    Object? itemsPaid = freezed,
    Object? paymentMethod = freezed,
    Object? balanceAfterPayment = freezed,
    Object? pdfUrl = freezed,
    Object? pdfPath = freezed,
    Object? pdfPublicId = freezed,
    Object? emailSent = freezed,
    Object? issuedAt = freezed,
    Object? emailSentAt = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_$ReceiptImpl(
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
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentTransactionId: freezed == paymentTransactionId
          ? _value.paymentTransactionId
          : paymentTransactionId // ignore: cast_nullable_to_non_nullable
              as int?,
      receiptNumber: freezed == receiptNumber
          ? _value.receiptNumber
          : receiptNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      itemsPaid: freezed == itemsPaid
          ? _value._itemsPaid
          : itemsPaid // ignore: cast_nullable_to_non_nullable
              as List<ReceiptItem>?,
      paymentMethod: freezed == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      balanceAfterPayment: freezed == balanceAfterPayment
          ? _value.balanceAfterPayment
          : balanceAfterPayment // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfUrl: freezed == pdfUrl
          ? _value.pdfUrl
          : pdfUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfPath: freezed == pdfPath
          ? _value.pdfPath
          : pdfPath // ignore: cast_nullable_to_non_nullable
              as String?,
      pdfPublicId: freezed == pdfPublicId
          ? _value.pdfPublicId
          : pdfPublicId // ignore: cast_nullable_to_non_nullable
              as String?,
      emailSent: freezed == emailSent
          ? _value.emailSent
          : emailSent // ignore: cast_nullable_to_non_nullable
              as bool?,
      issuedAt: freezed == issuedAt
          ? _value.issuedAt
          : issuedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      emailSentAt: freezed == emailSentAt
          ? _value.emailSentAt
          : emailSentAt // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _$ReceiptImpl implements _Receipt {
  const _$ReceiptImpl(
      {this.id,
      this.estateId,
      this.userId,
      this.amount,
      this.paymentTransactionId,
      this.receiptNumber,
      this.totalAmount,
      final List<ReceiptItem>? itemsPaid,
      this.paymentMethod,
      this.balanceAfterPayment,
      this.pdfUrl,
      this.pdfPath,
      this.pdfPublicId,
      this.emailSent,
      this.issuedAt,
      this.emailSentAt,
      this.createdAt,
      this.updatedAt})
      : _itemsPaid = itemsPaid;

  factory _$ReceiptImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptImplFromJson(json);

  @override
  final int? id;
  @override
  final int? estateId;
  @override
  final int? userId;
  @override
  final String? amount;
  @override
  final int? paymentTransactionId;
  @override
  final String? receiptNumber;
  @override
  final String? totalAmount;
  final List<ReceiptItem>? _itemsPaid;
  @override
  List<ReceiptItem>? get itemsPaid {
    final value = _itemsPaid;
    if (value == null) return null;
    if (_itemsPaid is EqualUnmodifiableListView) return _itemsPaid;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? paymentMethod;
  @override
  final String? balanceAfterPayment;
  @override
  final String? pdfUrl;
  @override
  final String? pdfPath;
  @override
  final String? pdfPublicId;
  @override
  final bool? emailSent;
  @override
  final String? issuedAt;
  @override
  final String? emailSentAt;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'Receipt(id: $id, estateId: $estateId, userId: $userId, amount: $amount, paymentTransactionId: $paymentTransactionId, receiptNumber: $receiptNumber, totalAmount: $totalAmount, itemsPaid: $itemsPaid, paymentMethod: $paymentMethod, balanceAfterPayment: $balanceAfterPayment, pdfUrl: $pdfUrl, pdfPath: $pdfPath, pdfPublicId: $pdfPublicId, emailSent: $emailSent, issuedAt: $issuedAt, emailSentAt: $emailSentAt, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.paymentTransactionId, paymentTransactionId) ||
                other.paymentTransactionId == paymentTransactionId) &&
            (identical(other.receiptNumber, receiptNumber) ||
                other.receiptNumber == receiptNumber) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            const DeepCollectionEquality()
                .equals(other._itemsPaid, _itemsPaid) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.balanceAfterPayment, balanceAfterPayment) ||
                other.balanceAfterPayment == balanceAfterPayment) &&
            (identical(other.pdfUrl, pdfUrl) || other.pdfUrl == pdfUrl) &&
            (identical(other.pdfPath, pdfPath) || other.pdfPath == pdfPath) &&
            (identical(other.pdfPublicId, pdfPublicId) ||
                other.pdfPublicId == pdfPublicId) &&
            (identical(other.emailSent, emailSent) ||
                other.emailSent == emailSent) &&
            (identical(other.issuedAt, issuedAt) ||
                other.issuedAt == issuedAt) &&
            (identical(other.emailSentAt, emailSentAt) ||
                other.emailSentAt == emailSentAt) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      estateId,
      userId,
      amount,
      paymentTransactionId,
      receiptNumber,
      totalAmount,
      const DeepCollectionEquality().hash(_itemsPaid),
      paymentMethod,
      balanceAfterPayment,
      pdfUrl,
      pdfPath,
      pdfPublicId,
      emailSent,
      issuedAt,
      emailSentAt,
      createdAt,
      updatedAt);

  /// Create a copy of Receipt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptImplCopyWith<_$ReceiptImpl> get copyWith =>
      __$$ReceiptImplCopyWithImpl<_$ReceiptImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptImplToJson(
      this,
    );
  }
}

abstract class _Receipt implements Receipt {
  const factory _Receipt(
      {final int? id,
      final int? estateId,
      final int? userId,
      final String? amount,
      final int? paymentTransactionId,
      final String? receiptNumber,
      final String? totalAmount,
      final List<ReceiptItem>? itemsPaid,
      final String? paymentMethod,
      final String? balanceAfterPayment,
      final String? pdfUrl,
      final String? pdfPath,
      final String? pdfPublicId,
      final bool? emailSent,
      final String? issuedAt,
      final String? emailSentAt,
      final String? createdAt,
      final String? updatedAt}) = _$ReceiptImpl;

  factory _Receipt.fromJson(Map<String, dynamic> json) = _$ReceiptImpl.fromJson;

  @override
  int? get id;
  @override
  int? get estateId;
  @override
  int? get userId;
  @override
  String? get amount;
  @override
  int? get paymentTransactionId;
  @override
  String? get receiptNumber;
  @override
  String? get totalAmount;
  @override
  List<ReceiptItem>? get itemsPaid;
  @override
  String? get paymentMethod;
  @override
  String? get balanceAfterPayment;
  @override
  String? get pdfUrl;
  @override
  String? get pdfPath;
  @override
  String? get pdfPublicId;
  @override
  bool? get emailSent;
  @override
  String? get issuedAt;
  @override
  String? get emailSentAt;
  @override
  String? get createdAt;
  @override
  String? get updatedAt;

  /// Create a copy of Receipt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptImplCopyWith<_$ReceiptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
