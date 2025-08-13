// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evidence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EvidenceImpl _$$EvidenceImplFromJson(Map<String, dynamic> json) =>
    _$EvidenceImpl(
      mediaUrls: (json['media_urls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      mediaCount: (json['media_count'] as num?)?.toInt() ?? 0,
      hasEvidence: json['has_evidence'] as bool? ?? false,
    );

Map<String, dynamic> _$$EvidenceImplToJson(_$EvidenceImpl instance) =>
    <String, dynamic>{
      'media_urls': instance.mediaUrls,
      'media_count': instance.mediaCount,
      'has_evidence': instance.hasEvidence,
    };
