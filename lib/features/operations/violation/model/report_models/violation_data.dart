import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'package:curnectgate/features/operations/violation/model/report_models/violation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';



part 'violation_data.freezed.dart';
part 'violation_data.g.dart';

@freezed
class ViolationData with _$ViolationData {
  const factory ViolationData({
    required List<Violation> violations,
  }) = _ViolationData;

  factory ViolationData.fromJson(Map<String, dynamic> json) => _$ViolationDataFromJson(json);

  factory ViolationData.safeFromJson(Map<String, dynamic>? json) => ViolationData(
  violations: NullSafetyHelper.safeList(json?['violations'])
    .map((e) => Violation.fromJson(e))
    .toList(),

  );
}
