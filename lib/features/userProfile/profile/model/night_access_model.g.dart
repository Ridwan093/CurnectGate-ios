// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'night_access_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NightAccessImpl _$$NightAccessImplFromJson(Map<String, dynamic> json) =>
    _$NightAccessImpl(
      enabled: json['enabled'] as bool? ?? false,
      conditions: json['conditions'] == null
          ? null
          : Conditions.fromJson(json['conditions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NightAccessImplToJson(_$NightAccessImpl instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'conditions': instance.conditions,
    };
