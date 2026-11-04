// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CandidateDetailsImpl _$$CandidateDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$CandidateDetailsImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      partyAffiliation: json['party_affiliation'] as String?,
      mediaUrl: json['media_url'] as String?,
      candidateOrder: (json['candidate_order'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CandidateDetailsImplToJson(
        _$CandidateDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bio': instance.bio,
      'party_affiliation': instance.partyAffiliation,
      'media_url': instance.mediaUrl,
      'candidate_order': instance.candidateOrder,
    };
