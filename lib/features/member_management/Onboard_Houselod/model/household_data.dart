import 'package:freezed_annotation/freezed_annotation.dart';

import 'household_member.dart';

part 'household_data.freezed.dart';
part 'household_data.g.dart';

@freezed
class HouseholdData with _$HouseholdData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory HouseholdData({
    @JsonKey(name: 'household')
    List<HouseholdMember>? householdMembers, // Renamed from 'household'
  }) = _HouseholdData;

  factory HouseholdData.fromJson(Map<String, dynamic> json) =>
      _$HouseholdDataFromJson(json);

  factory HouseholdData.safeFromJson(Map<String, dynamic>? json) {
    return HouseholdData(
      householdMembers:
          (json?['household'] as List<dynamic>?)
              ?.map((e) => HouseholdMember.safeFromJson(e))
              .whereType<HouseholdMember>()
              .toList(),
    );
  }

  factory HouseholdData.empty() => const HouseholdData(householdMembers: null);
}
