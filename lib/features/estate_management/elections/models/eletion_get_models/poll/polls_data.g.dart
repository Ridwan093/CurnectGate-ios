// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'polls_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PollsDataImpl _$$PollsDataImplFromJson(Map<String, dynamic> json) =>
    _$PollsDataImpl(
      polls: (json['polls'] as List<dynamic>?)
          ?.map((e) => PollItemSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: json['summary'] == null
          ? null
          : PollsSummary.fromJson(json['summary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PollsDataImplToJson(_$PollsDataImpl instance) =>
    <String, dynamic>{
      'polls': instance.polls?.map((e) => e.toJson()).toList(),
      'summary': instance.summary?.toJson(),
    };
