import 'package:freezed_annotation/freezed_annotation.dart';

import 'property.dart';

part 'property_data.freezed.dart';
part 'property_data.g.dart';

@freezed
class PropertyData with _$PropertyData {
  @JsonSerializable(
    explicitToJson: true,
    fieldRename: FieldRename.snake,
  )
  const factory PropertyData({
    @JsonKey(name: 'properties') @Default([]) List<Property> properties,
  }) = _PropertyData;

  factory PropertyData.fromJson(Map<String, dynamic> json) =>
      _$PropertyDataFromJson(json);

  factory PropertyData.safeFromJson(Map<String, dynamic>? json) =>
      PropertyData(
        properties: (json?['properties'] as List<dynamic>? ?? [])
            .map((e) => Property.safeFromJson(e))
            .toList(),
      );
}