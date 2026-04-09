// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViolationDataImpl _$$ViolationDataImplFromJson(Map<String, dynamic> json) =>
    _$ViolationDataImpl(
      violations: (json['violations'] as List<dynamic>?)
              ?.map((e) => Violation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      pagination: json['pagination'] == null
          ? null
          : ViolationPagination.fromJson(
              json['pagination'] as Map<String, dynamic>),
      summary: json['summary'] == null
          ? null
          : ViolationSummary.fromJson(json['summary'] as Map<String, dynamic>),
      filters: json['filters'] == null
          ? null
          : ViolationFilters.fromJson(json['filters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ViolationDataImplToJson(_$ViolationDataImpl instance) =>
    <String, dynamic>{
      'violations': instance.violations.map((e) => e.toJson()).toList(),
      'pagination': instance.pagination?.toJson(),
      'summary': instance.summary?.toJson(),
      'filters': instance.filters?.toJson(),
    };
