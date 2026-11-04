

import 'package:freezed_annotation/freezed_annotation.dart';

part 'nightaccess_condition.freezed.dart';
part 'nightaccess_condition.g.dart';


@freezed
class NightAccessConditions with _$NightAccessConditions {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory NightAccessConditions({
    List<dynamic>? timeRestrictions,
  }) = _NightAccessConditions;

  factory NightAccessConditions.fromJson(Map<String, dynamic> json) =>
      _$NightAccessConditionsFromJson(json);

  factory NightAccessConditions.fromSafeJson(Map<String, dynamic> json) {
    return NightAccessConditions(
      timeRestrictions: json['time_restrictions'] != null
          ? List<dynamic>.from(json['time_restrictions'])
          : [],
    );
  }

  factory NightAccessConditions.empty() => const NightAccessConditions(
        timeRestrictions: null,
      );
}
