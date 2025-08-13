import 'package:freezed_annotation/freezed_annotation.dart';

import 'nullSafty_model.dart';

part 'active_otp_model.freezed.dart';
part 'active_otp_model.g.dart';

@freezed
class ActiveOtpModel with _$ActiveOtpModel {
  const factory ActiveOtpModel({
    @Default('') String visitorName,
    @Default('') String visitType,
    @JsonKey(name: 'endDay', fromJson: NullSafetyHelper.safeDateTime)
    required DateTime endDay,
    @JsonKey(name: 'endtime', fromJson: NullSafetyHelper.safeDateTime)
    required DateTime endTime,
  }) = _ActiveOtpModel;

  factory ActiveOtpModel.fromJson(Map<String, dynamic> json) =>
      _$ActiveOtpModelFromJson(json);

  // Optional: safe factory for null safety on input JSON
  static ActiveOtpModel fromSafeJson(Map<String, dynamic> json) {
    return ActiveOtpModel.fromJson({
      ...json,
      'endDay': NullSafetyHelper.safeDateTime(json['endDay']).toIso8601String(),
      'endtime': NullSafetyHelper.safeDateTime(json['endtime']).toIso8601String(),
    });
  }
}
