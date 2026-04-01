// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_dashboard_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentDashboardData _$PaymentDashboardDataFromJson(Map<String, dynamic> json) {
  return _PaymentDashboardData.fromJson(json);
}

/// @nodoc
mixin _$PaymentDashboardData {
  String? get walletBalance => throw _privateConstructorUsedError;
  double? get totalOutstanding => throw _privateConstructorUsedError;
  double? get totalOverdue => throw _privateConstructorUsedError;
  int? get outstandingDuesCount => throw _privateConstructorUsedError;
  int? get overdueDuesCount => throw _privateConstructorUsedError;
  bool? get hasSufficientBalance => throw _privateConstructorUsedError;
  List<OutstandingDue>? get outstandingDues =>
      throw _privateConstructorUsedError;
  Wallet? get wallet => throw _privateConstructorUsedError;
  List<dynamic>? get virtualAccounts => throw _privateConstructorUsedError;
  List<RecentTransaction>? get recentTransactions =>
      throw _privateConstructorUsedError;

  /// Serializes this PaymentDashboardData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentDashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentDashboardDataCopyWith<PaymentDashboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentDashboardDataCopyWith<$Res> {
  factory $PaymentDashboardDataCopyWith(PaymentDashboardData value,
          $Res Function(PaymentDashboardData) then) =
      _$PaymentDashboardDataCopyWithImpl<$Res, PaymentDashboardData>;
  @useResult
  $Res call(
      {String? walletBalance,
      double? totalOutstanding,
      double? totalOverdue,
      int? outstandingDuesCount,
      int? overdueDuesCount,
      bool? hasSufficientBalance,
      List<OutstandingDue>? outstandingDues,
      Wallet? wallet,
      List<dynamic>? virtualAccounts,
      List<RecentTransaction>? recentTransactions});

  $WalletCopyWith<$Res>? get wallet;
}

/// @nodoc
class _$PaymentDashboardDataCopyWithImpl<$Res,
        $Val extends PaymentDashboardData>
    implements $PaymentDashboardDataCopyWith<$Res> {
  _$PaymentDashboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentDashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletBalance = freezed,
    Object? totalOutstanding = freezed,
    Object? totalOverdue = freezed,
    Object? outstandingDuesCount = freezed,
    Object? overdueDuesCount = freezed,
    Object? hasSufficientBalance = freezed,
    Object? outstandingDues = freezed,
    Object? wallet = freezed,
    Object? virtualAccounts = freezed,
    Object? recentTransactions = freezed,
  }) {
    return _then(_value.copyWith(
      walletBalance: freezed == walletBalance
          ? _value.walletBalance
          : walletBalance // ignore: cast_nullable_to_non_nullable
              as String?,
      totalOutstanding: freezed == totalOutstanding
          ? _value.totalOutstanding
          : totalOutstanding // ignore: cast_nullable_to_non_nullable
              as double?,
      totalOverdue: freezed == totalOverdue
          ? _value.totalOverdue
          : totalOverdue // ignore: cast_nullable_to_non_nullable
              as double?,
      outstandingDuesCount: freezed == outstandingDuesCount
          ? _value.outstandingDuesCount
          : outstandingDuesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      overdueDuesCount: freezed == overdueDuesCount
          ? _value.overdueDuesCount
          : overdueDuesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      hasSufficientBalance: freezed == hasSufficientBalance
          ? _value.hasSufficientBalance
          : hasSufficientBalance // ignore: cast_nullable_to_non_nullable
              as bool?,
      outstandingDues: freezed == outstandingDues
          ? _value.outstandingDues
          : outstandingDues // ignore: cast_nullable_to_non_nullable
              as List<OutstandingDue>?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as Wallet?,
      virtualAccounts: freezed == virtualAccounts
          ? _value.virtualAccounts
          : virtualAccounts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      recentTransactions: freezed == recentTransactions
          ? _value.recentTransactions
          : recentTransactions // ignore: cast_nullable_to_non_nullable
              as List<RecentTransaction>?,
    ) as $Val);
  }

  /// Create a copy of PaymentDashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WalletCopyWith<$Res>? get wallet {
    if (_value.wallet == null) {
      return null;
    }

    return $WalletCopyWith<$Res>(_value.wallet!, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PaymentDashboardDataImplCopyWith<$Res>
    implements $PaymentDashboardDataCopyWith<$Res> {
  factory _$$PaymentDashboardDataImplCopyWith(_$PaymentDashboardDataImpl value,
          $Res Function(_$PaymentDashboardDataImpl) then) =
      __$$PaymentDashboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? walletBalance,
      double? totalOutstanding,
      double? totalOverdue,
      int? outstandingDuesCount,
      int? overdueDuesCount,
      bool? hasSufficientBalance,
      List<OutstandingDue>? outstandingDues,
      Wallet? wallet,
      List<dynamic>? virtualAccounts,
      List<RecentTransaction>? recentTransactions});

  @override
  $WalletCopyWith<$Res>? get wallet;
}

/// @nodoc
class __$$PaymentDashboardDataImplCopyWithImpl<$Res>
    extends _$PaymentDashboardDataCopyWithImpl<$Res, _$PaymentDashboardDataImpl>
    implements _$$PaymentDashboardDataImplCopyWith<$Res> {
  __$$PaymentDashboardDataImplCopyWithImpl(_$PaymentDashboardDataImpl _value,
      $Res Function(_$PaymentDashboardDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentDashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? walletBalance = freezed,
    Object? totalOutstanding = freezed,
    Object? totalOverdue = freezed,
    Object? outstandingDuesCount = freezed,
    Object? overdueDuesCount = freezed,
    Object? hasSufficientBalance = freezed,
    Object? outstandingDues = freezed,
    Object? wallet = freezed,
    Object? virtualAccounts = freezed,
    Object? recentTransactions = freezed,
  }) {
    return _then(_$PaymentDashboardDataImpl(
      walletBalance: freezed == walletBalance
          ? _value.walletBalance
          : walletBalance // ignore: cast_nullable_to_non_nullable
              as String?,
      totalOutstanding: freezed == totalOutstanding
          ? _value.totalOutstanding
          : totalOutstanding // ignore: cast_nullable_to_non_nullable
              as double?,
      totalOverdue: freezed == totalOverdue
          ? _value.totalOverdue
          : totalOverdue // ignore: cast_nullable_to_non_nullable
              as double?,
      outstandingDuesCount: freezed == outstandingDuesCount
          ? _value.outstandingDuesCount
          : outstandingDuesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      overdueDuesCount: freezed == overdueDuesCount
          ? _value.overdueDuesCount
          : overdueDuesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      hasSufficientBalance: freezed == hasSufficientBalance
          ? _value.hasSufficientBalance
          : hasSufficientBalance // ignore: cast_nullable_to_non_nullable
              as bool?,
      outstandingDues: freezed == outstandingDues
          ? _value._outstandingDues
          : outstandingDues // ignore: cast_nullable_to_non_nullable
              as List<OutstandingDue>?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as Wallet?,
      virtualAccounts: freezed == virtualAccounts
          ? _value._virtualAccounts
          : virtualAccounts // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      recentTransactions: freezed == recentTransactions
          ? _value._recentTransactions
          : recentTransactions // ignore: cast_nullable_to_non_nullable
              as List<RecentTransaction>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PaymentDashboardDataImpl implements _PaymentDashboardData {
  const _$PaymentDashboardDataImpl(
      {this.walletBalance,
      this.totalOutstanding,
      this.totalOverdue,
      this.outstandingDuesCount,
      this.overdueDuesCount,
      this.hasSufficientBalance,
      final List<OutstandingDue>? outstandingDues,
      this.wallet,
      final List<dynamic>? virtualAccounts,
      final List<RecentTransaction>? recentTransactions})
      : _outstandingDues = outstandingDues,
        _virtualAccounts = virtualAccounts,
        _recentTransactions = recentTransactions;

  factory _$PaymentDashboardDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentDashboardDataImplFromJson(json);

  @override
  final String? walletBalance;
  @override
  final double? totalOutstanding;
  @override
  final double? totalOverdue;
  @override
  final int? outstandingDuesCount;
  @override
  final int? overdueDuesCount;
  @override
  final bool? hasSufficientBalance;
  final List<OutstandingDue>? _outstandingDues;
  @override
  List<OutstandingDue>? get outstandingDues {
    final value = _outstandingDues;
    if (value == null) return null;
    if (_outstandingDues is EqualUnmodifiableListView) return _outstandingDues;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Wallet? wallet;
  final List<dynamic>? _virtualAccounts;
  @override
  List<dynamic>? get virtualAccounts {
    final value = _virtualAccounts;
    if (value == null) return null;
    if (_virtualAccounts is EqualUnmodifiableListView) return _virtualAccounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<RecentTransaction>? _recentTransactions;
  @override
  List<RecentTransaction>? get recentTransactions {
    final value = _recentTransactions;
    if (value == null) return null;
    if (_recentTransactions is EqualUnmodifiableListView)
      return _recentTransactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PaymentDashboardData(walletBalance: $walletBalance, totalOutstanding: $totalOutstanding, totalOverdue: $totalOverdue, outstandingDuesCount: $outstandingDuesCount, overdueDuesCount: $overdueDuesCount, hasSufficientBalance: $hasSufficientBalance, outstandingDues: $outstandingDues, wallet: $wallet, virtualAccounts: $virtualAccounts, recentTransactions: $recentTransactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentDashboardDataImpl &&
            (identical(other.walletBalance, walletBalance) ||
                other.walletBalance == walletBalance) &&
            (identical(other.totalOutstanding, totalOutstanding) ||
                other.totalOutstanding == totalOutstanding) &&
            (identical(other.totalOverdue, totalOverdue) ||
                other.totalOverdue == totalOverdue) &&
            (identical(other.outstandingDuesCount, outstandingDuesCount) ||
                other.outstandingDuesCount == outstandingDuesCount) &&
            (identical(other.overdueDuesCount, overdueDuesCount) ||
                other.overdueDuesCount == overdueDuesCount) &&
            (identical(other.hasSufficientBalance, hasSufficientBalance) ||
                other.hasSufficientBalance == hasSufficientBalance) &&
            const DeepCollectionEquality()
                .equals(other._outstandingDues, _outstandingDues) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            const DeepCollectionEquality()
                .equals(other._virtualAccounts, _virtualAccounts) &&
            const DeepCollectionEquality()
                .equals(other._recentTransactions, _recentTransactions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      walletBalance,
      totalOutstanding,
      totalOverdue,
      outstandingDuesCount,
      overdueDuesCount,
      hasSufficientBalance,
      const DeepCollectionEquality().hash(_outstandingDues),
      wallet,
      const DeepCollectionEquality().hash(_virtualAccounts),
      const DeepCollectionEquality().hash(_recentTransactions));

  /// Create a copy of PaymentDashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentDashboardDataImplCopyWith<_$PaymentDashboardDataImpl>
      get copyWith =>
          __$$PaymentDashboardDataImplCopyWithImpl<_$PaymentDashboardDataImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentDashboardDataImplToJson(
      this,
    );
  }
}

abstract class _PaymentDashboardData implements PaymentDashboardData {
  const factory _PaymentDashboardData(
          {final String? walletBalance,
          final double? totalOutstanding,
          final double? totalOverdue,
          final int? outstandingDuesCount,
          final int? overdueDuesCount,
          final bool? hasSufficientBalance,
          final List<OutstandingDue>? outstandingDues,
          final Wallet? wallet,
          final List<dynamic>? virtualAccounts,
          final List<RecentTransaction>? recentTransactions}) =
      _$PaymentDashboardDataImpl;

  factory _PaymentDashboardData.fromJson(Map<String, dynamic> json) =
      _$PaymentDashboardDataImpl.fromJson;

  @override
  String? get walletBalance;
  @override
  double? get totalOutstanding;
  @override
  double? get totalOverdue;
  @override
  int? get outstandingDuesCount;
  @override
  int? get overdueDuesCount;
  @override
  bool? get hasSufficientBalance;
  @override
  List<OutstandingDue>? get outstandingDues;
  @override
  Wallet? get wallet;
  @override
  List<dynamic>? get virtualAccounts;
  @override
  List<RecentTransaction>? get recentTransactions;

  /// Create a copy of PaymentDashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentDashboardDataImplCopyWith<_$PaymentDashboardDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
