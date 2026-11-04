// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_history_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PollHistoryDataImpl _$$PollHistoryDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PollHistoryDataImpl(
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => HistoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPollsVoted: (json['total_polls_voted'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PollHistoryDataImplToJson(
        _$PollHistoryDataImpl instance) =>
    <String, dynamic>{
      'history': instance.history?.map((e) => e.toJson()).toList(),
      'total_polls_voted': instance.totalPollsVoted,
    };
