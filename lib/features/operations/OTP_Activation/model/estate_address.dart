import 'nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'estate_address.freezed.dart';
part 'estate_address.g.dart';


@freezed
class EstateAddress with _$EstateAddress {
  const factory EstateAddress({
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'address_type') @Default('') String addressType,
    @JsonKey(name: 'street_number') @Default('') String streetNumber,
    @JsonKey(name: 'street_name') @Default('') String streetName,
    @JsonKey(name: 'block_number') @Default('') String blockNumber,
    @JsonKey(name: 'flat_number') @Default('') String flatNumber,
    @JsonKey(name: 'building_name') @Default('') String buildingName,
    @JsonKey(name: 'estate_name') @Default('') String estateName,
    @JsonKey(name: 'city') @Default('') String city,
    @JsonKey(name: 'state') @Default('') String state,
    @JsonKey(name: 'postal_code') String? postalCode,
    @JsonKey(name: 'skip_duplicate_check') dynamic skipDuplicateCheck,
    @JsonKey(name: 'duplicate_action') dynamic duplicateAction,
    @JsonKey(name: 'country') @Default('') String country,
    @JsonKey(name: 'latitude') @Default('0') String latitude,
    @JsonKey(name: 'longitude') @Default('0') String longitude,
    @JsonKey(name: 'landmark_description') @Default('') String landmarkDescription,
    @JsonKey(name: 'estate_id') @Default(0) int estateId,
    @JsonKey(name: 'created_by') @Default(0) int createdBy,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'additional_info') @Default([]) List<dynamic> additionalInfo,
    @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime) required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime) required DateTime updatedAt,
  }) = _EstateAddress;

  factory EstateAddress.empty() => EstateAddress(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

  factory EstateAddress.fromJson(Map<String, dynamic> json) =>
      _$EstateAddressFromJson(json);
factory EstateAddress.safeFromJson(Map<String, dynamic>? json) {
  final data = NullSafetyHelper.safeMap(json);
  return EstateAddress(
    id: NullSafetyHelper.safeInt(data['id']),
    addressType: NullSafetyHelper.safeString(data['address_type']),
    streetNumber: NullSafetyHelper.safeString(data['street_number']),
    streetName: NullSafetyHelper.safeString(data['street_name']),
    blockNumber: NullSafetyHelper.safeString(data['block_number']),
    flatNumber: NullSafetyHelper.safeString(data['flat_number']),
    buildingName: NullSafetyHelper.safeString(data['building_name']),
    estateName: NullSafetyHelper.safeString(data['estate_name']),
    city: NullSafetyHelper.safeString(data['city']),
    state: NullSafetyHelper.safeString(data['state']),
    postalCode: NullSafetyHelper.safeString(data['postal_code']),
    skipDuplicateCheck: data['skip_duplicate_check'],
    duplicateAction: data['duplicate_action'],
    country: NullSafetyHelper.safeString(data['country']),
    latitude: NullSafetyHelper.safeString(data['latitude']),
    longitude: NullSafetyHelper.safeString(data['longitude']),
    landmarkDescription: NullSafetyHelper.safeString(data['landmark_description']),
    estateId: NullSafetyHelper.safeInt(data['estate_id']),
    createdBy: NullSafetyHelper.safeInt(data['created_by']),
    isActive: NullSafetyHelper.safeBool(data['is_active']),
    additionalInfo: NullSafetyHelper.safeList(data['additional_info']),
    createdAt: NullSafetyHelper.safeDateTime(data['created_at']),
    updatedAt: NullSafetyHelper.safeDateTime(data['updated_at']),
  );
}

}
