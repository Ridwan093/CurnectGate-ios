// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserStatusImpl _$$UserStatusImplFromJson(Map<String, dynamic> json) =>
    _$UserStatusImpl(
      canVote: json['can_vote'] as bool?,
      hasVoted: json['has_voted'] as bool?,
      votingProgress: (json['voting_progress'] as num?)?.toInt(),
      positionsVoted: (json['positions_voted'] as num?)?.toInt(),
      totalPositions: (json['total_positions'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$UserStatusImplToJson(_$UserStatusImpl instance) =>
    <String, dynamic>{
      'can_vote': instance.canVote,
      'has_voted': instance.hasVoted,
      'voting_progress': instance.votingProgress,
      'positions_voted': instance.positionsVoted,
      'total_positions': instance.totalPositions,
    };
