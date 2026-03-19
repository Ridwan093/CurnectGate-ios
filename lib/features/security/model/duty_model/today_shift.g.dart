// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_shift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodayShiftImpl _$$TodayShiftImplFromJson(Map<String, dynamic> json) =>
    _$TodayShiftImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
      isOvernight: json['is_overnight'] as bool?,
      onDutyCount: (json['on_duty_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$TodayShiftImplToJson(_$TodayShiftImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'is_overnight': instance.isOvernight,
      'on_duty_count': instance.onDutyCount,
    };
