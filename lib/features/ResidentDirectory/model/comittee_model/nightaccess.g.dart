// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nightaccess.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NightAccessImpl _$$NightAccessImplFromJson(Map<String, dynamic> json) =>
    _$NightAccessImpl(
      enabled: json['enabled'] as bool?,
      conditions: json['conditions'] == null
          ? null
          : NightAccessConditions.fromJson(
              json['conditions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NightAccessImplToJson(_$NightAccessImpl instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'conditions': instance.conditions?.toJson(),
    };
