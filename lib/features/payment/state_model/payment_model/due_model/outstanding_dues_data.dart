import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'outstanding_due.dart';
import 'summary.dart';

part 'outstanding_dues_data.freezed.dart';
part 'outstanding_dues_data.g.dart';

@freezed
class OutstandingDuesData with _$OutstandingDuesData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory OutstandingDuesData({
    List<OutstandingDue>? dues,
    Summary? summary,
  }) = _OutstandingDuesData;

  factory OutstandingDuesData.fromJson(Map<String, dynamic> json) =>
      _$OutstandingDuesDataFromJson(json);

  factory OutstandingDuesData.safeFromJson(Map<String, dynamic>? json) {
    return OutstandingDuesData(
      dues:
          (NullSafetyHelper.safeList(
            json?['dues'],
          )).map((e) => OutstandingDue.safeFromJson(e)).toList(),
      summary: Summary.safeFromJson(NullSafetyHelper.safeMap(json?['summary'])),
    );
  }

  factory OutstandingDuesData.empty() =>
      OutstandingDuesData(dues: [], summary: Summary.empty());
}
