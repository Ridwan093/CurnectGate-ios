import 'package:freezed_annotation/freezed_annotation.dart';

import 'poll.dart';
import 'statistics.dart';
import 'position.dart';
import 'user_status.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'results_data.freezed.dart';
part 'results_data.g.dart';

@freezed
class ResultsData with _$ResultsData {
  const factory ResultsData({
    Poll? poll,
    Statistics? statistics,
    List<Position>? positions,
    UserStatus? userStatus,
  }) = _ResultsData;

  factory ResultsData.fromJson(Map<String, dynamic> json) =>
      _$ResultsDataFromJson(json);

  factory ResultsData.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const ResultsData();
    return ResultsData(
      poll: Poll.safeFromJson(json['poll']),
      statistics: Statistics.safeFromJson(json['statistics']),
      positions: NullSafetyHelper.safeList(json['positions'])
          .map((e) => Position.safeFromJson(e))
          .toList(),
      userStatus: UserStatus.safeFromJson(json['user_status']),
    );
  }
}
