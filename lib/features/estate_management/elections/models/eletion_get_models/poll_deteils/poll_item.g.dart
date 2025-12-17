// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PollItemImpl _$$PollItemImplFromJson(Map<String, dynamic> json) =>
    _$PollItemImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      opensAt: json['opens_at'] as String?,
      closesAt: json['closes_at'] as String?,
      isAnonymous: json['is_anonymous'] as bool?,
      rulesAndRegulations: json['rules_and_regulations'] as String?,
      positions: (json['positions'] as List<dynamic>?)
          ?.map((e) => PositionItemDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      userStatus: json['user_status'] == null
          ? null
          : UserStatus.fromJson(json['user_status'] as Map<String, dynamic>),
      statistics: json['statistics'] == null
          ? null
          : PollStatistics.fromJson(json['statistics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PollItemImplToJson(_$PollItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'status': instance.status,
      'opens_at': instance.opensAt,
      'closes_at': instance.closesAt,
      'is_anonymous': instance.isAnonymous,
      'rules_and_regulations': instance.rulesAndRegulations,
      'positions': instance.positions?.map((e) => e.toJson()).toList(),
      'user_status': instance.userStatus?.toJson(),
      'statistics': instance.statistics?.toJson(),
    };
