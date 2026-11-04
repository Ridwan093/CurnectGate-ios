// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_item_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PollItemSummaryImpl _$$PollItemSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$PollItemSummaryImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      opensAt: json['opens_at'] as String?,
      closesAt: json['closes_at'] as String?,
      isAnonymous: json['is_anonymous'] as bool?,
      showResultsBeforeClose: json['show_results_before_close'] as bool?,
      positionsCount: (json['positions_count'] as num?)?.toInt(),
      userStatus: json['user_status'] == null
          ? null
          : UserStatus.fromJson(json['user_status'] as Map<String, dynamic>),
      statistics: json['statistics'] == null
          ? null
          : PollStatistics.fromJson(json['statistics'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PollItemSummaryImplToJson(
        _$PollItemSummaryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'status': instance.status,
      'opens_at': instance.opensAt,
      'closes_at': instance.closesAt,
      'is_anonymous': instance.isAnonymous,
      'show_results_before_close': instance.showResultsBeforeClose,
      'positions_count': instance.positionsCount,
      'user_status': instance.userStatus?.toJson(),
      'statistics': instance.statistics?.toJson(),
    };
