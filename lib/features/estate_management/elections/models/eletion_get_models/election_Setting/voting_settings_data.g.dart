// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'voting_settings_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VotingSettingsDataImpl _$$VotingSettingsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$VotingSettingsDataImpl(
      settings: json['settings'] == null
          ? null
          : VotingSettingsItem.fromJson(
              json['settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VotingSettingsDataImplToJson(
        _$VotingSettingsDataImpl instance) =>
    <String, dynamic>{
      'settings': instance.settings?.toJson(),
    };
