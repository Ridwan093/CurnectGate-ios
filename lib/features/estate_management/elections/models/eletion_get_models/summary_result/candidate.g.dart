// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CandidateImpl _$$CandidateImplFromJson(Map<String, dynamic> json) =>
    _$CandidateImpl(
      candidateId: (json['candidateId'] as num?)?.toInt(),
      candidateName: json['candidateName'] as String?,
      votes: (json['votes'] as num?)?.toInt(),
      percentage: json['percentage'] as num?,
      isWinner: json['isWinner'] as bool?,
    );

Map<String, dynamic> _$$CandidateImplToJson(_$CandidateImpl instance) =>
    <String, dynamic>{
      'candidateId': instance.candidateId,
      'candidateName': instance.candidateName,
      'votes': instance.votes,
      'percentage': instance.percentage,
      'isWinner': instance.isWinner,
    };
