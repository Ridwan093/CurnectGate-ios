// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'results_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResultsDataImpl _$$ResultsDataImplFromJson(Map<String, dynamic> json) =>
    _$ResultsDataImpl(
      poll: json['poll'] == null
          ? null
          : Poll.fromJson(json['poll'] as Map<String, dynamic>),
      statistics: json['statistics'] == null
          ? null
          : Statistics.fromJson(json['statistics'] as Map<String, dynamic>),
      positions: (json['positions'] as List<dynamic>?)
          ?.map((e) => Position.fromJson(e as Map<String, dynamic>))
          .toList(),
      userStatus: json['userStatus'] == null
          ? null
          : UserStatus.fromJson(json['userStatus'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResultsDataImplToJson(_$ResultsDataImpl instance) =>
    <String, dynamic>{
      'poll': instance.poll,
      'statistics': instance.statistics,
      'positions': instance.positions,
      'userStatus': instance.userStatus,
    };
