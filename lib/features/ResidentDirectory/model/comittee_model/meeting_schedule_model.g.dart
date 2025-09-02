// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meeting_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MeetingScheduleImpl _$$MeetingScheduleImplFromJson(
        Map<String, dynamic> json) =>
    _$MeetingScheduleImpl(
      day: json['day'] as String?,
      time: json['time'] as String?,
      frequency: json['frequency'] as String?,
    );

Map<String, dynamic> _$$MeetingScheduleImplToJson(
        _$MeetingScheduleImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'time': instance.time,
      'frequency': instance.frequency,
    };
