// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_results_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveResultsDataImpl _$$LiveResultsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$LiveResultsDataImpl(
      poll: json['poll'] == null
          ? null
          : PollData.fromJson(json['poll'] as Map<String, dynamic>),
      statistics: json['statistics'] == null
          ? null
          : LiveStatistics.fromJson(json['statistics'] as Map<String, dynamic>),
      positions: (json['positions'] as List<dynamic>?)
          ?.map((e) => PositionData.fromJson(e as Map<String, dynamic>))
          .toList(),
      userStatus: json['userStatus'] == null
          ? null
          : UserStatus.fromJson(json['userStatus'] as Map<String, dynamic>),
      lastUpdated: json['lastUpdated'] as String?,
    );

Map<String, dynamic> _$$LiveResultsDataImplToJson(
        _$LiveResultsDataImpl instance) =>
    <String, dynamic>{
      'poll': instance.poll,
      'statistics': instance.statistics,
      'positions': instance.positions,
      'userStatus': instance.userStatus,
      'lastUpdated': instance.lastUpdated,
    };
