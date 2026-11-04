import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'permit.dart';

part 'clearance_permit_data.freezed.dart';
part 'clearance_permit_data.g.dart';

@freezed
class ClearancePermitData with _$ClearancePermitData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ClearancePermitData({
    List<Permit>? permits,
  }) = _ClearancePermitData;

  factory ClearancePermitData.fromJson(Map<String, dynamic> json) =>
      _$ClearancePermitDataFromJson(json);

  factory ClearancePermitData.fromSafeJson(Map<String, dynamic>? json) {
    if (json == null) return ClearancePermitData.empty();
    final list = NullSafetyHelper.safeList(json['permits']);
    return ClearancePermitData(
      permits: list
          .map((e) => NullSafetyHelper.safeModel(
                e,
                Permit.fromSafeJson,
                Permit.empty(),
              ))
          .whereType<Permit>()
          .toList(),
    );
  }

  factory ClearancePermitData.empty() => const ClearancePermitData(
        permits: null,
      );
}
