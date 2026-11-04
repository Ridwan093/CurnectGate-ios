// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccessSummaryImpl _$$AccessSummaryImplFromJson(Map<String, dynamic> json) =>
    _$AccessSummaryImpl(
      lastGateAccess: json['last_gate_access'],
      totalAccessAttemptsToday:
          (json['total_access_attempts_today'] as num?)?.toInt(),
      currentLocation: json['current_location'],
      isCurrentlyInEstate: json['is_currently_in_estate'] as bool?,
    );

Map<String, dynamic> _$$AccessSummaryImplToJson(_$AccessSummaryImpl instance) =>
    <String, dynamic>{
      'last_gate_access': instance.lastGateAccess,
      'total_access_attempts_today': instance.totalAccessAttemptsToday,
      'current_location': instance.currentLocation,
      'is_currently_in_estate': instance.isCurrentlyInEstate,
    };
