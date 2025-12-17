import 'package:freezed_annotation/freezed_annotation.dart';

import 'candidate.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'position.freezed.dart';
part 'position.g.dart';

@freezed
class Position with _$Position {
  const factory Position({
    int? positionId,
    String? positionTitle,
    String? description,
    String? color,
    int? positionOrder,
    int? totalVotes,
    List<Candidate>? candidates,
    List<Candidate>? winners,
  }) = _Position;

  factory Position.fromJson(Map<String, dynamic> json) =>
      _$PositionFromJson(json);

  factory Position.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return const Position();
    return Position(
      positionId: NullSafetyHelper.safeInt(json['position_id']),
      positionTitle: NullSafetyHelper.safeString(json['position_title']),
      description: NullSafetyHelper.safeString(json['description']),
      color: NullSafetyHelper.safeString(json['color']),
      positionOrder: NullSafetyHelper.safeInt(json['position_order']),
      totalVotes: NullSafetyHelper.safeInt(json['total_votes']),
      candidates: NullSafetyHelper.safeList(json['candidates'])
          .map((e) => Candidate.safeFromJson(e))
          .toList(),
      winners: NullSafetyHelper.safeList(json['winners'])
          .map((e) => Candidate.safeFromJson(e))
          .toList(),
    );
  }
}
