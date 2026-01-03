// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViolationDataImpl _$$ViolationDataImplFromJson(Map<String, dynamic> json) =>
    _$ViolationDataImpl(
      violations: (json['violations'] as List<dynamic>)
          .map((e) => Violation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ViolationDataImplToJson(_$ViolationDataImpl instance) =>
    <String, dynamic>{
      'violations': instance.violations.map((e) => e.toJson()).toList(),
    };
