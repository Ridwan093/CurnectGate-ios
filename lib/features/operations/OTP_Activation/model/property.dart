import 'package:freezed_annotation/freezed_annotation.dart';

import 'nullSafty_model.dart';

part 'property.freezed.dart';
part 'property.g.dart';

@freezed
class Property with _$Property {
  const factory Property({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'estate_id') @Default(0) int estateId,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'type') @Default('') String type,
    @JsonKey(name: 'code') @Default('') String code,
    @JsonKey(name: 'block') @Default('') String block,
    @JsonKey(name: 'street') @Default('') String street,
    @JsonKey(name: 'description') @Default('') String description,
    @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime) required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime) required DateTime updatedAt,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) => _$PropertyFromJson(json);

  static Property fromSafeJson(Map<String, dynamic>? json) {
    return Property(
      id: NullSafetyHelper.safeInt(json?['id']),
      estateId: NullSafetyHelper.safeInt(json?['estate_id']),
      name: NullSafetyHelper.safeString(json?['name']),
      type: NullSafetyHelper.safeString(json?['type']),
      code: NullSafetyHelper.safeString(json?['code']),
      block: NullSafetyHelper.safeString(json?['block']),
      street: NullSafetyHelper.safeString(json?['street']),
      description: NullSafetyHelper.safeString(json?['description']),
      createdAt: NullSafetyHelper.safeDateTime(json?['created_at']),
      updatedAt: NullSafetyHelper.safeDateTime(json?['updated_at']),
    );
  }
}
