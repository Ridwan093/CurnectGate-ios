// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resident_directory_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResidentDirectoryDataImpl _$$ResidentDirectoryDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ResidentDirectoryDataImpl(
      residents: json['residents'] == null
          ? null
          : ResidentList.fromJson(json['residents'] as Map<String, dynamic>),
      summary: json['summary'] == null
          ? null
          : DirectorySummary.fromJson(json['summary'] as Map<String, dynamic>),
      filtersApplied: json['filters_applied'] == null
          ? null
          : DirectoryFilters.fromJson(
              json['filters_applied'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResidentDirectoryDataImplToJson(
        _$ResidentDirectoryDataImpl instance) =>
    <String, dynamic>{
      'residents': instance.residents?.toJson(),
      'summary': instance.summary?.toJson(),
      'filters_applied': instance.filtersApplied?.toJson(),
    };
