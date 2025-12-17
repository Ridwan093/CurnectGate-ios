import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'transaction_item.dart';
import 'page_link.dart';


part 'transactions_paginator.freezed.dart';
part 'transactions_paginator.g.dart';

@freezed
class TransactionsPaginator with _$TransactionsPaginator {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory TransactionsPaginator({
    int? currentPage,
    List<TransactionItem>? data,
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
  }) = _TransactionsPaginator;

  factory TransactionsPaginator.fromJson(Map<String, dynamic> json) =>
      _$TransactionsPaginatorFromJson(json);

  factory TransactionsPaginator.safeFromJson(Map<String, dynamic>? json) {
    return TransactionsPaginator(
      currentPage: NullSafetyHelper.safeInt(json?['current_page']),
      data: (NullSafetyHelper.safeList(json?['data']) ?? [])
          .map((e) => TransactionItem.safeFromJson(NullSafetyHelper.safeMap(e)))
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

  factory TransactionsPaginator.empty() => const TransactionsPaginator(
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
