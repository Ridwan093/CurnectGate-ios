// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vote_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VoteItemImpl _$$VoteItemImplFromJson(Map<String, dynamic> json) =>
    _$VoteItemImpl(
      positionTitle: json['position_title'] as String?,
      candidates: (json['candidates'] as List<dynamic>?)
          ?.map((e) => CandidateItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VoteItemImplToJson(_$VoteItemImpl instance) =>
    <String, dynamic>{
      'position_title': instance.positionTitle,
      'candidates': instance.candidates?.map((e) => e.toJson()).toList(),
    };
