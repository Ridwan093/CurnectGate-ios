// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DirectorySummaryImpl _$$DirectorySummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$DirectorySummaryImpl(
      totalResidents: (json['total_residents'] as num?)?.toInt(),
      directoryVisibleResidents:
          (json['directory_visible_residents'] as num?)?.toInt(),
      committeeMembers: (json['committee_members'] as num?)?.toInt(),
      boardMembers: (json['board_members'] as num?)?.toInt(),
      activeCommittees: (json['active_committees'] as num?)?.toInt(),
      activeBoardPositions: (json['active_board_positions'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DirectorySummaryImplToJson(
        _$DirectorySummaryImpl instance) =>
    <String, dynamic>{
      'total_residents': instance.totalResidents,
      'directory_visible_residents': instance.directoryVisibleResidents,
      'committee_members': instance.committeeMembers,
      'board_members': instance.boardMembers,
      'active_committees': instance.activeCommittees,
      'active_board_positions': instance.activeBoardPositions,
    };
