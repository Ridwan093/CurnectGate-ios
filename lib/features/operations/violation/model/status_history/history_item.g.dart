// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryItemImpl _$$HistoryItemImplFromJson(Map<String, dynamic> json) =>
    _$HistoryItemImpl(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as String?,
      changedBy: json['changedBy'] == null
          ? null
          : ChangedBy.fromJson(json['changedBy'] as Map<String, dynamic>),
      notes: json['notes'] as String?,
      changedAt: json['changedAt'] == null
          ? null
          : DateTime.parse(json['changedAt'] as String),
      timeAgo: json['timeAgo'] as String?,
    );

Map<String, dynamic> _$$HistoryItemImplToJson(_$HistoryItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'changedBy': instance.changedBy,
      'notes': instance.notes,
      'changedAt': instance.changedAt?.toIso8601String(),
      'timeAgo': instance.timeAgo,
    };
