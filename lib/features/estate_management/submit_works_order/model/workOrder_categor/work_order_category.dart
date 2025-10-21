import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_order_category.freezed.dart';
part 'work_order_category.g.dart';

@freezed
class WorkOrderCategory with _$WorkOrderCategory {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory WorkOrderCategory({
    int? id,
    int? estateId,
    String? name,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) = _WorkOrderCategory;

  factory WorkOrderCategory.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderCategoryFromJson(json);

  factory WorkOrderCategory.fromSafeJson(Map<String, dynamic> json) {
    return WorkOrderCategory(
      id: NullSafetyHelper.safeInt(json['id']),
      estateId: NullSafetyHelper.safeInt(json['estate_id']),
      name: NullSafetyHelper.safeString(json['name']),
      status: NullSafetyHelper.safeString(json['status']),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
      updatedAt: NullSafetyHelper.safeString(json['updated_at']),
    );
  }

  factory WorkOrderCategory.empty() => const WorkOrderCategory(
        id: null,
        estateId: null,
        name: null,
        status: null,
        createdAt: null,
        updatedAt: null,
      );
}
