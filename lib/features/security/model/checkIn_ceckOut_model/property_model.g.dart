// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertyModelImpl _$$PropertyModelImplFromJson(Map<String, dynamic> json) =>
    _$PropertyModelImpl(
      id: (json['id'] as num?)?.toInt(),
      estateId: (json['estate_id'] as num?)?.toInt(),
      landlordId: (json['landlord_id'] as num?)?.toInt(),
      managerId: (json['manager_id'] as num?)?.toInt(),
      estateAddressId: (json['estate_address_id'] as num?)?.toInt(),
      propertyCode: json['property_code'] as String?,
      propertyName: json['property_name'] as String?,
      propertyType: json['property_type'] as String?,
      imageUrl: json['image_url'] as String?,
      imageKey: json['image_key'] as String?,
      bedrooms: (json['bedrooms'] as num?)?.toInt(),
      bathrooms: (json['bathrooms'] as num?)?.toInt(),
      size: json['size'] as String?,
      description: json['description'] as String?,
      specialFeatures: json['special_features'] as String?,
      rentalAmount: json['rental_amount'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      condition: json['condition'] as String?,
      rentalFrequency: json['rental_frequency'] as String?,
      amenities: (json['amenities'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      utilityConnections: json['utility_connections'] as Map<String, dynamic>?,
      images: json['images'] as List<dynamic>?,
      parkingSpaces: (json['parking_spaces'] as num?)?.toInt(),
      status: json['status'] as String?,
      smokingAllowed: (json['smoking_allowed'] as num?)?.toInt(),
      isFurnished: json['is_furnished'] as bool?,
      maxOccupants: (json['max_occupants'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      estateAddress: json['estate_address'] == null
          ? null
          : EstateAddressModel.fromJson(
              json['estate_address'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PropertyModelImplToJson(_$PropertyModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'estate_id': instance.estateId,
      'landlord_id': instance.landlordId,
      'manager_id': instance.managerId,
      'estate_address_id': instance.estateAddressId,
      'property_code': instance.propertyCode,
      'property_name': instance.propertyName,
      'property_type': instance.propertyType,
      'image_url': instance.imageUrl,
      'image_key': instance.imageKey,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'size': instance.size,
      'description': instance.description,
      'special_features': instance.specialFeatures,
      'rental_amount': instance.rentalAmount,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'condition': instance.condition,
      'rental_frequency': instance.rentalFrequency,
      'amenities': instance.amenities,
      'utility_connections': instance.utilityConnections,
      'images': instance.images,
      'parking_spaces': instance.parkingSpaces,
      'status': instance.status,
      'smoking_allowed': instance.smokingAllowed,
      'is_furnished': instance.isFurnished,
      'max_occupants': instance.maxOccupants,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'estate_address': instance.estateAddress?.toJson(),
    };
