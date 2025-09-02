// destination_info_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'destination_info_model.freezed.dart';
part 'destination_info_model.g.dart';

@freezed

class DestinationInfoModel with _$DestinationInfoModel {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory DestinationInfoModel({
    String? propertyName,
    String? propertyCode,
    String? fullAddress,
    String? directions,
    String? blockNumber,
    String? buildingName,
    String? streetName,
    String? landmark,
  }) = _DestinationInfoModel;

  // Regular freezed fromJson
  factory DestinationInfoModel.fromJson(Map<String, dynamic> json) =>
      _$DestinationInfoModelFromJson(json);

  // Safe fromJson with null safety handling
  factory DestinationInfoModel.fromSafeJson(Map<String, dynamic> json) {
    return DestinationInfoModel(
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

  factory DestinationInfoModel.empty() => const DestinationInfoModel(
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