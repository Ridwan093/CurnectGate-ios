// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidates_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CandidatesDataImpl _$$CandidatesDataImplFromJson(Map<String, dynamic> json) =>
    _$CandidatesDataImpl(
      poll: json['poll'] == null
          ? null
          : PollInfo.fromJson(json['poll'] as Map<String, dynamic>),
      positions: (json['positions'] as List<dynamic>?)
          ?.map((e) => PositionItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CandidatesDataImplToJson(
        _$CandidatesDataImpl instance) =>
    <String, dynamic>{
      'poll': instance.poll?.toJson(),
      'positions': instance.positions?.map((e) => e.toJson()).toList(),
    };
