// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PositionImpl _$$PositionImplFromJson(Map<String, dynamic> json) =>
    _$PositionImpl(
      positionId: (json['positionId'] as num?)?.toInt(),
      positionTitle: json['positionTitle'] as String?,
      description: json['description'] as String?,
      color: json['color'] as String?,
      positionOrder: (json['positionOrder'] as num?)?.toInt(),
      totalVotes: (json['totalVotes'] as num?)?.toInt(),
      candidates: (json['candidates'] as List<dynamic>?)
          ?.map((e) => Candidate.fromJson(e as Map<String, dynamic>))
          .toList(),
      winners: (json['winners'] as List<dynamic>?)
          ?.map((e) => Candidate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PositionImplToJson(_$PositionImpl instance) =>
    <String, dynamic>{
      'positionId': instance.positionId,
      'positionTitle': instance.positionTitle,
      'description': instance.description,
      'color': instance.color,
      'positionOrder': instance.positionOrder,
      'totalVotes': instance.totalVotes,
      'candidates': instance.candidates,
      'winners': instance.winners,
    };
