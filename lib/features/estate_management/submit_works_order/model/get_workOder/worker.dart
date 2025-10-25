import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'worker.freezed.dart';
part 'worker.g.dart';

@freezed
class Worker with _$Worker {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Worker({
    int? id,
    int? workorderId,
    String? workerName,
    String? workerPhone,
    String? accessCode,
    bool? isVendorLeader,
    String? status,
    String? createdAt,
    String? updatedAt,
  }) = _Worker;

  factory Worker.fromJson(Map<String, dynamic> json) =>
      _$WorkerFromJson(json);

  factory Worker.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return Worker.empty();
    return Worker(
      id: NullSafetyHelper.safeInt(json['id']),
      workorderId: NullSafetyHelper.safeInt(json['workorder_id']),
      workerName: NullSafetyHelper.safeString(json['worker_name']),
      workerPhone: NullSafetyHelper.safeString(json['worker_phone']),
      accessCode: NullSafetyHelper.safeString(json['access_code']),
      isVendorLeader: NullSafetyHelper.safeBool(json['is_vendor_leader']),
      status: NullSafetyHelper.safeString(json['status']),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
      updatedAt: NullSafetyHelper.safeString(json['updated_at']),
    );
  }

  factory Worker.empty() => const Worker(
        id: null,
        workorderId: null,
        workerName: null,
        workerPhone: null,
        accessCode: null,
        isVendorLeader: null,
        status: null,
        createdAt: null,
        updatedAt: null,
      );
}