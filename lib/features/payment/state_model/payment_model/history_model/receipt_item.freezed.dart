// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReceiptItem _$ReceiptItemFromJson(Map<String, dynamic> json) {
  return _ReceiptItem.fromJson(json);
}

/// @nodoc
mixin _$ReceiptItem {
  String? get amount => throw _privateConstructorUsedError;
  int? get dueId => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get dueDate => throw _privateConstructorUsedError;
  String? get reference => throw _privateConstructorUsedError;

  /// Serializes this ReceiptItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReceiptItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiptItemCopyWith<ReceiptItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptItemCopyWith<$Res> {
  factory $ReceiptItemCopyWith(
          ReceiptItem value, $Res Function(ReceiptItem) then) =
      _$ReceiptItemCopyWithImpl<$Res, ReceiptItem>;
  @useResult
  $Res call(
      {String? amount,
      int? dueId,
      String? category,
      String? dueDate,
      String? reference});
}

/// @nodoc
class _$ReceiptItemCopyWithImpl<$Res, $Val extends ReceiptItem>
    implements $ReceiptItemCopyWith<$Res> {
  _$ReceiptItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceiptItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? dueId = freezed,
    Object? category = freezed,
    Object? dueDate = freezed,
    Object? reference = freezed,
  }) {
    return _then(_value.copyWith(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      dueId: freezed == dueId
          ? _value.dueId
          : dueId // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiptItemImplCopyWith<$Res>
    implements $ReceiptItemCopyWith<$Res> {
  factory _$$ReceiptItemImplCopyWith(
          _$ReceiptItemImpl value, $Res Function(_$ReceiptItemImpl) then) =
      __$$ReceiptItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? amount,
      int? dueId,
      String? category,
      String? dueDate,
      String? reference});
}

/// @nodoc
class __$$ReceiptItemImplCopyWithImpl<$Res>
    extends _$ReceiptItemCopyWithImpl<$Res, _$ReceiptItemImpl>
    implements _$$ReceiptItemImplCopyWith<$Res> {
  __$$ReceiptItemImplCopyWithImpl(
      _$ReceiptItemImpl _value, $Res Function(_$ReceiptItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = freezed,
    Object? dueId = freezed,
    Object? category = freezed,
    Object? dueDate = freezed,
    Object? reference = freezed,
  }) {
    return _then(_$ReceiptItemImpl(
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as String?,
      dueId: freezed == dueId
          ? _value.dueId
          : dueId // ignore: cast_nullable_to_non_nullable
              as int?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      dueDate: freezed == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as String?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$ReceiptItemImpl implements _ReceiptItem {
  const _$ReceiptItemImpl(
      {this.amount, this.dueId, this.category, this.dueDate, this.reference});

  factory _$ReceiptItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptItemImplFromJson(json);

  @override
  final String? amount;
  @override
  final int? dueId;
  @override
  final String? category;
  @override
  final String? dueDate;
  @override
  final String? reference;

  @override
  String toString() {
    return 'ReceiptItem(amount: $amount, dueId: $dueId, category: $category, dueDate: $dueDate, reference: $reference)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptItemImpl &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.dueId, dueId) || other.dueId == dueId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.reference, reference) ||
                other.reference == reference));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, dueId, category, dueDate, reference);

  /// Create a copy of ReceiptItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptItemImplCopyWith<_$ReceiptItemImpl> get copyWith =>
      __$$ReceiptItemImplCopyWithImpl<_$ReceiptItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptItemImplToJson(
      this,
    );
  }
}

abstract class _ReceiptItem implements ReceiptItem {
  const factory _ReceiptItem(
      {final String? amount,
      final int? dueId,
      final String? category,
      final String? dueDate,
      final String? reference}) = _$ReceiptItemImpl;

  factory _ReceiptItem.fromJson(Map<String, dynamic> json) =
      _$ReceiptItemImpl.fromJson;

  @override
  String? get amount;
  @override
  int? get dueId;
  @override
  String? get category;
  @override
  String? get dueDate;
  @override
  String? get reference;

  /// Create a copy of ReceiptItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptItemImplCopyWith<_$ReceiptItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
