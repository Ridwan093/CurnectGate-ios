// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PositionDataImpl _$$PositionDataImplFromJson(Map<String, dynamic> json) =>
    _$PositionDataImpl(
      positionId: (json['positionId'] as num?)?.toInt(),
      positionTitle: json['positionTitle'] as String?,
      description: json['description'] as String?,
      color: json['color'] as String?,
      positionOrder: (json['positionOrder'] as num?)?.toInt(),
      minSelections: (json['minSelections'] as num?)?.toInt(),
      maxSelections: (json['maxSelections'] as num?)?.toInt(),
      totalVotesCast: (json['totalVotesCast'] as num?)?.toInt(),
      candidatesCount: (json['candidatesCount'] as num?)?.toInt(),
      candidates: (json['candidates'] as List<dynamic>?)
          ?.map((e) => CandidateData.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentLeaders: (json['currentLeaders'] as List<dynamic>?)
          ?.map((e) => CandidateData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PositionDataImplToJson(_$PositionDataImpl instance) =>
    <String, dynamic>{
      'positionId': instance.positionId,
      'positionTitle': instance.positionTitle,
      'description': instance.description,
      'color': instance.color,
      'positionOrder': instance.positionOrder,
      'minSelections': instance.minSelections,
      'maxSelections': instance.maxSelections,
      'totalVotesCast': instance.totalVotesCast,
      'candidatesCount': instance.candidatesCount,
      'candidates': instance.candidates,
      'currentLeaders': instance.currentLeaders,
    };
