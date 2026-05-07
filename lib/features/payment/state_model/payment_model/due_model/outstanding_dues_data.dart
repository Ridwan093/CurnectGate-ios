import 'dart:developer';

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
    String? minimumPayableAmount,
  }) = _OutstandingDuesData;

  factory OutstandingDuesData.fromJson(Map<String, dynamic> json) =>
      _$OutstandingDuesDataFromJson(json);

  factory OutstandingDuesData.safeFromJson(Map<String, dynamic>? json) {
    if (json != null) {
      log("DEBUG: OutstandingDuesData JSON keys: ${json.keys.toList()}");
      log(
        "DEBUG: OutstandingDuesData JSON values: ${json['minimum_payable_amount']}, ${json['min_payable_amount']}, ${json['summary']?['minimum_payable_amount']}",
      );
    }
    return OutstandingDuesData(
      dues:
          (NullSafetyHelper.safeList(
            json?['dues'],
          )).map((e) => OutstandingDue.safeFromJson(e)).toList(),
      summary: Summary.safeFromJson(NullSafetyHelper.safeMap(json?['summary'])),
      minimumPayableAmount: NullSafetyHelper.safeString(
        json?['minimum_payable_amount'] ??
            json?['min_payable_amount'] ??
            json?['summary']?['minimum_payable_amount'],
      ),
    );
  }

  factory OutstandingDuesData.empty() => OutstandingDuesData(
    dues: [],
    summary: Summary.empty(),
    minimumPayableAmount: '0.00',
  );
}
