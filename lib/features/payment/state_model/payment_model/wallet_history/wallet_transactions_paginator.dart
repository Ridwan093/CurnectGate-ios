import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'wallet_transaction_item.dart';
import 'page_link.dart';


part 'wallet_transactions_paginator.freezed.dart';
part 'wallet_transactions_paginator.g.dart';

@freezed
class WalletTransactionsPaginator with _$WalletTransactionsPaginator {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory WalletTransactionsPaginator({
    int? currentPage,
    List<WalletTransactionItem>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<PageLink>? links,
    String? nextPageUrl,
    String? path,
    int? perPage,
    String? prevPageUrl,
    int? to,
    int? total,
  }) = _WalletTransactionsPaginator;

  factory WalletTransactionsPaginator.fromJson(Map<String, dynamic> json) =>
      _$WalletTransactionsPaginatorFromJson(json);

  factory WalletTransactionsPaginator.safeFromJson(Map<String, dynamic>? json) {
    return WalletTransactionsPaginator(
      currentPage: NullSafetyHelper.safeInt(json?['current_page']),
      data: (NullSafetyHelper.safeList(json?['data']) ?? [])
          .map((e) => WalletTransactionItem.safeFromJson(NullSafetyHelper.safeMap(e)))
          .toList(),
      firstPageUrl: NullSafetyHelper.safeString(json?['first_page_url']),
      from: NullSafetyHelper.safeInt(json?['from']),
      lastPage: NullSafetyHelper.safeInt(json?['last_page']),
      lastPageUrl: NullSafetyHelper.safeString(json?['last_page_url']),
      links: (NullSafetyHelper.safeList(json?['links']) ?? [])
          .map((e) => PageLink.safeFromJson(NullSafetyHelper.safeMap(e)))
          .toList(),
      nextPageUrl: NullSafetyHelper.safeString(json?['next_page_url']),
      path: NullSafetyHelper.safeString(json?['path']),
      perPage: NullSafetyHelper.safeInt(json?['per_page']),
      prevPageUrl: NullSafetyHelper.safeString(json?['prev_page_url']),
      to: NullSafetyHelper.safeInt(json?['to']),
      total: NullSafetyHelper.safeInt(json?['total']),
    );
  }

  factory WalletTransactionsPaginator.empty() => const WalletTransactionsPaginator(
        currentPage: 0,
        data: [],
        firstPageUrl: '',
        from: 0,
        lastPage: 0,
        lastPageUrl: '',
        links: [],
        nextPageUrl: '',
        path: '',
        perPage: 0,
        prevPageUrl: '',
        to: 0,
        total: 0,
      );
}
