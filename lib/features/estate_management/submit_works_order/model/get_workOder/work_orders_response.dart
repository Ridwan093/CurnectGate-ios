
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'work_order_data.dart';

part 'work_orders_response.freezed.dart';
part 'work_orders_response.g.dart';

@freezed
class WorkOrderResponse with _$WorkOrderResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory WorkOrderResponse({
    required bool status,
    required String message,
    required int code,
    required WorkOrderData data,
  }) = _WorkOrderResponse;

  factory WorkOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderResponseFromJson(json);

  factory WorkOrderResponse.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return WorkOrderResponse.empty();
    return WorkOrderResponse(
      status: NullSafetyHelper.safeBool(json['status']),
      message: NullSafetyHelper.safeString(json['message']) ,
      code: NullSafetyHelper.safeInt(json['code']),
      data: WorkOrderData.safeFromJson(json['data']),
    );
  }

  factory WorkOrderResponse.empty() =>  WorkOrderResponse(
        status: false,
        message: '',
        code: 0,
        data: WorkOrderData.empty(),
      );
}