// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PropertyImpl _$$PropertyImplFromJson(Map<String, dynamic> json) =>
    _$PropertyImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      propertyCode: json['property_code'] as String? ?? '',
      propertyName: json['property_name'] as String? ?? '',
      propertyType: json['property_type'] as String? ?? '',
      address: json['address'] as String?,
      bedrooms: (json['bedrooms'] as num?)?.toInt() ?? 0,
      bathrooms: (json['bathrooms'] as num?)?.toInt() ?? 0,
      size: json['size'] as String? ?? '0',
      formattedSize: json['formatted_size'] as String?,
      description: json['description'] as String?,
      rentalAmount: json['rental_amount'] as String? ?? '0',
      formattedRentalAmount: json['formatted_rental_amount'] as String?,
      rentalFrequency: json['rental_frequency'] as String? ?? 'monthly',
      monthlyRent: (json['monthly_rent'] as num?)?.toDouble() ?? 0,
      annualRent: (json['annual_rent'] as num?)?.toDouble() ?? 0,
      amenities: (json['amenities'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      images: json['images'] as List<dynamic>? ?? const [],
      status: json['status'] as String? ?? '',
      statusBadge: json['status_badge'] as String? ?? '',
      isFurnished: json['is_furnished'] as bool? ?? false,
      maxOccupants: (json['max_occupants'] as num?)?.toInt() ?? 0,
      isAvailable: json['is_available'] as bool? ?? false,
      isOccupied: json['is_occupied'] as bool? ?? false,
      inMaintenance: json['in_maintenance'] as bool? ?? false,
      isReserved: json['is_reserved'] as bool? ?? false,
      hasActiveRental: json['has_active_rental'] as bool? ?? false,
      estate: json['estate'] == null
          ? null
          : Estate.fromJson(json['estate'] as Map<String, dynamic>),
      currentTenant: json['current_tenant'],
      activeRentals: (json['active_rentals'] as List<dynamic>?)
              ?.map((e) => Rental.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      createdAt: json['created_at'] as String? ?? '',
      updatedAt: json['updated_at'] as String? ?? '',
      rentalYield: (json['rental_yield'] as num?)?.toDouble() ?? 0,
      availabilityStatus: json['availability_status'] == null
          ? null
          : AvailabilityStatus.fromJson(
              json['availability_status'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PropertyImplToJson(_$PropertyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'property_code': instance.propertyCode,
      'property_name': instance.propertyName,
      'property_type': instance.propertyType,
      'address': instance.address,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'size': instance.size,
      'formatted_size': instance.formattedSize,
      'description': instance.description,
      'rental_amount': instance.rentalAmount,
      'formatted_rental_amount': instance.formattedRentalAmount,
      'rental_frequency': instance.rentalFrequency,
      'monthly_rent': instance.monthlyRent,
      'annual_rent': instance.annualRent,
      'amenities': instance.amenities,
      'images': instance.images,
      'status': instance.status,
      'status_badge': instance.statusBadge,
      'is_furnished': instance.isFurnished,
      'max_occupants': instance.maxOccupants,
      'is_available': instance.isAvailable,
      'is_occupied': instance.isOccupied,
      'in_maintenance': instance.inMaintenance,
      'is_reserved': instance.isReserved,
      'has_active_rental': instance.hasActiveRental,
      'estate': instance.estate?.toJson(),
      'current_tenant': instance.currentTenant,
      'active_rentals': instance.activeRentals.map((e) => e.toJson()).toList(),
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'rental_yield': instance.rentalYield,
      'availability_status': instance.availabilityStatus?.toJson(),
    };
