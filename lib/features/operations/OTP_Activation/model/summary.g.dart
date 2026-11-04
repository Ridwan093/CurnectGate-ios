// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SummaryImpl _$$SummaryImplFromJson(Map<String, dynamic> json) =>
    _$SummaryImpl(
      totalGenerated: (json['totalGenerated'] as num?)?.toInt() ?? 0,
      scheduled: (json['scheduled'] as num?)?.toInt() ?? 0,
      active: (json['active'] as num?)?.toInt() ?? 0,
      used: (json['used'] as num?)?.toInt() ?? 0,
      expired: (json['expired'] as num?)?.toInt() ?? 0,
      revoked: (json['revoked'] as num?)?.toInt() ?? 0,
      pendingValidation: (json['pendingValidation'] as num?)?.toInt() ?? 0,
      thisMonth: (json['thisMonth'] as num?)?.toInt() ?? 0,
      thisWeek: (json['thisWeek'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$SummaryImplToJson(_$SummaryImpl instance) =>
    <String, dynamic>{
      'totalGenerated': instance.totalGenerated,
      'scheduled': instance.scheduled,
      'active': instance.active,
      'used': instance.used,
      'expired': instance.expired,
      'revoked': instance.revoked,
      'pendingValidation': instance.pendingValidation,
      'thisMonth': instance.thisMonth,
      'thisWeek': instance.thisWeek,
    };
