// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CandidateDataImpl _$$CandidateDataImplFromJson(Map<String, dynamic> json) =>
    _$CandidateDataImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      partyAffiliation: json['partyAffiliation'] as String?,
      mediaUrl: json['mediaUrl'] as String?,
      candidateOrder: (json['candidateOrder'] as num?)?.toInt(),
      voteCount: (json['voteCount'] as num?)?.toInt(),
      percentage: (json['percentage'] as num?)?.toDouble(),
      rank: (json['rank'] as num?)?.toInt(),
      isLeading: json['isLeading'] as bool?,
      isWinner: json['isWinner'] as bool?,
    );

Map<String, dynamic> _$$CandidateDataImplToJson(_$CandidateDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bio': instance.bio,
      'partyAffiliation': instance.partyAffiliation,
      'mediaUrl': instance.mediaUrl,
      'candidateOrder': instance.candidateOrder,
      'voteCount': instance.voteCount,
      'percentage': instance.percentage,
      'rank': instance.rank,
      'isLeading': instance.isLeading,
      'isWinner': instance.isWinner,
    };
