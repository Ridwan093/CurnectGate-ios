// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polls_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PollsSummaryImpl _$$PollsSummaryImplFromJson(Map<String, dynamic> json) =>
    _$PollsSummaryImpl(
      activePolls: (json['active_polls'] as num?)?.toInt(),
      pollsVoted: (json['polls_voted'] as num?)?.toInt(),
      pendingPolls: (json['pending_polls'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PollsSummaryImplToJson(_$PollsSummaryImpl instance) =>
    <String, dynamic>{
      'active_polls': instance.activePolls,
      'polls_voted': instance.pollsVoted,
      'pending_polls': instance.pendingPolls,
    };
