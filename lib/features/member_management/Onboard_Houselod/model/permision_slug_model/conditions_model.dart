import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'time_restriction_model.dart';

part 'conditions_model.freezed.dart';
part 'conditions_model.g.dart';

// conditions_model.dart
@freezed
class Conditions with _$Conditions {
  const factory Conditions({
    @JsonKey(name: 'time_restrictions') Map<String, TimeRestriction>? timeRestrictions,
    @JsonKey(name: 'requires_approval') bool? requiresApproval,
    @JsonKey(name: 'max_visitors_per_day') int? maxVisitorsPerDay,
    List<String>? facilities,
    bool? moderated,
    @JsonKey(name: 'posting_limits') Map<String, int>? postingLimits,
  }) = _Conditions;

  factory Conditions.fromJson(Map<String, dynamic> json) => _$ConditionsFromJson(json);

  factory Conditions.safeFromJson(Map<String, dynamic>? json) {
    return Conditions(
      timeRestrictions: (json?['time_restrictions'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(key, TimeRestriction.safeFromJson(value))
      ),
      requiresApproval: NullSafetyHelper.safeBool(json?['requires_approval']),
      maxVisitorsPerDay: NullSafetyHelper.safeInt(json?['max_visitors_per_day']),
      facilities: (json?['facilities'] as List<dynamic>?)?.cast<String>(),
      moderated: NullSafetyHelper.safeBool(json?['moderated']),
      postingLimits: (json?['posting_limits'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(key, value as int)
      ),
    );
  }
}




