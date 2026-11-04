// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminders_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemindersDataImpl _$$RemindersDataImplFromJson(Map<String, dynamic> json) =>
    _$RemindersDataImpl(
      reminders: (json['reminders'] as List<dynamic>?)
          ?.map((e) => ReminderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RemindersDataImplToJson(_$RemindersDataImpl instance) =>
    <String, dynamic>{
      'reminders': instance.reminders?.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };
