import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'destination_info.freezed.dart';
part 'destination_info.g.dart';

@freezed
class DestinationInfo with _$DestinationInfo {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory DestinationInfo({
    String? propertyName,
    String? propertyCode,
    String? fullAddress,
    String? directions,
    String? blockNumber,
    String? buildingName,
    String? streetName,
    String? landmark,
  }) = _DestinationInfo;

  factory DestinationInfo.fromJson(Map<String, dynamic> json) =>
      _$DestinationInfoFromJson(json);

  factory DestinationInfo.fromSafeJson(Map<String, dynamic>? json) {
    if (json == null) return DestinationInfo.empty();
    return DestinationInfo(
      propertyName: NullSafetyHelper.safeString(json['property_name']),
      propertyCode: NullSafetyHelper.safeString(json['property_code']),
      fullAddress: NullSafetyHelper.safeString(json['full_address']),
      directions: NullSafetyHelper.safeString(json['directions']),
      blockNumber: NullSafetyHelper.safeString(json['block_number']),
      buildingName: NullSafetyHelper.safeString(json['building_name']),
      streetName: NullSafetyHelper.safeString(json['street_name']),
      landmark: NullSafetyHelper.safeString(json['landmark']),
    );
  }

  factory DestinationInfo.empty() => const DestinationInfo(
        propertyName: null,
        propertyCode: null,
        fullAddress: null,
        directions: null,
        blockNumber: null,
        buildingName: null,
        streetName: null,
        landmark: null,
      );
}
