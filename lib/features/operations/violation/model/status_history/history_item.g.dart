// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryItemImpl _$$HistoryItemImplFromJson(Map<String, dynamic> json) =>
    _$HistoryItemImpl(
      id: (json['id'] as num?)?.toInt(),
      status: json['status'] as String?,
      changedBy: json['changed_by'] == null
          ? null
          : ChangedBy.fromJson(json['changed_by'] as Map<String, dynamic>),
      notes: json['notes'] as String?,
      changedAt: json['changed_at'] == null
          ? null
          : DateTime.parse(json['changed_at'] as String),
      timeAgo: json['time_ago'] as String?,
    );

Map<String, dynamic> _$$HistoryItemImplToJson(_$HistoryItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'changedBy': instance.changedBy,
      'notes': instance.notes,
      'changed_at': instance.changedAt?.toIso8601String(),
      'time_ago': instance.timeAgo,
    };
