// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_filters.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppliedFiltersImpl _$$AppliedFiltersImplFromJson(Map<String, dynamic> json) =>
    _$AppliedFiltersImpl(
      status: json['status'] as String? ?? '',
      priority: json['priority'] as String?,
      categoryId: json['category_id'] as String?,
      assignedTo: json['assigned_to'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      search: json['search'] as String? ?? '',
    );

Map<String, dynamic> _$$AppliedFiltersImplToJson(
        _$AppliedFiltersImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'priority': instance.priority,
      'category_id': instance.categoryId,
      'assigned_to': instance.assignedTo,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'search': instance.search,
    };

_$ViolationFiltersImpl _$$ViolationFiltersImplFromJson(
        Map<String, dynamic> json) =>
    _$ViolationFiltersImpl(
      currentFilter: json['current_filter'] as String? ?? '',
      availableFilters:
          (json['available_filters'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, e as String),
              ) ??
              const {},
      appliedFilters: json['applied_filters'] == null
          ? null
          : AppliedFilters.fromJson(
              json['applied_filters'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ViolationFiltersImplToJson(
        _$ViolationFiltersImpl instance) =>
    <String, dynamic>{
      'current_filter': instance.currentFilter,
      'available_filters': instance.availableFilters,
      'applied_filters': instance.appliedFilters?.toJson(),
    };
