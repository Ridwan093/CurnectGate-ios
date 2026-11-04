import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'work_order_category.dart';

part 'work_order_category_data.freezed.dart';
part 'work_order_category_data.g.dart';

@freezed
class WorkOrderCategoryData with _$WorkOrderCategoryData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory WorkOrderCategoryData({List<WorkOrderCategory>? categories}) =
      _WorkOrderCategoryData;

  factory WorkOrderCategoryData.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderCategoryDataFromJson(json);

  factory WorkOrderCategoryData.fromSafeJson(Map<String, dynamic> json) {
    final list = NullSafetyHelper.safeList(json['categories']);
    return WorkOrderCategoryData(
      categories:
          list
              .map(
                (e) => NullSafetyHelper.safeModel(
                  e,
                  WorkOrderCategory.fromSafeJson,
                  WorkOrderCategory.empty(),
                ),
              )
              .whereType<WorkOrderCategory>() // ✅ filters out nulls safely
              .toList(),
    );
  }

  factory WorkOrderCategoryData.empty() =>
      const WorkOrderCategoryData(categories: null);
}
