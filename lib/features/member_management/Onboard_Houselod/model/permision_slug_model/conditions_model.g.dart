// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conditions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConditionsImpl _$$ConditionsImplFromJson(Map<String, dynamic> json) =>
    _$ConditionsImpl(
      timeRestrictions:
          (json['time_restrictions'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, TimeRestriction.fromJson(e as Map<String, dynamic>)),
      ),
      requiresApproval: json['requires_approval'] as bool?,
      maxVisitorsPerDay: (json['max_visitors_per_day'] as num?)?.toInt(),
      facilities: (json['facilities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      moderated: json['moderated'] as bool?,
      postingLimits: (json['posting_limits'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
    );

Map<String, dynamic> _$$ConditionsImplToJson(_$ConditionsImpl instance) =>
    <String, dynamic>{
      'time_restrictions': instance.timeRestrictions,
      'requires_approval': instance.requiresApproval,
      'max_visitors_per_day': instance.maxVisitorsPerDay,
      'facilities': instance.facilities,
      'moderated': instance.moderated,
      'posting_limits': instance.postingLimits,
    };
