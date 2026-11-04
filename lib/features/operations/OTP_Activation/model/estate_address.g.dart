// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstateAddressImpl _$$EstateAddressImplFromJson(Map<String, dynamic> json) =>
    _$EstateAddressImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      addressType: json['address_type'] as String? ?? '',
      streetNumber: json['street_number'] as String? ?? '',
      streetName: json['street_name'] as String? ?? '',
      blockNumber: json['block_number'] as String? ?? '',
      flatNumber: json['flat_number'] as String? ?? '',
      buildingName: json['building_name'] as String? ?? '',
      estateName: json['estate_name'] as String? ?? '',
      city: json['city'] as String? ?? '',
      state: json['state'] as String? ?? '',
      postalCode: json['postal_code'] as String?,
      skipDuplicateCheck: json['skip_duplicate_check'],
      duplicateAction: json['duplicate_action'],
      country: json['country'] as String? ?? '',
      latitude: json['latitude'] as String? ?? '0',
      longitude: json['longitude'] as String? ?? '0',
      landmarkDescription: json['landmark_description'] as String? ?? '',
      estateId: (json['estate_id'] as num?)?.toInt() ?? 0,
      createdBy: (json['created_by'] as num?)?.toInt() ?? 0,
      isActive: json['is_active'] as bool? ?? true,
      additionalInfo: json['additional_info'] as List<dynamic>? ?? const [],
      createdAt: NullSafetyHelper.safeDateTime(json['created_at']),
      updatedAt: NullSafetyHelper.safeDateTime(json['updated_at']),
    );

Map<String, dynamic> _$$EstateAddressImplToJson(_$EstateAddressImpl instance) =>
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
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
