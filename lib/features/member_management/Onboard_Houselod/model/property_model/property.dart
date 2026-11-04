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
    @JsonKey(name: 'id') @Default(0) int id,
    @JsonKey(name: 'property_code') @Default('') String propertyCode,
    @JsonKey(name: 'property_name') @Default('') String propertyName,
    @JsonKey(name: 'property_type') @Default('') String propertyType,
    @JsonKey(name: 'address') String? address,
    @JsonKey(name: 'bedrooms') @Default(0) int bedrooms,
    @JsonKey(name: 'bathrooms') @Default(0) int bathrooms,
    @JsonKey(name: 'size') @Default('0') String size,
    @JsonKey(name: 'formatted_size') String? formattedSize,
    @JsonKey(name: 'description') String? description,
    @JsonKey(name: 'rental_amount') @Default('0') String rentalAmount,
    @JsonKey(name: 'formatted_rental_amount') String? formattedRentalAmount,
    @JsonKey(name: 'rental_frequency') @Default('monthly') String rentalFrequency,
    @JsonKey(name: 'monthly_rent') @Default(0) double monthlyRent,
    @JsonKey(name: 'annual_rent') @Default(0) double annualRent,
    @JsonKey(name: 'amenities') @Default([]) List<String> amenities,
    @JsonKey(name: 'images') @Default([]) List<dynamic> images,
    @JsonKey(name: 'status') @Default('') String status,
    @JsonKey(name: 'status_badge') @Default('') String statusBadge,
    @JsonKey(name: 'is_furnished') @Default(false) bool isFurnished,
    @JsonKey(name: 'max_occupants') @Default(0) int maxOccupants,
    @JsonKey(name: 'is_available') @Default(false) bool isAvailable,
    @JsonKey(name: 'is_occupied') @Default(false) bool isOccupied,
    @JsonKey(name: 'in_maintenance') @Default(false) bool inMaintenance,
    @JsonKey(name: 'is_reserved') @Default(false) bool isReserved,
    @JsonKey(name: 'has_active_rental') @Default(false) bool hasActiveRental,
    @JsonKey(name: 'estate') Estate? estate,
    @JsonKey(name: 'current_tenant') dynamic currentTenant,
    @JsonKey(name: 'active_rentals') @Default([]) List<Rental> activeRentals,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @JsonKey(name: 'updated_at') @Default('') String updatedAt,
    @JsonKey(name: 'rental_yield') @Default(0) double rentalYield,
    @JsonKey(name: 'availability_status')
    AvailabilityStatus? availabilityStatus,
  }) = _Property;

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  factory Property.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const Property();
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
      estate: json['estate'] != null ? Estate.safeFromJson(json['estate']) : null,
      currentTenant: json['current_tenant'],
      activeRentals:
          (json['active_rentals'] as List<dynamic>? ?? [])
              .map((e) => Rental.safeFromJson(e))
              .toList(),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
      updatedAt: NullSafetyHelper.safeString(json['updated_at']),
      rentalYield: NullSafetyHelper.safeDouble(json['rental_yield']),
      availabilityStatus: json['availability_status'] != null
          ? AvailabilityStatus.safeFromJson(json['availability_status'])
          : null,
    );
  }
}
