import 'package:curnectgate/features/operations/OTP_Activation/model/models.dart.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';




part 'location_details.freezed.dart';
part 'location_details.g.dart';


@freezed
class LocationDetails with _$LocationDetails {
  @JsonSerializable(explicitToJson: true)
  const factory LocationDetails({
    @JsonKey(name: 'estate_address') EstateAddress? estateAddress,
    @JsonKey(name: 'additional_location') @Default('') String additionalLocation,
    @JsonKey(name: 'formatted_address') @Default('') String formattedAddress,
  }) = _LocationDetails;

  factory LocationDetails.fromJson(Map<String, dynamic> json) =>
      _$LocationDetailsFromJson(json);

  factory LocationDetails.safeFromJson(Map<String, dynamic>? json) {
    return LocationDetails(
      estateAddress:
          json?['estate_address'] != null ? EstateAddress.safeFromJson(json?['estate_address']) : null,
      additionalLocation:
          NullSafetyHelper.safeString(json?['additional_location']),
      formattedAddress:
          NullSafetyHelper.safeString(json?['formatted_address']),
    );
  }
}
