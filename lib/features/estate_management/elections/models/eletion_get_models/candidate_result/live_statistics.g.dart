// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveStatisticsImpl _$$LiveStatisticsImplFromJson(Map<String, dynamic> json) =>
    _$LiveStatisticsImpl(
      totalVoters: (json['totalVoters'] as num?)?.toInt(),
      totalVoted: (json['totalVoted'] as num?)?.toInt(),
      turnoutPercentage: (json['turnoutPercentage'] as num?)?.toDouble(),
      timeRemainingHours: (json['timeRemainingHours'] as num?)?.toInt(),
      isLive: json['isLive'] as bool?,
    );

Map<String, dynamic> _$$LiveStatisticsImplToJson(
        _$LiveStatisticsImpl instance) =>
    <String, dynamic>{
      'totalVoters': instance.totalVoters,
      'totalVoted': instance.totalVoted,
      'turnoutPercentage': instance.turnoutPercentage,
      'timeRemainingHours': instance.timeRemainingHours,
      'isLive': instance.isLive,
    };
