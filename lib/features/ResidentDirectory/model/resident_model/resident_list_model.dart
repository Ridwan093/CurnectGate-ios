// resident_list_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'resident_model.dart';
import 'page_link_model.dart';


part 'resident_list_model.freezed.dart';
part 'resident_list_model.g.dart';
// resident_list_model.dart

@freezed
class ResidentList with _$ResidentList {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ResidentList({
    @Default(1) int currentPage,
    @Default([]) List<Resident> data,
    @Default('') String firstPageUrl,
    @Default(1) int from,
    @Default(1) int lastPage,
    @Default('') String lastPageUrl,
    @Default([]) List<PageLink> links,
    String? nextPageUrl,
    @Default('') String path,
    @Default(20) int perPage,
    String? prevPageUrl,
    @Default(0) int to,
    @Default(0) int total,
  }) = _ResidentList;

  factory ResidentList.fromJson(Map<String, dynamic> json) =>
      _$ResidentListFromJson(json);

  factory ResidentList.fromSafeJson(Map<String, dynamic> json) {
    return ResidentList(
      currentPage: NullSafetyHelper.safeInt(json['current_page']),
      data: _residentsFromJson(json['data']),
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

  static List<Resident> _residentsFromJson(dynamic value) {
    if (value == null) return [];
    if (value is! List) return [];

    return value
        .map((item) => NullSafetyHelper.safeModel(
              item,
              Resident.fromSafeJson,
              Resident.empty(),
            ))
        .whereType<Resident>()
        .toList();
  }

  static List<PageLink> _pageLinksFromJson(dynamic value) {
    if (value == null) return [];
    if (value is! List) return [];

    return value
        .map((item) => NullSafetyHelper.safeModel(
              item,
              PageLink.fromSafeJson,
              PageLink.empty(),
            ))
        .whereType<PageLink>()
        .toList();
  }

  factory ResidentList.empty() => const ResidentList(
        currentPage: 1,
        data: [],
        firstPageUrl: '',
        from: 1,
        lastPage: 1,
        lastPageUrl: '',
        links: [],
        nextPageUrl: null,
        path: '',
        perPage: 20,
        prevPageUrl: null,
        to: 0,
        total: 0,
      );
}