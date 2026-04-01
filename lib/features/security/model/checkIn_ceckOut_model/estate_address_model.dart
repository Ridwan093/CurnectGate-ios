// estate_address_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'estate_address_model.freezed.dart';
part 'estate_address_model.g.dart';

@freezed

class EstateAddressModel with _$EstateAddressModel {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory EstateAddressModel({
    int? id,
    String? addressType,
    String? streetNumber,
    String? streetName,
    String? blockNumber,
    String? flatNumber,
    String? buildingName,
    String? estateName,
    String? city,
    String? state,
    String? postalCode,
    String? skipDuplicateCheck,
    String? duplicateAction,
    String? country,
    String? latitude,
    String? longitude,
    String? landmarkDescription,
    int? estateId,
    int? createdBy,
    bool? isActive,
    List<dynamic>? additionalInfo,
    String? createdAt,
    String? updatedAt,
  }) = _EstateAddressModel;

  // Regular freezed fromJson
  factory EstateAddressModel.fromJson(Map<String, dynamic> json) =>
      _$EstateAddressModelFromJson(json);

  // Safe fromJson with null safety handling
  factory EstateAddressModel.fromSafeJson(Map<String, dynamic> json) {
    return EstateAddressModel(
      id: NullSafetyHelper.safeInt(json['id']),
      addressType: NullSafetyHelper.safeString(json['address_type']),
      streetNumber: NullSafetyHelper.safeString(json['street_number']),
      streetName: NullSafetyHelper.safeString(json['street_name']),
      blockNumber: NullSafetyHelper.safeString(json['block_number']),
      flatNumber: NullSafetyHelper.safeString(json['flat_number']),
      buildingName: NullSafetyHelper.safeString(json['building_name']),
      estateName: NullSafetyHelper.safeString(json['estate_name']),
      city: NullSafetyHelper.safeString(json['city']),
      state: NullSafetyHelper.safeString(json['state']),
      postalCode: NullSafetyHelper.safeString(json['postal_code']),
      skipDuplicateCheck: NullSafetyHelper.safeString(json['skip_duplicate_check']),
      duplicateAction: NullSafetyHelper.safeString(json['duplicate_action']),
      country: NullSafetyHelper.safeString(json['country']),
      latitude: NullSafetyHelper.safeString(json['latitude']),
      longitude: NullSafetyHelper.safeString(json['longitude']),
      landmarkDescription: NullSafetyHelper.safeString(json['landmark_description']),
      estateId: NullSafetyHelper.safeInt(json['estate_id']),
      createdBy: NullSafetyHelper.safeInt(json['created_by']),
      isActive: NullSafetyHelper.safeBool(json['is_active']),
      additionalInfo: NullSafetyHelper.safeList<dynamic>(json['additional_info']),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
      updatedAt: NullSafetyHelper.safeString(json['updated_at']),
    );
  }

  factory EstateAddressModel.empty() => const EstateAddressModel(
        id: null,
        addressType: null,
        streetNumber: null,
        streetName: null,
        blockNumber: null,
        flatNumber: null,
        buildingName: null,
        estateName: null,
        city: null,
        state: null,
        postalCode: null,
        skipDuplicateCheck: null,
        duplicateAction: null,
        country: null,
        latitude: null,
        longitude: null,
        landmarkDescription: null,
        estateId: null,
        createdBy: null,
        isActive: null,
        additionalInfo: null,
        createdAt: null,
        updatedAt: null,
      );
}