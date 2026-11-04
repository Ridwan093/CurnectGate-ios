// committee_list_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'committee_model.dart';
import 'page_link_model.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'committee_list_model.freezed.dart';
part 'committee_list_model.g.dart';

@freezed
class CommitteeList with _$CommitteeList {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CommitteeList({
    int? currentPage,
    List<Committee>? data,
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
  }) = _CommitteeList;

  factory CommitteeList.fromJson(Map<String, dynamic> json) =>
      _$CommitteeListFromJson(json);

  factory CommitteeList.fromSafeJson(Map<String, dynamic> json) {
    return CommitteeList(
      currentPage: NullSafetyHelper.safeInt(json['current_page']),
      data: _committeesFromJson(json['data']),
      firstPageUrl: NullSafetyHelper.safeString(json['first_page_url']),
      from: NullSafetyHelper.safeInt(json['from']),
      lastPage: NullSafetyHelper.safeInt(json['last_page']),
      lastPageUrl: NullSafetyHelper.safeString(json['last_page_url']),
      links: _pageLinksFromJson(json['links']),
      nextPageUrl: NullSafetyHelper.safeString(json['next_page_url']),
      path: NullSafetyHelper.safeString(json['path']),
      perPage: NullSafetyHelper.safeInt(json['per_page']),
      prevPageUrl: NullSafetyHelper.safeString(json['prev_page_url']),
      to: NullSafetyHelper.safeInt(json['to']),
      total: NullSafetyHelper.safeInt(json['total']),
    );
  }

  static List<Committee>? _committeesFromJson(dynamic value) {
    if (value == null) return null;
    if (value is! List) return null;

    return value
        .map((item) => NullSafetyHelper.safeModel(
              item,
              Committee.fromSafeJson,
              Committee.empty(),
            ))
        .whereType<Committee>()
        .toList();
  }

  static List<PageLink>? _pageLinksFromJson(dynamic value) {
    if (value == null) return null;
    if (value is! List) return null;

    return value
        .map((item) => NullSafetyHelper.safeModel(
              item,
              PageLink.fromSafeJson,
              PageLink.empty(),
            ))
        .whereType<PageLink>()
        .toList();
  }

  factory CommitteeList.empty() => const CommitteeList(
        currentPage: null,
        data: null,
        firstPageUrl: null,
        from: null,
        lastPage: null,
        lastPageUrl: null,
        links: null,
        nextPageUrl: null,
        path: null,
        perPage: null,
        prevPageUrl: null,
        to: null,
        total: null,
      );
}