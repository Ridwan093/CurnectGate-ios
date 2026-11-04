// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curfew_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurfewSettingsImpl _$$CurfewSettingsImplFromJson(Map<String, dynamic> json) =>
    _$CurfewSettingsImpl(
      enabled: json['enabled'] as bool?,
      restrictions: (json['restrictions'] as List<dynamic>?)
          ?.map((e) => CurfewRestriction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CurfewSettingsImplToJson(
        _$CurfewSettingsImpl instance) =>
    <String, dynamic>{
      'enabled': instance.enabled,
      'restrictions': instance.restrictions?.map((e) => e.toJson()).toList(),
    };
