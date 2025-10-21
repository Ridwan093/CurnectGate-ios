import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'work_order_category_data.dart';


part 'work_order_categories_response.freezed.dart';
part 'work_order_categories_response.g.dart';

@freezed
class WorkOrderCategoriesResponse with _$WorkOrderCategoriesResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory WorkOrderCategoriesResponse({
    bool? status,
    String? message,
    int? code,
    WorkOrderCategoryData? data,
  }) = _WorkOrderCategoriesResponse;

  factory WorkOrderCategoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderCategoriesResponseFromJson(json);

  factory WorkOrderCategoriesResponse.fromSafeJson(Map<String, dynamic> json) {
    return WorkOrderCategoriesResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']),
      code: NullSafetyHelper.safeInt(json['code']),
      data: NullSafetyHelper.safeModel(
        json['data'],
        WorkOrderCategoryData.fromSafeJson,
        WorkOrderCategoryData.empty(),
      ),
    );
  }

  factory WorkOrderCategoriesResponse.empty() => const WorkOrderCategoriesResponse(
        status: null,
        message: null,
        code: null,
        data: null,
      );
}
