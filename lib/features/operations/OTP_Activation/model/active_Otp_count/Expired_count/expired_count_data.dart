import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expired_count_data.freezed.dart';
part 'expired_count_data.g.dart';

@freezed
class ExpiredCountData with _$ExpiredCountData {
  const factory ExpiredCountData({int? count, int? userId}) = _ExpiredCountData;

  factory ExpiredCountData.fromJson(Map<String, dynamic> json) =>
      _$ExpiredCountDataFromJson(json);

  factory ExpiredCountData.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const ExpiredCountData();
    return ExpiredCountData(
      count: NullSafetyHelper.safeInt(json['count']),
      userId: NullSafetyHelper.safeInt(json['user_id']),
    );
  }
}


