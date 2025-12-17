import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'availability_status.dart';
import 'estate.dart';
import 'rental.dart';

part 'property.freezed.dart';
part 'property.g.dart';

@freezed
class Property with _$Property {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Property({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'property_code') required String propertyCode,
    @JsonKey(name: 'property_name') required String propertyName,
    @JsonKey(name: 'property_type') required String propertyType,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'bedrooms') required int bedrooms,
    @JsonKey(name: 'bathrooms') required int bathrooms,
    @JsonKey(name: 'size') required String size,
    @JsonKey(name: 'formatted_size') String? formattedSize,
    @JsonKey(name: 'description') required String? description,
    @JsonKey(name: 'rental_amount') required String rentalAmount,
    @JsonKey(name: 'formatted_rental_amount') String? formattedRentalAmount,
    @JsonKey(name: 'rental_frequency') required String rentalFrequency,
    @JsonKey(name: 'monthly_rent') required double monthlyRent,
    @JsonKey(name: 'annual_rent') required double annualRent,
    @JsonKey(name: 'amenities') required List<String> amenities,
    @JsonKey(name: 'images') required List<dynamic> images,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'status_badge') required String statusBadge,
    @JsonKey(name: 'is_furnished') required bool isFurnished,
    @JsonKey(name: 'max_occupants') required int maxOccupants,
    @JsonKey(name: 'is_available') required bool isAvailable,
    @JsonKey(name: 'is_occupied') required bool isOccupied,
    @JsonKey(name: 'in_maintenance') required bool inMaintenance,
    @JsonKey(name: 'is_reserved') required bool isReserved,
    @JsonKey(name: 'has_active_rental') required bool hasActiveRental,
    @JsonKey(name: 'estate') required Estate estate,
    @JsonKey(name: 'current_tenant') dynamic currentTenant,
    @JsonKey(name: 'active_rentals') required List<Rental> activeRentals,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'rental_yield') required double rentalYield,
    @JsonKey(name: 'availability_status')
    required AvailabilityStatus availabilityStatus,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  factory Property.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Property(
        id: 0,
        propertyCode: '',
        propertyName: '',
        propertyType: '',
        address: null,
        bedrooms: 0,
        bathrooms: 0,
        size: '0',
        formattedSize: null,
        description: '',
        rentalAmount: '0',
        formattedRentalAmount: null,
        rentalFrequency: 'monthly',
        monthlyRent: 0,
        annualRent: 0,
        amenities: [],
        images: [],
        status: '',
        statusBadge: '',
        isFurnished: false,
        maxOccupants: 0,
        isAvailable: false,
        isOccupied: false,
        inMaintenance: false,
        isReserved: false,
        hasActiveRental: false,
        estate: Estate.safeFromJson(null),
        currentTenant: null,
        activeRentals: [],
        createdAt: '',
        updatedAt: '',
        rentalYield: 0,
        availabilityStatus: AvailabilityStatus.safeFromJson(null),
      );
    }

    return Property(
      id: NullSafetyHelper.safeInt(json['id']),
      propertyCode: NullSafetyHelper.safeString(json['property_code']),
      propertyName: NullSafetyHelper.safeString(json['property_name']),
      propertyType: NullSafetyHelper.safeString(json['property_type']),
      address: json['address'] as String?,
      bedrooms: NullSafetyHelper.safeInt(json['bedrooms']),
      bathrooms: NullSafetyHelper.safeInt(json['bathrooms']),
      size: NullSafetyHelper.safeString(json['size']),
      formattedSize: json['formatted_size'] as String?,
      description: NullSafetyHelper.safeString(json['description']) as String?,
      rentalAmount: NullSafetyHelper.safeString(json['rental_amount']),
      formattedRentalAmount: json['formatted_rental_amount'] as String?,
      rentalFrequency: NullSafetyHelper.safeString(json['rental_frequency']),
      monthlyRent: NullSafetyHelper.safeDouble(json['monthly_rent']),
      annualRent: NullSafetyHelper.safeDouble(json['annual_rent']),
      amenities:
          (json['amenities'] as List<dynamic>? ?? [])
              .map((e) => e.toString())
              .toList(),
      images: json['images'] as List<dynamic>? ?? [],
      status: NullSafetyHelper.safeString(json['status']),
      statusBadge: NullSafetyHelper.safeString(json['status_badge']),
      isFurnished: NullSafetyHelper.safeBool(json['is_furnished']),
      maxOccupants: NullSafetyHelper.safeInt(json['max_occupants']),
      isAvailable: NullSafetyHelper.safeBool(json['is_available']),
      isOccupied: NullSafetyHelper.safeBool(json['is_occupied']),
      inMaintenance: NullSafetyHelper.safeBool(json['in_maintenance']),
      isReserved: NullSafetyHelper.safeBool(json['is_reserved']),
      hasActiveRental: NullSafetyHelper.safeBool(json['has_active_rental']),
      estate: Estate.safeFromJson(json['estate']),
      currentTenant: json['current_tenant'],
      activeRentals:
          (json['active_rentals'] as List<dynamic>? ?? [])
              .map((e) => Rental.safeFromJson(e))
              .toList(),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
      updatedAt: NullSafetyHelper.safeString(json['updated_at']),
      rentalYield: NullSafetyHelper.safeDouble(json['rental_yield']),
      availabilityStatus: AvailabilityStatus.safeFromJson(
        json['availability_status'],
      ),
    );
  }
}
