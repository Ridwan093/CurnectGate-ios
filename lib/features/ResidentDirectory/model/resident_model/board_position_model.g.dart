// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_position_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoardPositionImpl _$$BoardPositionImplFromJson(Map<String, dynamic> json) =>
    _$BoardPositionImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      termStartDate: json['term_start_date'] == null
          ? null
          : DateTime.parse(json['term_start_date'] as String),
      termEndDate: json['term_end_date'] == null
          ? null
          : DateTime.parse(json['term_end_date'] as String),
      termNumber: (json['term_number'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$BoardPositionImplToJson(_$BoardPositionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'term_start_date': instance.termStartDate?.toIso8601String(),
      'term_end_date': instance.termEndDate?.toIso8601String(),
      'term_number': instance.termNumber,
    };
