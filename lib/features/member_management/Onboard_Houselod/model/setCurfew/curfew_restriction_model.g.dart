// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curfew_restriction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurfewRestrictionImpl _$$CurfewRestrictionImplFromJson(
        Map<String, dynamic> json) =>
    _$CurfewRestrictionImpl(
      day: json['day'] as String?,
      startTime: json['start_time'] as String?,
      endTime: json['end_time'] as String?,
    );

Map<String, dynamic> _$$CurfewRestrictionImplToJson(
        _$CurfewRestrictionImpl instance) =>
    <String, dynamic>{
      'day': instance.day,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
    };
