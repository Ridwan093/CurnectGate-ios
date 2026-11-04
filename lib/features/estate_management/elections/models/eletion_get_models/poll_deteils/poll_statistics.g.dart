// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PollStatisticsImpl _$$PollStatisticsImplFromJson(Map<String, dynamic> json) =>
    _$PollStatisticsImpl(
      totalVoters: (json['total_voters'] as num?)?.toInt(),
      totalVoted: (json['total_voted'] as num?)?.toInt(),
      turnoutPercentage: (json['turnout_percentage'] as num?)?.toDouble(),
      timeRemainingHours: (json['time_remaining_hours'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PollStatisticsImplToJson(
        _$PollStatisticsImpl instance) =>
    <String, dynamic>{
      'total_voters': instance.totalVoters,
      'total_voted': instance.totalVoted,
      'turnout_percentage': instance.turnoutPercentage,
      'time_remaining_hours': instance.timeRemainingHours,
    };
