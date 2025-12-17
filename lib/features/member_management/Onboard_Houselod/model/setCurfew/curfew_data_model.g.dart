// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curfew_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurfewDataImpl _$$CurfewDataImplFromJson(Map<String, dynamic> json) =>
    _$CurfewDataImpl(
      member: json['member'] == null
          ? null
          : CurfewMember.fromJson(json['member'] as Map<String, dynamic>),
      curfewSettings: json['curfew_settings'] == null
          ? null
          : CurfewSettings.fromJson(
              json['curfew_settings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CurfewDataImplToJson(_$CurfewDataImpl instance) =>
    <String, dynamic>{
      'member': instance.member?.toJson(),
      'curfew_settings': instance.curfewSettings?.toJson(),
    };
