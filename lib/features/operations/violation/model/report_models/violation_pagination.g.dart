// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_pagination.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViolationPaginationImpl _$$ViolationPaginationImplFromJson(
        Map<String, dynamic> json) =>
    _$ViolationPaginationImpl(
      currentPage: (json['current_page'] as num?)?.toInt() ?? 1,
      lastPage: (json['last_page'] as num?)?.toInt() ?? 1,
      perPage: (json['per_page'] as num?)?.toInt() ?? 15,
      total: (json['total'] as num?)?.toInt() ?? 0,
      from: (json['from'] as num?)?.toInt(),
      to: (json['to'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ViolationPaginationImplToJson(
        _$ViolationPaginationImpl instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'last_page': instance.lastPage,
      'per_page': instance.perPage,
      'total': instance.total,
      'from': instance.from,
      'to': instance.to,
    };
