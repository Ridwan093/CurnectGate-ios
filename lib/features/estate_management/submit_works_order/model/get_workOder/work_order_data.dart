
import 'package:freezed_annotation/freezed_annotation.dart';


import 'work_order_list.dart';

part 'work_order_data.freezed.dart';
part 'work_order_data.g.dart';

@freezed
class WorkOrderData with _$WorkOrderData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory WorkOrderData({
    required WorkOrderList workorders,
  }) = _WorkOrderData;

  factory WorkOrderData.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderDataFromJson(json);

  factory WorkOrderData.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return WorkOrderData.empty();
    return WorkOrderData(
      workorders: WorkOrderList.safeFromJson(json['workorders']),
    );
  }

  factory WorkOrderData.empty() =>  WorkOrderData(
        workorders: WorkOrderList.empty(),
      );
}