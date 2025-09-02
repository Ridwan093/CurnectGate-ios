// directory_summary_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'directory_summary_model.freezed.dart';
part 'directory_summary_model.g.dart';

@freezed
class DirectorySummary with _$DirectorySummary {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory DirectorySummary({
     int? totalResidents,
     int? directoryVisibleResidents,
     int? committeeMembers,
     int? boardMembers,
     int? activeCommittees,
     int? activeBoardPositions,
  }) = _DirectorySummary;

  factory DirectorySummary.fromJson(Map<String, dynamic> json) =>
      _$DirectorySummaryFromJson(json);

  factory DirectorySummary.fromSafeJson(Map<String, dynamic> json) {
    return DirectorySummary(
      totalResidents: NullSafetyHelper.safeInt(json['total_residents']),
      directoryVisibleResidents:
          NullSafetyHelper.safeInt(json['directory_visible_residents']),
      committeeMembers: NullSafetyHelper.safeInt(json['committee_members']),
      boardMembers: NullSafetyHelper.safeInt(json['board_members']),
      activeCommittees: NullSafetyHelper.safeInt(json['active_committees']),
      activeBoardPositions:
          NullSafetyHelper.safeInt(json['active_board_positions']),
    );
  }

  factory DirectorySummary.empty() => const DirectorySummary(
        totalResidents: 0,
        directoryVisibleResidents: 0,
        committeeMembers: 0,
        boardMembers: 0,
        activeCommittees: 0,
        activeBoardPositions: 0,
      );
}