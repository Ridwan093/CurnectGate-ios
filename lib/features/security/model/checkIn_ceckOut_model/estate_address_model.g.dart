// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstateAddressModelImpl _$$EstateAddressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$EstateAddressModelImpl(
      id: (json['id'] as num?)?.toInt(),
      addressType: json['address_type'] as String?,
      streetNumber: json['street_number'] as String?,
      streetName: json['street_name'] as String?,
      blockNumber: json['block_number'] as String?,
      flatNumber: json['flat_number'] as String?,
      buildingName: json['building_name'] as String?,
      estateName: json['estate_name'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postal_code'] as String?,
      skipDuplicateCheck: json['skip_duplicate_check'] as String?,
      duplicateAction: json['duplicate_action'] as String?,
      country: json['country'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      landmarkDescription: json['landmark_description'] as String?,
      estateId: (json['estate_id'] as num?)?.toInt(),
      createdBy: (json['created_by'] as num?)?.toInt(),
      isActive: json['is_active'] as bool?,
      additionalInfo: json['additional_info'] as List<dynamic>?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$EstateAddressModelImplToJson(
        _$EstateAddressModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address_type': instance.addressType,
      'street_number': instance.streetNumber,
      'street_name': instance.streetName,
      'block_number': instance.blockNumber,
      'flat_number': instance.flatNumber,
      'building_name': instance.buildingName,
      'estate_name': instance.estateName,
      'city': instance.city,
      'state': instance.state,
      'postal_code': instance.postalCode,
      'skip_duplicate_check': instance.skipDuplicateCheck,
      'duplicate_action': instance.duplicateAction,
      'country': instance.country,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'landmark_description': instance.landmarkDescription,
      'estate_id': instance.estateId,
      'created_by': instance.createdBy,
      'is_active': instance.isActive,
      'additional_info': instance.additionalInfo,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
