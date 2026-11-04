// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_household_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderHouseholdDataImpl _$$ReminderHouseholdDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ReminderHouseholdDataImpl(
      members: (json['members'] as List<dynamic>?)
          ?.map((e) =>
              ReminderHouseholdMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReminderHouseholdDataImplToJson(
        _$ReminderHouseholdDataImpl instance) =>
    <String, dynamic>{
      'members': instance.members?.map((e) => e.toJson()).toList(),
    };
