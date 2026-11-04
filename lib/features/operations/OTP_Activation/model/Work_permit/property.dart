import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'estate_address.dart';

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
    String? specialFeatures,
    String? rentalAmount,
    String? latitude,
    String? longitude,
    String? condition,
    String? rentalFrequency,
    List<String>? amenities,
    Map<String, dynamic>? utilityConnections,
    List<dynamic>? images,
    int? parkingSpaces,
    String? status,
    int? smokingAllowed,
    bool? isFurnished,
    int? maxOccupants,
    String? createdAt,
    String? updatedAt,
    EstateAddress? estateAddress,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  factory Property.fromSafeJson(Map<String, dynamic>? json) {
    if (json == null) return Property.empty();
    return Property(
      id: NullSafetyHelper.safeInt(json['id']),
      estateId: NullSafetyHelper.safeInt(json['estate_id']),
      landlordId: NullSafetyHelper.safeInt(json['landlord_id']),
      managerId: NullSafetyHelper.safeInt(json['manager_id']),
      estateAddressId: NullSafetyHelper.safeInt(json['estate_address_id']),
      propertyCode: NullSafetyHelper.safeString(json['property_code']),
      propertyName: NullSafetyHelper.safeString(json['property_name']),
      propertyType: NullSafetyHelper.safeString(json['property_type']),
      imageUrl: NullSafetyHelper.safeString(json['image_url']),
      imageKey: NullSafetyHelper.safeString(json['image_key']),
      bedrooms: NullSafetyHelper.safeInt(json['bedrooms']),
      bathrooms: NullSafetyHelper.safeInt(json['bathrooms']),
      size: NullSafetyHelper.safeString(json['size']),
      description: NullSafetyHelper.safeString(json['description']),
      specialFeatures: NullSafetyHelper.safeString(json['special_features']),
      rentalAmount: NullSafetyHelper.safeString(json['rental_amount']),
      latitude: NullSafetyHelper.safeString(json['latitude']),
      longitude: NullSafetyHelper.safeString(json['longitude']),
      condition: NullSafetyHelper.safeString(json['condition']),
      rentalFrequency: NullSafetyHelper.safeString(json['rental_frequency']),
      amenities: NullSafetyHelper.safeStringList(json['amenities']),
      utilityConnections: NullSafetyHelper.safeMap(json['utility_connections']),
      images: NullSafetyHelper.safeList(json['images']),
      parkingSpaces: NullSafetyHelper.safeInt(json['parking_spaces']),
      status: NullSafetyHelper.safeString(json['status']),
      smokingAllowed: NullSafetyHelper.safeInt(json['smoking_allowed']),
      isFurnished: NullSafetyHelper.safeBool(json['is_furnished']),
      maxOccupants: NullSafetyHelper.safeInt(json['max_occupants']),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
      updatedAt: NullSafetyHelper.safeString(json['updated_at']),
      estateAddress: NullSafetyHelper.safeModel(
        json['estate_address'],
        EstateAddress.fromSafeJson,
        EstateAddress.empty(),
      ),
    );
  }

  factory Property.empty() => const Property(
        id: null,
        estateId: null,
        landlordId: null,
        managerId: null,
        estateAddressId: null,
        propertyCode: null,
        propertyName: null,
        propertyType: null,
        imageUrl: null,
        imageKey: null,
        bedrooms: null,
        bathrooms: null,
        size: null,
        description: null,
        specialFeatures: null,
        rentalAmount: null,
        latitude: null,
        longitude: null,
        condition: null,
        rentalFrequency: null,
        amenities: null,
        utilityConnections: null,
        images: null,
        parkingSpaces: null,
        status: null,
        smokingAllowed: null,
        isFurnished: null,
        maxOccupants: null,
        createdAt: null,
        updatedAt: null,
        estateAddress: null,
      );
}
