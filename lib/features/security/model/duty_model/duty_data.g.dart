// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'duty_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DutyDataImpl _$$DutyDataImplFromJson(Map<String, dynamic> json) =>
    _$DutyDataImpl(
      date: json['date'] as String?,
      day: json['day'] as String?,
      myDuty: json['my_duty'] == null
          ? null
          : MyDuty.fromJson(json['my_duty'] as Map<String, dynamic>),
      onDutyPersonnel: json['on_duty_personnel'] as List<dynamic>?,
      todayShifts: (json['today_shifts'] as List<dynamic>?)
          ?.map((e) => TodayShift.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalOnDuty: (json['total_on_duty'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$DutyDataImplToJson(_$DutyDataImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'day': instance.day,
      'my_duty': instance.myDuty?.toJson(),
      'on_duty_personnel': instance.onDutyPersonnel,
      'today_shifts': instance.todayShifts?.map((e) => e.toJson()).toList(),
      'total_on_duty': instance.totalOnDuty,
    };
