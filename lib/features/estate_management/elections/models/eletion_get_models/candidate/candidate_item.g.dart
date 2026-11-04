// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidate_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CandidateItemImpl _$$CandidateItemImplFromJson(Map<String, dynamic> json) =>
    _$CandidateItemImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      partyAffiliation: json['party_affiliation'] as String?,
      mediaUrl: json['media_url'] as String?,
    );

Map<String, dynamic> _$$CandidateItemImplToJson(_$CandidateItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'bio': instance.bio,
      'party_affiliation': instance.partyAffiliation,
      'media_url': instance.mediaUrl,
    };
