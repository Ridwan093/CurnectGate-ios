import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'candidate_data.dart';

part 'position_data.freezed.dart';
part 'position_data.g.dart';

@freezed
class PositionData with _$PositionData {
  const factory PositionData({
    int? positionId,
    String? positionTitle,
    String? description,
    String? color,
    int? positionOrder,
    int? minSelections,
    int? maxSelections,
    int? totalVotesCast,
    int? candidatesCount,
    List<CandidateData>? candidates,
    List<CandidateData>? currentLeaders,
  }) = _PositionData;

  factory PositionData.fromJson(Map<String, dynamic> json) =>
      _$PositionDataFromJson(json);

  factory PositionData.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const PositionData();
    return PositionData(
      positionId: NullSafetyHelper.safeInt(json['position_id']),
      positionTitle: NullSafetyHelper.safeString(json['position_title']),
      description: NullSafetyHelper.safeString(json['description']),
      color: NullSafetyHelper.safeString(json['color']),
      positionOrder: NullSafetyHelper.safeInt(json['position_order']),
      minSelections: NullSafetyHelper.safeInt(json['min_selections']),
      maxSelections: NullSafetyHelper.safeInt(json['max_selections']),
      totalVotesCast: NullSafetyHelper.safeInt(json['total_votes_cast']),
      candidatesCount: NullSafetyHelper.safeInt(json['candidates_count']),

      candidates:
          (NullSafetyHelper.safeList(json['candidates']))
              .map((e) => CandidateData.safeFromJson(e))
              .toList(),

      currentLeaders:
          (NullSafetyHelper.safeList(json['current_leaders']))
              .map((e) => CandidateData.safeFromJson(e))
              .toList(),
    );
  }
}
