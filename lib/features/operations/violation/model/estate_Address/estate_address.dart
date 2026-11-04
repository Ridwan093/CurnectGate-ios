import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'estate_address.freezed.dart';
part 'estate_address.g.dart';

@freezed
class EstateAddress with _$EstateAddress {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory EstateAddress({
    int? id,
    String? label,
    String? type,
    String? streetName,
    String? streetNumber,
    String? blockNumber,
    String? flatNumber,
    String? buildingName,
  }) = _EstateAddress;

  factory EstateAddress.safeFromJson(Map<String, dynamic>? json) {
    return EstateAddress(
      id: NullSafetyHelper.safeInt(json?['id']),
      label: NullSafetyHelper.safeString(json?['label']),
      type: NullSafetyHelper.safeString(json?['type']),
      streetName: NullSafetyHelper.safeString(json?['street_name']),
      streetNumber: NullSafetyHelper.safeString(json?['street_number']),
      blockNumber: NullSafetyHelper.safeString(json?['block_number']),
      flatNumber: NullSafetyHelper.safeString(json?['flat_number']),
      buildingName: NullSafetyHelper.safeString(json?['building_name']),
    );
  }

  factory EstateAddress.fromJson(Map<String, dynamic> json) =>
      _$EstateAddressFromJson(json);
}
