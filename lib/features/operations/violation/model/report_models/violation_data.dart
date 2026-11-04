import 'package:curnectgate/features/operations/violation/model/report_models/violation.dart';
import 'package:curnectgate/features/operations/violation/model/report_models/violation_filters.dart';
import 'package:curnectgate/features/operations/violation/model/report_models/violation_pagination.dart';
import 'package:curnectgate/features/operations/violation/model/report_models/violation_summary.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'violation_data.freezed.dart';
part 'violation_data.g.dart';

@freezed
class ViolationData with _$ViolationData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ViolationData({
    @Default([]) List<Violation> violations,
    ViolationPagination? pagination,
    ViolationSummary? summary,
    ViolationFilters? filters,
  }) = _ViolationData;

  factory ViolationData.fromJson(Map<String, dynamic> json) =>
      _$ViolationDataFromJson(json);

  factory ViolationData.safeFromJson(Map<String, dynamic>? json) {
    return ViolationData(
      violations: (json?['violations'] as List? ?? [])
          .whereType<Map<String, dynamic>>()
          .map((e) => Violation.safeFromJson(e))
          .toList(),
      pagination: json?['pagination'] != null ? ViolationPagination.safeFromJson(json?['pagination']) : null,
      summary: json?['summary'] != null ? ViolationSummary.safeFromJson(json?['summary']) : null,
      filters: json?['filters'] != null ? ViolationFilters.safeFromJson(json?['filters']) : null,
    );
  }

  factory ViolationData.empty() => const ViolationData(
        violations: [],
      );
}
