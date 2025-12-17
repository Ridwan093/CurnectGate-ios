import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'active_count_data.freezed.dart';
part 'active_count_data.g.dart';

@freezed
class ActiveCountData with _$ActiveCountData {
  const factory ActiveCountData({
    int? count,
    String? timestamp,
    int? userId,
  }) = _ActiveCountData;

  factory ActiveCountData.fromJson(Map<String, dynamic> json) =>
      _$ActiveCountDataFromJson(json);

  factory ActiveCountData.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const ActiveCountData();
    return ActiveCountData(
      count: NullSafetyHelper.safeInt(json['count']),
      timestamp: NullSafetyHelper.safeString(json['timestamp']),
      userId: NullSafetyHelper.safeInt(json['user_id']),
    );
  }
}
