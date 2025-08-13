// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertyDataImpl _$$PropertyDataImplFromJson(Map<String, dynamic> json) =>
    _$PropertyDataImpl(
      properties: (json['properties'] as List<dynamic>)
          .map((e) => Property.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PropertyDataImplToJson(_$PropertyDataImpl instance) =>
    <String, dynamic>{
      'properties': instance.properties.map((e) => e.toJson()).toList(),
    };
