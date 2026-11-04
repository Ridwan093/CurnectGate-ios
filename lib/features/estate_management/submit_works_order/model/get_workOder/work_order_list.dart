import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'pagination_link.dart';
import 'work_order.dart';

part 'work_order_list.freezed.dart';
part 'work_order_list.g.dart';

@freezed
class WorkOrderList with _$WorkOrderList {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory WorkOrderList({
    required int currentPage,
    required List<WorkOrder> data,
    required String firstPageUrl,
    required int from,
    required int lastPage,
    required String lastPageUrl,
    required List<PaginationLink> links,
    required String? nextPageUrl,
    required String path,
    required int perPage,
    required String? prevPageUrl,
    required int to,
    required int total,
  }) = _WorkOrderList;

  factory WorkOrderList.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderListFromJson(json);

  factory WorkOrderList.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return WorkOrderList.empty();
    return WorkOrderList(
      currentPage: NullSafetyHelper.safeInt(json['current_page']),
      data: _safeWorkOrderList(json['data']),
      firstPageUrl: NullSafetyHelper.safeString(json['first_page_url']),
      from: NullSafetyHelper.safeInt(json['from']),
      lastPage: NullSafetyHelper.safeInt(json['last_page']),
      lastPageUrl: NullSafetyHelper.safeString(json['last_page_url']),
      links: _safePaginationLinkList(json['links']),
      nextPageUrl: NullSafetyHelper.safeString(json['next_page_url']),
      path: NullSafetyHelper.safeString(json['path']),
      perPage: NullSafetyHelper.safeInt(json['per_page']),
      prevPageUrl: NullSafetyHelper.safeString(json['prev_page_url']),
      to: NullSafetyHelper.safeInt(json['to']),
      total: NullSafetyHelper.safeInt(json['total']),
    );
  }

  static List<WorkOrder> _safeWorkOrderList(dynamic data) {
    if (data is List) {
      return data
          .whereType<Map<String, dynamic>>()
          .map((e) => WorkOrder.safeFromJson(e))
          .toList();
    }
    return [];
  }

  static List<PaginationLink> _safePaginationLinkList(dynamic links) {
    if (links is List) {
      return links
          .whereType<Map<String, dynamic>>()
          .map((e) => PaginationLink.safeFromJson(e))
          .toList();
    }
    return [];
  }

  factory WorkOrderList.empty() => const WorkOrderList(
    currentPage: 1,
    data: [],
    firstPageUrl: '',
    from: 0,
    lastPage: 1,
    lastPageUrl: '',
    links: [],
    nextPageUrl: null,
    path: '',
    perPage: 15,
    prevPageUrl: null,
    to: 0,
    total: 0,
  );
}
