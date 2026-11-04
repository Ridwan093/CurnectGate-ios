import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Category({
    int? id,
    int? estateId,
    String? name,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  factory Category.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return Category.empty();
    return Category(
      id: NullSafetyHelper.safeInt(json['id']),
      estateId: NullSafetyHelper.safeInt(json['estate_id']),
      name: NullSafetyHelper.safeString(json['name']),
      status: NullSafetyHelper.safeString(json['status']),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
      updatedAt: NullSafetyHelper.safeString(json['updated_at']),
    );
  }

  factory Category.empty() => const Category(
        id: null,
        estateId: null,
        name: null,
        status: null,
        createdAt: null,
        updatedAt: null,
      );
}