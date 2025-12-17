// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_item_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PositionItemDetailsImpl _$$PositionItemDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$PositionItemDetailsImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      positionOrder: (json['position_order'] as num?)?.toInt(),
      minSelections: (json['min_selections'] as num?)?.toInt(),
      maxSelections: (json['max_selections'] as num?)?.toInt(),
      isRequired: json['is_required'] as bool?,
      color: json['color'] as String?,
      userHasVoted: json['user_has_voted'] as bool?,
      candidates: (json['candidates'] as List<dynamic>?)
          ?.map((e) => CandidateDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PositionItemDetailsImplToJson(
        _$PositionItemDetailsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'position_order': instance.positionOrder,
      'min_selections': instance.minSelections,
      'max_selections': instance.maxSelections,
      'is_required': instance.isRequired,
      'color': instance.color,
      'user_has_voted': instance.userHasVoted,
      'candidates': instance.candidates?.map((e) => e.toJson()).toList(),
    };
