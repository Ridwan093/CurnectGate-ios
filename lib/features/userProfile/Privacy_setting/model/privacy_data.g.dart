// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      privacy: json['privacy'] == null
          ? null
          : Privacy.fromJson(json['privacy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'privacy': instance.privacy,
    };
