import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'active_otp_item.dart';

part 'active_otp_data.freezed.dart';
part 'active_otp_data.g.dart';

@freezed
class ActiveOtpData with _$ActiveOtpData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ActiveOtpData({
    List<ActiveOtpItem>? otps,
    int? count,
  }) = _ActiveOtpData;

  factory ActiveOtpData.fromJson(Map<String, dynamic> json) =>
      _$ActiveOtpDataFromJson(json);

  factory ActiveOtpData.fromSafeJson(Map<String, dynamic>? json) {
    if (json == null) return ActiveOtpData.empty();

    return ActiveOtpData(
      otps: NullSafetyHelper.safeList(json['otps'])
          .map((e) => NullSafetyHelper.safeModel(
                e,
                ActiveOtpItem.fromSafeJson,
                ActiveOtpItem.empty(),
              ))
          .whereType<ActiveOtpItem>()
          .toList(),
      count: NullSafetyHelper.safeInt(json['count']),
    );
  }

  factory ActiveOtpData.empty() => const ActiveOtpData(
        otps: null,
        count: null,
      );
}
