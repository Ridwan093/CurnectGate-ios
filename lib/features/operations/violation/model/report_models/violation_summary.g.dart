// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriorityDistributionImpl _$$PriorityDistributionImplFromJson(
        Map<String, dynamic> json) =>
    _$PriorityDistributionImpl(
      low: (json['low'] as num?)?.toInt() ?? 0,
      medium: (json['medium'] as num?)?.toInt() ?? 0,
      high: (json['high'] as num?)?.toInt() ?? 0,
      urgent: (json['urgent'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$PriorityDistributionImplToJson(
        _$PriorityDistributionImpl instance) =>
    <String, dynamic>{
      'low': instance.low,
      'medium': instance.medium,
      'high': instance.high,
      'urgent': instance.urgent,
    };

_$ViolationSummaryImpl _$$ViolationSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$ViolationSummaryImpl(
      total: (json['total'] as num?)?.toInt() ?? 0,
      pending: (json['pending'] as num?)?.toInt() ?? 0,
      investigating: (json['investigating'] as num?)?.toInt() ?? 0,
      resolved: (json['resolved'] as num?)?.toInt() ?? 0,
      dismissed: (json['dismissed'] as num?)?.toInt() ?? 0,
      byPriority: json['by_priority'] == null
          ? null
          : PriorityDistribution.fromJson(
              json['by_priority'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ViolationSummaryImplToJson(
        _$ViolationSummaryImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'pending': instance.pending,
      'investigating': instance.investigating,
      'resolved': instance.resolved,
      'dismissed': instance.dismissed,
      'by_priority': instance.byPriority?.toJson(),
    };
