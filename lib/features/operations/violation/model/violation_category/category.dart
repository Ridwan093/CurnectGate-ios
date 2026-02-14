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
    String? type,
    String? name,
    List<dynamic>? subCategories,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) = _Category;

  factory Category.safeFromJson(Map<String, dynamic>? json) {
    return Category(
      id: NullSafetyHelper.safeInt(json?['id']),
      estateId: NullSafetyHelper.safeInt(json?['estate_id']),
      type: NullSafetyHelper.safeString(json?['type']),
      name: NullSafetyHelper.safeString(json?['name']),
      subCategories: NullSafetyHelper.safeList(json?['sub_categories']),
      description: NullSafetyHelper.safeString(json?['description']),
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
    );
  }

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
