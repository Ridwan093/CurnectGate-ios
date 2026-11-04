import 'package:freezed_annotation/freezed_annotation.dart';

import 'models.dart.dart';
import 'nullSafty_model.dart';

part 'otp_data.freezed.dart';
part 'otp_data.g.dart';

@freezed
class OtpData with _$OtpData {
  const factory OtpData({
    @Default([]) List<Otp> otps,
    required Pagination pagination,
    required Summary summary,
    @Default({}) Map<String, dynamic> filtersApplied,
  }) = _OtpData;

  factory OtpData.fromJson(Map<String, dynamic> json) =>
      _$OtpDataFromJson(json);

  static OtpData empty() => OtpData(
        otps: [],
        pagination: Pagination.empty(),
        summary: Summary.empty(),
        filtersApplied: {},
      );

  static OtpData fromSafeJson(Map<String, dynamic> json) {
    final safeOtps = NullSafetyHelper.safeList<Map<String, dynamic>>(json['otps'])
        .map((e) => Otp.fromJson(e))
        .toList();

    final safePagination = NullSafetyHelper.safeModel<Pagination>(
      json['pagination'],
      Pagination.fromJson,
      Pagination.empty(),
    );

    final safeSummary = NullSafetyHelper.safeModel<Summary>(
      json['summary'],
      Summary.fromJson,
      Summary.empty(),
    );

    return OtpData.fromJson({
      ...json,
      'otps': safeOtps.map((e) => e.toJson()).toList(),
      'pagination': safePagination?.toJson(),
      'summary': safeSummary?.toJson(),
    });
  }
}
