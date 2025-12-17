// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatisticsImpl _$$StatisticsImplFromJson(Map<String, dynamic> json) =>
    _$StatisticsImpl(
      totalVoters: (json['totalVoters'] as num?)?.toInt(),
      totalVoted: (json['totalVoted'] as num?)?.toInt(),
      turnoutPercentage: json['turnoutPercentage'] as num?,
      timeRemainingHours: (json['timeRemainingHours'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StatisticsImplToJson(_$StatisticsImpl instance) =>
    <String, dynamic>{
      'totalVoters': instance.totalVoters,
      'totalVoted': instance.totalVoted,
      'turnoutPercentage': instance.turnoutPercentage,
      'timeRemainingHours': instance.timeRemainingHours,
    };
