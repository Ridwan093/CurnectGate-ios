// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryItemImpl _$$HistoryItemImplFromJson(Map<String, dynamic> json) =>
    _$HistoryItemImpl(
      pollId: (json['poll_id'] as num?)?.toInt(),
      pollTitle: json['poll_title'] as String?,
      pollType: json['poll_type'] as String?,
      pollStatus: json['poll_status'] as String?,
      votedAt: json['voted_at'] as String?,
      positionsVoted: (json['positions_voted'] as num?)?.toInt(),
      votes: (json['votes'] as List<dynamic>?)
          ?.map((e) => VoteItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HistoryItemImplToJson(_$HistoryItemImpl instance) =>
    <String, dynamic>{
      'poll_id': instance.pollId,
      'poll_title': instance.pollTitle,
      'poll_type': instance.pollType,
      'poll_status': instance.pollStatus,
      'voted_at': instance.votedAt,
      'positions_voted': instance.positionsVoted,
      'votes': instance.votes?.map((e) => e.toJson()).toList(),
    };
