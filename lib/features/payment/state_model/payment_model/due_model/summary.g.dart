// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryImpl _$$SummaryImplFromJson(Map<String, dynamic> json) =>
    _$SummaryImpl(
      totalOutstanding: (json['total_outstanding'] as num?)?.toInt(),
      totalOverdue: (json['total_overdue'] as num?)?.toInt(),
      count: (json['count'] as num?)?.toInt(),
      overdueCount: (json['overdue_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SummaryImplToJson(_$SummaryImpl instance) =>
    <String, dynamic>{
      'total_outstanding': instance.totalOutstanding,
      'total_overdue': instance.totalOverdue,
      'count': instance.count,
      'overdue_count': instance.overdueCount,
    };
