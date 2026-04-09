import 'package:freezed_annotation/freezed_annotation.dart';

import 'nullSafty_model.dart';


part 'estate.freezed.dart';
part 'estate.g.dart';

@freezed
class Estate with _$Estate {
  const factory Estate({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'name') @Default('') String name,
    @JsonKey(name: 'description') @Default('') String description,
    @JsonKey(name: 'type') @Default('') String type,
    @Default('') String code,
    @JsonKey(name: 'logo_url') @Default('') String logoUrl,
    @JsonKey(name: 'color') @Default('') String color,
    @Default('') String backgroundImage,

    // ignore: invalid_annotation_target
    @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime) DateTime? createdAt,
    @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime) DateTime? updatedAt,
  }) = _Estate;

  factory Estate.empty() => Estate();

  factory Estate.fromJson(Map<String, dynamic> json) => _$EstateFromJson(json);

  static Estate fromSafeJson(Map<String, dynamic>? json) {
    return Estate(
      id: NullSafetyHelper.safeInt(json?['id']),
      name: NullSafetyHelper.safeString(json?['name']),
      description: NullSafetyHelper.safeString(json?['description']),
      type: NullSafetyHelper.safeString(json?['type']),
      code: NullSafetyHelper.safeString(json?['code']),
      logoUrl: NullSafetyHelper.safeString(json?['logo_url']),
      color: NullSafetyHelper.safeString(json?['color']),
      backgroundImage: NullSafetyHelper.safeString(json?['background_image']),
    
      createdAt: NullSafetyHelper.safeDateTime(json?['created_at']),
      updatedAt: NullSafetyHelper.safeDateTime(json?['updated_at']),
    );
  }
}
