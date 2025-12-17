// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_count_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViolationCountDataImpl _$$ViolationCountDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ViolationCountDataImpl(
      total: (json['total'] as num?)?.toInt(),
      byStatus: (json['byStatus'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      byPriority: (json['byPriority'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      open: (json['open'] as num?)?.toInt(),
      closed: (json['closed'] as num?)?.toInt(),
      assignedToMe: (json['assignedToMe'] as num?)?.toInt(),
      unassigned: (json['unassigned'] as num?)?.toInt(),
      urgentOpen: (json['urgentOpen'] as num?)?.toInt(),
      highPriorityOpen: (json['highPriorityOpen'] as num?)?.toInt(),
      requiresAttention: (json['requiresAttention'] as num?)?.toInt(),
      recent: (json['recent'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
      anonymous: (json['anonymous'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ViolationCountDataImplToJson(
        _$ViolationCountDataImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'byStatus': instance.byStatus,
      'byPriority': instance.byPriority,
      'open': instance.open,
      'closed': instance.closed,
      'assignedToMe': instance.assignedToMe,
      'unassigned': instance.unassigned,
      'urgentOpen': instance.urgentOpen,
      'highPriorityOpen': instance.highPriorityOpen,
      'requiresAttention': instance.requiresAttention,
      'recent': instance.recent,
      'anonymous': instance.anonymous,
    };
