// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PositionItemImpl _$$PositionItemImplFromJson(Map<String, dynamic> json) =>
    _$PositionItemImpl(
      positionId: (json['position_id'] as num?)?.toInt(),
      positionTitle: json['position_title'] as String?,
      color: json['color'] as String?,
      candidates: (json['candidates'] as List<dynamic>?)
          ?.map((e) => CandidateItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PositionItemImplToJson(_$PositionItemImpl instance) =>
    <String, dynamic>{
      'position_id': instance.positionId,
      'position_title': instance.positionTitle,
      'color': instance.color,
      'candidates': instance.candidates?.map((e) => e.toJson()).toList(),
    };
