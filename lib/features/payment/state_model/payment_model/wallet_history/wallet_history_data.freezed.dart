// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_history_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WalletHistoryData _$WalletHistoryDataFromJson(Map<String, dynamic> json) {
  return _WalletHistoryData.fromJson(json);
}

/// @nodoc
mixin _$WalletHistoryData {
  WalletTransactionsPaginator? get transactions =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'grouped_by_month')
  Map<String, List<WalletTransactionItem>>? get groupedByMonth =>
      throw _privateConstructorUsedError;
  WalletSummary? get summary => throw _privateConstructorUsedError;

  /// Serializes this WalletHistoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletHistoryDataCopyWith<WalletHistoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletHistoryDataCopyWith<$Res> {
  factory $WalletHistoryDataCopyWith(
          WalletHistoryData value, $Res Function(WalletHistoryData) then) =
      _$WalletHistoryDataCopyWithImpl<$Res, WalletHistoryData>;
  @useResult
  $Res call(
      {WalletTransactionsPaginator? transactions,
      @JsonKey(name: 'grouped_by_month')
      Map<String, List<WalletTransactionItem>>? groupedByMonth,
      WalletSummary? summary});

  $WalletTransactionsPaginatorCopyWith<$Res>? get transactions;
  $WalletSummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class _$WalletHistoryDataCopyWithImpl<$Res, $Val extends WalletHistoryData>
    implements $WalletHistoryDataCopyWith<$Res> {
  _$WalletHistoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = freezed,
    Object? groupedByMonth = freezed,
    Object? summary = freezed,
  }) {
    return _then(_value.copyWith(
      transactions: freezed == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as WalletTransactionsPaginator?,
      groupedByMonth: freezed == groupedByMonth
          ? _value.groupedByMonth
          : groupedByMonth // ignore: cast_nullable_to_non_nullable
              as Map<String, List<WalletTransactionItem>>?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as WalletSummary?,
    ) as $Val);
  }

  /// Create a copy of WalletHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletTransactionsPaginatorCopyWith<$Res>? get transactions {
    if (_value.transactions == null) {
      return null;
    }

    return $WalletTransactionsPaginatorCopyWith<$Res>(_value.transactions!,
        (value) {
      return _then(_value.copyWith(transactions: value) as $Val);
    });
  }

  /// Create a copy of WalletHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletSummaryCopyWith<$Res>? get summary {
    if (_value.summary == null) {
      return null;
    }

    return $WalletSummaryCopyWith<$Res>(_value.summary!, (value) {
      return _then(_value.copyWith(summary: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WalletHistoryDataImplCopyWith<$Res>
    implements $WalletHistoryDataCopyWith<$Res> {
  factory _$$WalletHistoryDataImplCopyWith(_$WalletHistoryDataImpl value,
          $Res Function(_$WalletHistoryDataImpl) then) =
      __$$WalletHistoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {WalletTransactionsPaginator? transactions,
      @JsonKey(name: 'grouped_by_month')
      Map<String, List<WalletTransactionItem>>? groupedByMonth,
      WalletSummary? summary});

  @override
  $WalletTransactionsPaginatorCopyWith<$Res>? get transactions;
  @override
  $WalletSummaryCopyWith<$Res>? get summary;
}

/// @nodoc
class __$$WalletHistoryDataImplCopyWithImpl<$Res>
    extends _$WalletHistoryDataCopyWithImpl<$Res, _$WalletHistoryDataImpl>
    implements _$$WalletHistoryDataImplCopyWith<$Res> {
  __$$WalletHistoryDataImplCopyWithImpl(_$WalletHistoryDataImpl _value,
      $Res Function(_$WalletHistoryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = freezed,
    Object? groupedByMonth = freezed,
    Object? summary = freezed,
  }) {
    return _then(_$WalletHistoryDataImpl(
      transactions: freezed == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as WalletTransactionsPaginator?,
      groupedByMonth: freezed == groupedByMonth
          ? _value._groupedByMonth
          : groupedByMonth // ignore: cast_nullable_to_non_nullable
              as Map<String, List<WalletTransactionItem>>?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as WalletSummary?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$WalletHistoryDataImpl implements _WalletHistoryData {
  const _$WalletHistoryDataImpl(
      {this.transactions,
      @JsonKey(name: 'grouped_by_month')
      final Map<String, List<WalletTransactionItem>>? groupedByMonth,
      this.summary})
      : _groupedByMonth = groupedByMonth;

  factory _$WalletHistoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletHistoryDataImplFromJson(json);

  @override
  final WalletTransactionsPaginator? transactions;
  final Map<String, List<WalletTransactionItem>>? _groupedByMonth;
  @override
  @JsonKey(name: 'grouped_by_month')
  Map<String, List<WalletTransactionItem>>? get groupedByMonth {
    final value = _groupedByMonth;
    if (value == null) return null;
    if (_groupedByMonth is EqualUnmodifiableMapView) return _groupedByMonth;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final WalletSummary? summary;

  @override
  String toString() {
    return 'WalletHistoryData(transactions: $transactions, groupedByMonth: $groupedByMonth, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletHistoryDataImpl &&
            (identical(other.transactions, transactions) ||
                other.transactions == transactions) &&
            const DeepCollectionEquality()
                .equals(other._groupedByMonth, _groupedByMonth) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, transactions,
      const DeepCollectionEquality().hash(_groupedByMonth), summary);

  /// Create a copy of WalletHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletHistoryDataImplCopyWith<_$WalletHistoryDataImpl> get copyWith =>
      __$$WalletHistoryDataImplCopyWithImpl<_$WalletHistoryDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletHistoryDataImplToJson(
      this,
    );
  }
}

abstract class _WalletHistoryData implements WalletHistoryData {
  const factory _WalletHistoryData(
      {final WalletTransactionsPaginator? transactions,
      @JsonKey(name: 'grouped_by_month')
      final Map<String, List<WalletTransactionItem>>? groupedByMonth,
      final WalletSummary? summary}) = _$WalletHistoryDataImpl;

  factory _WalletHistoryData.fromJson(Map<String, dynamic> json) =
      _$WalletHistoryDataImpl.fromJson;

  @override
  WalletTransactionsPaginator? get transactions;
  @override
  @JsonKey(name: 'grouped_by_month')
  Map<String, List<WalletTransactionItem>>? get groupedByMonth;
  @override
  WalletSummary? get summary;

  /// Create a copy of WalletHistoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletHistoryDataImplCopyWith<_$WalletHistoryDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
