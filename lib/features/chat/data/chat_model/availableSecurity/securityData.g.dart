// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'securityData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SecurityPersonnelDataImpl _$$SecurityPersonnelDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SecurityPersonnelDataImpl(
      securityPersonnel: (json['security_personnel'] as List<dynamic>?)
          ?.map((e) => SecurityPersonnel.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SecurityPersonnelDataImplToJson(
        _$SecurityPersonnelDataImpl instance) =>
    <String, dynamic>{
      'security_personnel':
          instance.securityPersonnel?.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };
