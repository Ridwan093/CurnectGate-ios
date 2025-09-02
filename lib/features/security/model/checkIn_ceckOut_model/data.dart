import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'visitor_model.dart';

part 'data.freezed.dart';

part 'data.g.dart';
@freezed
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class DataPayload with _$DataPayload {
  const factory DataPayload({
    List<VisitorModel>? visitors,
    int? count,
    int? estateId,
    bool? showingMyVisitorsOnly,
  }) = _DataPayload;

  factory DataPayload.fromJson(Map<String, dynamic> json) =>
      _$DataPayloadFromJson(json);

  factory DataPayload.fromSafeJson(Map<String, dynamic> json) {
    return DataPayload(
      visitors: _visitorsFromJson(json['visitors']),  // Use the helper method
      count: NullSafetyHelper.safeInt(json['count']),
      estateId: NullSafetyHelper.safeInt(json['estate_id']),
      showingMyVisitorsOnly: NullSafetyHelper.safeBool(
        json['showing_my_visitors_only'],
      ),
    );
  }

  // Helper method to safely convert a list to List<VisitorModel>
  static List<VisitorModel>? _visitorsFromJson(dynamic value) {
    if (value == null) return null;
    if (value is! List) return <VisitorModel>[];

    return value
        .map((item) => NullSafetyHelper.safeModel(
              item,
              VisitorModel.fromSafeJson,  // Use fromSafeJson for nested safety
              VisitorModel.empty(),
            ))
        .whereType<VisitorModel>()  // Filter out nulls
        .toList();
  }

  factory DataPayload.empty() => const DataPayload(
        visitors: null,
        count: null,
        estateId: null,
        showingMyVisitorsOnly: null,
      );
}