import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'poll_data.dart';
import 'live_statistics.dart';
import 'position_data.dart';
import 'user_status.dart';

part 'live_results_data.freezed.dart';
part 'live_results_data.g.dart';

@freezed
class LiveResultsData with _$LiveResultsData {
  const factory LiveResultsData({
    PollData? poll,
    LiveStatistics? statistics,
    List<PositionData>? positions,
    UserStatus? userStatus,
    String? lastUpdated,
  }) = _LiveResultsData;

  factory LiveResultsData.fromJson(Map<String, dynamic> json) =>
      _$LiveResultsDataFromJson(json);

  factory LiveResultsData.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const LiveResultsData();
    return LiveResultsData(
      poll: PollData.safeFromJson(json['poll']),
      statistics: LiveStatistics.safeFromJson(json['statistics']),
      positions: (NullSafetyHelper.safeList(json['positions']))
              .map((e) => PositionData.safeFromJson(e))
              .toList(),
      userStatus: UserStatus.safeFromJson(json['user_status']),
      lastUpdated: NullSafetyHelper.safeString(json['last_updated']),
    );
  }
}
