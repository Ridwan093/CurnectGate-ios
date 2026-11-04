import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'property.freezed.dart';
part 'property.g.dart';

@freezed
class Property with _$Property {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Property({
    int? id,
    int? estateId,
    int? landlordId,
    int? managerId,
    int? estateAddressId,
    String? propertyCode,
    String? propertyName,
    String? propertyType,
    String? imageUrl,
    String? imageKey,
    int? bedrooms,
    int? bathrooms,
    String? size,
    String? description,
    dynamic specialFeatures,
    String? rentalAmount,
    double? latitude,
    double? longitude,
    String? condition,
    String? rentalFrequency,
    List<String>? amenities,
    dynamic utilityConnections,
    dynamic images,
    int? parkingSpaces,
    String? status,
    int? smokingAllowed,
    bool? isFurnished,
    int? maxOccupants,
    String? createdAt,
    String? updatedAt,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  factory Property.safeFromJson(Map<String, dynamic>? json) {
    return Property(
      id: NullSafetyHelper.safeInt(json?['id']),
      estateId: NullSafetyHelper.safeInt(json?['estate_id']),
      landlordId: NullSafetyHelper.safeInt(json?['landlord_id']),
      managerId: NullSafetyHelper.safeInt(json?['manager_id']),
      estateAddressId: NullSafetyHelper.safeInt(json?['estate_address_id']),
      propertyCode: NullSafetyHelper.safeString(json?['property_code']),
      propertyName: NullSafetyHelper.safeString(json?['property_name']),
      propertyType: NullSafetyHelper.safeString(json?['property_type']),
      imageUrl: NullSafetyHelper.safeString(json?['image_url']),
      imageKey: NullSafetyHelper.safeString(json?['image_key']),
      bedrooms: NullSafetyHelper.safeInt(json?['bedrooms']),
      bathrooms: NullSafetyHelper.safeInt(json?['bathrooms']),
      size: NullSafetyHelper.safeString(json?['size']),
      description: NullSafetyHelper.safeString(json?['description']),
      specialFeatures: json?['special_features'],
      rentalAmount: NullSafetyHelper.safeString(json?['rental_amount']),
      latitude: NullSafetyHelper.safeDouble(json?['latitude']),
      longitude: NullSafetyHelper.safeDouble(json?['longitude']),
      condition: NullSafetyHelper.safeString(json?['condition']),
      rentalFrequency: NullSafetyHelper.safeString(json?['rental_frequency']),
      amenities:
          (NullSafetyHelper.safeList(
            json?['amenities'],
          )).map((e) => e.toString()).toList(),
      utilityConnections: json?['utility_connections'],
      images: json?['images'],
      parkingSpaces: NullSafetyHelper.safeInt(json?['parking_spaces']),
      status: NullSafetyHelper.safeString(json?['status']),
      smokingAllowed: NullSafetyHelper.safeInt(json?['smoking_allowed']),
      isFurnished: NullSafetyHelper.safeBool(json?['is_furnished']),
      maxOccupants: NullSafetyHelper.safeInt(json?['max_occupants']),
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
    );
  }

  factory Property.empty() => const Property(
    id: 0,
    estateId: 0,
    landlordId: 0,
    managerId: 0,
    estateAddressId: 0,
    propertyCode: '',
    propertyName: '',
    propertyType: '',
    imageUrl: '',
    imageKey: '',
    bedrooms: 0,
    bathrooms: 0,
    size: '',
    description: '',
    specialFeatures: null,
    rentalAmount: '0.00',
    latitude: 0,
    longitude: 0,
    condition: '',
    rentalFrequency: '',
    amenities: [],
    utilityConnections: null,
    images: null,
    parkingSpaces: 0,
    status: '',
    smokingAllowed: 0,
    isFurnished: false,
    maxOccupants: 0,
    createdAt: '',
    updatedAt: '',
  );
}
