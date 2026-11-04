// committee_category_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'committee_category_model.freezed.dart';
part 'committee_category_model.g.dart';

@freezed
class CommitteeCategory with _$CommitteeCategory {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory CommitteeCategory({
     int? id,
     String? name,
     int? estateId,
     String? description,
     String? colorCode,
     bool? isActive,
     DateTime? createdAt,
     DateTime? updatedAt,
  }) = _CommitteeCategory;

  factory CommitteeCategory.fromJson(Map<String, dynamic> json) =>
      _$CommitteeCategoryFromJson(json);

  factory CommitteeCategory.fromSafeJson(Map<String, dynamic> json) {
    return CommitteeCategory(
      id: NullSafetyHelper.safeInt(json['id']),
      name: NullSafetyHelper.safeString(json['name']),
      estateId: NullSafetyHelper.safeInt(json['estate_id']),
      description: NullSafetyHelper.safeString(json['description']),
      colorCode: NullSafetyHelper.safeString(json['color_code']),
      isActive: NullSafetyHelper.safeBool(json['is_active']),
      createdAt: NullSafetyHelper.safeDateTime(json['created_at']),
      updatedAt: NullSafetyHelper.safeDateTime(json['updated_at']),
    );
  }

  factory CommitteeCategory.empty() => CommitteeCategory(
        id: 0,
        name: '',
        estateId: 0,
        description: '',
        colorCode: '#000000',
        isActive: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
}