import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'violation_filters.freezed.dart';
part 'violation_filters.g.dart';

@freezed
class AppliedFilters with _$AppliedFilters {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory AppliedFilters({
    @Default('') String status,
    String? priority,
    String? categoryId,
    String? assignedTo,
    String? startDate,
    String? endDate,
    @Default('') String search,
  }) = _AppliedFilters;

  factory AppliedFilters.fromJson(Map<String, dynamic> json) =>
      _$AppliedFiltersFromJson(json);

  factory AppliedFilters.safeFromJson(Map<String, dynamic>? json) {
    return AppliedFilters(
      status: NullSafetyHelper.safeString(json?['status']),
      priority: NullSafetyHelper.safeString(json?['priority']),
      categoryId: NullSafetyHelper.safeString(json?['category_id']?.toString()),
      assignedTo: NullSafetyHelper.safeString(json?['assigned_to']?.toString()),
      startDate: NullSafetyHelper.safeString(json?['start_date']),
      endDate: NullSafetyHelper.safeString(json?['end_date']),
      search: NullSafetyHelper.safeString(json?['search']),
    );
  }

  factory AppliedFilters.empty() => const AppliedFilters(
        status: 'pending',
        search: 'description',
      );
}

@freezed
class ViolationFilters with _$ViolationFilters {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ViolationFilters({
    @Default('') String currentFilter,
    @Default({}) Map<String, String> availableFilters,
    AppliedFilters? appliedFilters,
  }) = _ViolationFilters;

  factory ViolationFilters.fromJson(Map<String, dynamic> json) =>
      _$ViolationFiltersFromJson(json);

  factory ViolationFilters.safeFromJson(Map<String, dynamic>? json) {
    return ViolationFilters(
      currentFilter: NullSafetyHelper.safeString(json?['current_filter']),
      availableFilters: Map<String, String>.from(json?['available_filters'] ?? {}),
      appliedFilters: json?['applied_filters'] != null ? AppliedFilters.safeFromJson(json?['applied_filters']) : null,
    );
  }

  factory ViolationFilters.empty() => const ViolationFilters(
        currentFilter: 'all',
        availableFilters: {},
      );
}
