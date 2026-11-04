// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_history_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentHistoryData _$PaymentHistoryDataFromJson(Map<String, dynamic> json) {
  return _PaymentHistoryData.fromJson(json);
}

/// @nodoc
mixin _$PaymentHistoryData {
  TransactionsPaginator? get transactions => throw _privateConstructorUsedError;

  /// Serializes this PaymentHistoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentHistoryDataCopyWith<PaymentHistoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentHistoryDataCopyWith<$Res> {
  factory $PaymentHistoryDataCopyWith(
          PaymentHistoryData value, $Res Function(PaymentHistoryData) then) =
      _$PaymentHistoryDataCopyWithImpl<$Res, PaymentHistoryData>;
  @useResult
  $Res call({TransactionsPaginator? transactions});

  $TransactionsPaginatorCopyWith<$Res>? get transactions;
}

/// @nodoc
class _$PaymentHistoryDataCopyWithImpl<$Res, $Val extends PaymentHistoryData>
    implements $PaymentHistoryDataCopyWith<$Res> {
  _$PaymentHistoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = freezed,
  }) {
    return _then(_value.copyWith(
      transactions: freezed == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as TransactionsPaginator?,
    ) as $Val);
  }

  /// Create a copy of PaymentHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionsPaginatorCopyWith<$Res>? get transactions {
    if (_value.transactions == null) {
      return null;
    }

    return $TransactionsPaginatorCopyWith<$Res>(_value.transactions!, (value) {
      return _then(_value.copyWith(transactions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentHistoryDataImplCopyWith<$Res>
    implements $PaymentHistoryDataCopyWith<$Res> {
  factory _$$PaymentHistoryDataImplCopyWith(_$PaymentHistoryDataImpl value,
          $Res Function(_$PaymentHistoryDataImpl) then) =
      __$$PaymentHistoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TransactionsPaginator? transactions});

  @override
  $TransactionsPaginatorCopyWith<$Res>? get transactions;
}

/// @nodoc
class __$$PaymentHistoryDataImplCopyWithImpl<$Res>
    extends _$PaymentHistoryDataCopyWithImpl<$Res, _$PaymentHistoryDataImpl>
    implements _$$PaymentHistoryDataImplCopyWith<$Res> {
  __$$PaymentHistoryDataImplCopyWithImpl(_$PaymentHistoryDataImpl _value,
      $Res Function(_$PaymentHistoryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = freezed,
  }) {
    return _then(_$PaymentHistoryDataImpl(
      transactions: freezed == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as TransactionsPaginator?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PaymentHistoryDataImpl implements _PaymentHistoryData {
  const _$PaymentHistoryDataImpl({this.transactions});

  factory _$PaymentHistoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentHistoryDataImplFromJson(json);

  @override
  final TransactionsPaginator? transactions;

  @override
  String toString() {
    return 'PaymentHistoryData(transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentHistoryDataImpl &&
            (identical(other.transactions, transactions) ||
                other.transactions == transactions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, transactions);

  /// Create a copy of PaymentHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentHistoryDataImplCopyWith<_$PaymentHistoryDataImpl> get copyWith =>
      __$$PaymentHistoryDataImplCopyWithImpl<_$PaymentHistoryDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentHistoryDataImplToJson(
      this,
    );
  }
}

abstract class _PaymentHistoryData implements PaymentHistoryData {
  const factory _PaymentHistoryData(
      {final TransactionsPaginator? transactions}) = _$PaymentHistoryDataImpl;

  factory _PaymentHistoryData.fromJson(Map<String, dynamic> json) =
      _$PaymentHistoryDataImpl.fromJson;

  @override
  TransactionsPaginator? get transactions;

  /// Create a copy of PaymentHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentHistoryDataImplCopyWith<_$PaymentHistoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
