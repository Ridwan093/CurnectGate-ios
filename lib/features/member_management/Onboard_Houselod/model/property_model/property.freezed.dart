// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'property.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Property _$PropertyFromJson(Map<String, dynamic> json) {
  return _Property.fromJson(json);
}

/// @nodoc
mixin _$Property {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'property_code')
  String get propertyCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'property_name')
  String get propertyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'property_type')
  String get propertyType => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'bedrooms')
  int get bedrooms => throw _privateConstructorUsedError;
  @JsonKey(name: 'bathrooms')
  int get bathrooms => throw _privateConstructorUsedError;
  @JsonKey(name: 'size')
  String get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted_size')
  String? get formattedSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'rental_amount')
  String get rentalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted_rental_amount')
  String? get formattedRentalAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'rental_frequency')
  String get rentalFrequency => throw _privateConstructorUsedError;
  @JsonKey(name: 'monthly_rent')
  double get monthlyRent => throw _privateConstructorUsedError;
  @JsonKey(name: 'annual_rent')
  double get annualRent => throw _privateConstructorUsedError;
  @JsonKey(name: 'amenities')
  List<String> get amenities => throw _privateConstructorUsedError;
  @JsonKey(name: 'images')
  List<dynamic> get images => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_badge')
  String get statusBadge => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_furnished')
  bool get isFurnished => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_occupants')
  int get maxOccupants => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_available')
  bool get isAvailable => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_occupied')
  bool get isOccupied => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_maintenance')
  bool get inMaintenance => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_reserved')
  bool get isReserved => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_active_rental')
  bool get hasActiveRental => throw _privateConstructorUsedError;
  @JsonKey(name: 'estate')
  Estate? get estate => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_tenant')
  dynamic get currentTenant => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_rentals')
  List<Rental> get activeRentals => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  String get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'rental_yield')
  double get rentalYield => throw _privateConstructorUsedError;
  @JsonKey(name: 'availability_status')
  AvailabilityStatus? get availabilityStatus =>
      throw _privateConstructorUsedError;

  /// Serializes this Property to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PropertyCopyWith<Property> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PropertyCopyWith<$Res> {
  factory $PropertyCopyWith(Property value, $Res Function(Property) then) =
      _$PropertyCopyWithImpl<$Res, Property>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'property_code') String propertyCode,
      @JsonKey(name: 'property_name') String propertyName,
      @JsonKey(name: 'property_type') String propertyType,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'bedrooms') int bedrooms,
      @JsonKey(name: 'bathrooms') int bathrooms,
      @JsonKey(name: 'size') String size,
      @JsonKey(name: 'formatted_size') String? formattedSize,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'rental_amount') String rentalAmount,
      @JsonKey(name: 'formatted_rental_amount') String? formattedRentalAmount,
      @JsonKey(name: 'rental_frequency') String rentalFrequency,
      @JsonKey(name: 'monthly_rent') double monthlyRent,
      @JsonKey(name: 'annual_rent') double annualRent,
      @JsonKey(name: 'amenities') List<String> amenities,
      @JsonKey(name: 'images') List<dynamic> images,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'status_badge') String statusBadge,
      @JsonKey(name: 'is_furnished') bool isFurnished,
      @JsonKey(name: 'max_occupants') int maxOccupants,
      @JsonKey(name: 'is_available') bool isAvailable,
      @JsonKey(name: 'is_occupied') bool isOccupied,
      @JsonKey(name: 'in_maintenance') bool inMaintenance,
      @JsonKey(name: 'is_reserved') bool isReserved,
      @JsonKey(name: 'has_active_rental') bool hasActiveRental,
      @JsonKey(name: 'estate') Estate? estate,
      @JsonKey(name: 'current_tenant') dynamic currentTenant,
      @JsonKey(name: 'active_rentals') List<Rental> activeRentals,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'rental_yield') double rentalYield,
      @JsonKey(name: 'availability_status')
      AvailabilityStatus? availabilityStatus});

  $EstateCopyWith<$Res>? get estate;
  $AvailabilityStatusCopyWith<$Res>? get availabilityStatus;
}

/// @nodoc
class _$PropertyCopyWithImpl<$Res, $Val extends Property>
    implements $PropertyCopyWith<$Res> {
  _$PropertyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? propertyCode = null,
    Object? propertyName = null,
    Object? propertyType = null,
    Object? address = freezed,
    Object? bedrooms = null,
    Object? bathrooms = null,
    Object? size = null,
    Object? formattedSize = freezed,
    Object? description = freezed,
    Object? rentalAmount = null,
    Object? formattedRentalAmount = freezed,
    Object? rentalFrequency = null,
    Object? monthlyRent = null,
    Object? annualRent = null,
    Object? amenities = null,
    Object? images = null,
    Object? status = null,
    Object? statusBadge = null,
    Object? isFurnished = null,
    Object? maxOccupants = null,
    Object? isAvailable = null,
    Object? isOccupied = null,
    Object? inMaintenance = null,
    Object? isReserved = null,
    Object? hasActiveRental = null,
    Object? estate = freezed,
    Object? currentTenant = freezed,
    Object? activeRentals = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? rentalYield = null,
    Object? availabilityStatus = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      propertyCode: null == propertyCode
          ? _value.propertyCode
          : propertyCode // ignore: cast_nullable_to_non_nullable
              as String,
      propertyName: null == propertyName
          ? _value.propertyName
          : propertyName // ignore: cast_nullable_to_non_nullable
              as String,
      propertyType: null == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      bedrooms: null == bedrooms
          ? _value.bedrooms
          : bedrooms // ignore: cast_nullable_to_non_nullable
              as int,
      bathrooms: null == bathrooms
          ? _value.bathrooms
          : bathrooms // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      formattedSize: freezed == formattedSize
          ? _value.formattedSize
          : formattedSize // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      rentalAmount: null == rentalAmount
          ? _value.rentalAmount
          : rentalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      formattedRentalAmount: freezed == formattedRentalAmount
          ? _value.formattedRentalAmount
          : formattedRentalAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      rentalFrequency: null == rentalFrequency
          ? _value.rentalFrequency
          : rentalFrequency // ignore: cast_nullable_to_non_nullable
              as String,
      monthlyRent: null == monthlyRent
          ? _value.monthlyRent
          : monthlyRent // ignore: cast_nullable_to_non_nullable
              as double,
      annualRent: null == annualRent
          ? _value.annualRent
          : annualRent // ignore: cast_nullable_to_non_nullable
              as double,
      amenities: null == amenities
          ? _value.amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusBadge: null == statusBadge
          ? _value.statusBadge
          : statusBadge // ignore: cast_nullable_to_non_nullable
              as String,
      isFurnished: null == isFurnished
          ? _value.isFurnished
          : isFurnished // ignore: cast_nullable_to_non_nullable
              as bool,
      maxOccupants: null == maxOccupants
          ? _value.maxOccupants
          : maxOccupants // ignore: cast_nullable_to_non_nullable
              as int,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isOccupied: null == isOccupied
          ? _value.isOccupied
          : isOccupied // ignore: cast_nullable_to_non_nullable
              as bool,
      inMaintenance: null == inMaintenance
          ? _value.inMaintenance
          : inMaintenance // ignore: cast_nullable_to_non_nullable
              as bool,
      isReserved: null == isReserved
          ? _value.isReserved
          : isReserved // ignore: cast_nullable_to_non_nullable
              as bool,
      hasActiveRental: null == hasActiveRental
          ? _value.hasActiveRental
          : hasActiveRental // ignore: cast_nullable_to_non_nullable
              as bool,
      estate: freezed == estate
          ? _value.estate
          : estate // ignore: cast_nullable_to_non_nullable
              as Estate?,
      currentTenant: freezed == currentTenant
          ? _value.currentTenant
          : currentTenant // ignore: cast_nullable_to_non_nullable
              as dynamic,
      activeRentals: null == activeRentals
          ? _value.activeRentals
          : activeRentals // ignore: cast_nullable_to_non_nullable
              as List<Rental>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      rentalYield: null == rentalYield
          ? _value.rentalYield
          : rentalYield // ignore: cast_nullable_to_non_nullable
              as double,
      availabilityStatus: freezed == availabilityStatus
          ? _value.availabilityStatus
          : availabilityStatus // ignore: cast_nullable_to_non_nullable
              as AvailabilityStatus?,
    ) as $Val);
  }

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EstateCopyWith<$Res>? get estate {
    if (_value.estate == null) {
      return null;
    }

    return $EstateCopyWith<$Res>(_value.estate!, (value) {
      return _then(_value.copyWith(estate: value) as $Val);
    });
  }

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AvailabilityStatusCopyWith<$Res>? get availabilityStatus {
    if (_value.availabilityStatus == null) {
      return null;
    }

    return $AvailabilityStatusCopyWith<$Res>(_value.availabilityStatus!,
        (value) {
      return _then(_value.copyWith(availabilityStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PropertyImplCopyWith<$Res>
    implements $PropertyCopyWith<$Res> {
  factory _$$PropertyImplCopyWith(
          _$PropertyImpl value, $Res Function(_$PropertyImpl) then) =
      __$$PropertyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'property_code') String propertyCode,
      @JsonKey(name: 'property_name') String propertyName,
      @JsonKey(name: 'property_type') String propertyType,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'bedrooms') int bedrooms,
      @JsonKey(name: 'bathrooms') int bathrooms,
      @JsonKey(name: 'size') String size,
      @JsonKey(name: 'formatted_size') String? formattedSize,
      @JsonKey(name: 'description') String? description,
      @JsonKey(name: 'rental_amount') String rentalAmount,
      @JsonKey(name: 'formatted_rental_amount') String? formattedRentalAmount,
      @JsonKey(name: 'rental_frequency') String rentalFrequency,
      @JsonKey(name: 'monthly_rent') double monthlyRent,
      @JsonKey(name: 'annual_rent') double annualRent,
      @JsonKey(name: 'amenities') List<String> amenities,
      @JsonKey(name: 'images') List<dynamic> images,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'status_badge') String statusBadge,
      @JsonKey(name: 'is_furnished') bool isFurnished,
      @JsonKey(name: 'max_occupants') int maxOccupants,
      @JsonKey(name: 'is_available') bool isAvailable,
      @JsonKey(name: 'is_occupied') bool isOccupied,
      @JsonKey(name: 'in_maintenance') bool inMaintenance,
      @JsonKey(name: 'is_reserved') bool isReserved,
      @JsonKey(name: 'has_active_rental') bool hasActiveRental,
      @JsonKey(name: 'estate') Estate? estate,
      @JsonKey(name: 'current_tenant') dynamic currentTenant,
      @JsonKey(name: 'active_rentals') List<Rental> activeRentals,
      @JsonKey(name: 'created_at') String createdAt,
      @JsonKey(name: 'updated_at') String updatedAt,
      @JsonKey(name: 'rental_yield') double rentalYield,
      @JsonKey(name: 'availability_status')
      AvailabilityStatus? availabilityStatus});

  @override
  $EstateCopyWith<$Res>? get estate;
  @override
  $AvailabilityStatusCopyWith<$Res>? get availabilityStatus;
}

/// @nodoc
class __$$PropertyImplCopyWithImpl<$Res>
    extends _$PropertyCopyWithImpl<$Res, _$PropertyImpl>
    implements _$$PropertyImplCopyWith<$Res> {
  __$$PropertyImplCopyWithImpl(
      _$PropertyImpl _value, $Res Function(_$PropertyImpl) _then)
      : super(_value, _then);

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? propertyCode = null,
    Object? propertyName = null,
    Object? propertyType = null,
    Object? address = freezed,
    Object? bedrooms = null,
    Object? bathrooms = null,
    Object? size = null,
    Object? formattedSize = freezed,
    Object? description = freezed,
    Object? rentalAmount = null,
    Object? formattedRentalAmount = freezed,
    Object? rentalFrequency = null,
    Object? monthlyRent = null,
    Object? annualRent = null,
    Object? amenities = null,
    Object? images = null,
    Object? status = null,
    Object? statusBadge = null,
    Object? isFurnished = null,
    Object? maxOccupants = null,
    Object? isAvailable = null,
    Object? isOccupied = null,
    Object? inMaintenance = null,
    Object? isReserved = null,
    Object? hasActiveRental = null,
    Object? estate = freezed,
    Object? currentTenant = freezed,
    Object? activeRentals = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? rentalYield = null,
    Object? availabilityStatus = freezed,
  }) {
    return _then(_$PropertyImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      propertyCode: null == propertyCode
          ? _value.propertyCode
          : propertyCode // ignore: cast_nullable_to_non_nullable
              as String,
      propertyName: null == propertyName
          ? _value.propertyName
          : propertyName // ignore: cast_nullable_to_non_nullable
              as String,
      propertyType: null == propertyType
          ? _value.propertyType
          : propertyType // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      bedrooms: null == bedrooms
          ? _value.bedrooms
          : bedrooms // ignore: cast_nullable_to_non_nullable
              as int,
      bathrooms: null == bathrooms
          ? _value.bathrooms
          : bathrooms // ignore: cast_nullable_to_non_nullable
              as int,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as String,
      formattedSize: freezed == formattedSize
          ? _value.formattedSize
          : formattedSize // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      rentalAmount: null == rentalAmount
          ? _value.rentalAmount
          : rentalAmount // ignore: cast_nullable_to_non_nullable
              as String,
      formattedRentalAmount: freezed == formattedRentalAmount
          ? _value.formattedRentalAmount
          : formattedRentalAmount // ignore: cast_nullable_to_non_nullable
              as String?,
      rentalFrequency: null == rentalFrequency
          ? _value.rentalFrequency
          : rentalFrequency // ignore: cast_nullable_to_non_nullable
              as String,
      monthlyRent: null == monthlyRent
          ? _value.monthlyRent
          : monthlyRent // ignore: cast_nullable_to_non_nullable
              as double,
      annualRent: null == annualRent
          ? _value.annualRent
          : annualRent // ignore: cast_nullable_to_non_nullable
              as double,
      amenities: null == amenities
          ? _value._amenities
          : amenities // ignore: cast_nullable_to_non_nullable
              as List<String>,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      statusBadge: null == statusBadge
          ? _value.statusBadge
          : statusBadge // ignore: cast_nullable_to_non_nullable
              as String,
      isFurnished: null == isFurnished
          ? _value.isFurnished
          : isFurnished // ignore: cast_nullable_to_non_nullable
              as bool,
      maxOccupants: null == maxOccupants
          ? _value.maxOccupants
          : maxOccupants // ignore: cast_nullable_to_non_nullable
              as int,
      isAvailable: null == isAvailable
          ? _value.isAvailable
          : isAvailable // ignore: cast_nullable_to_non_nullable
              as bool,
      isOccupied: null == isOccupied
          ? _value.isOccupied
          : isOccupied // ignore: cast_nullable_to_non_nullable
              as bool,
      inMaintenance: null == inMaintenance
          ? _value.inMaintenance
          : inMaintenance // ignore: cast_nullable_to_non_nullable
              as bool,
      isReserved: null == isReserved
          ? _value.isReserved
          : isReserved // ignore: cast_nullable_to_non_nullable
              as bool,
      hasActiveRental: null == hasActiveRental
          ? _value.hasActiveRental
          : hasActiveRental // ignore: cast_nullable_to_non_nullable
              as bool,
      estate: freezed == estate
          ? _value.estate
          : estate // ignore: cast_nullable_to_non_nullable
              as Estate?,
      currentTenant: freezed == currentTenant
          ? _value.currentTenant
          : currentTenant // ignore: cast_nullable_to_non_nullable
              as dynamic,
      activeRentals: null == activeRentals
          ? _value._activeRentals
          : activeRentals // ignore: cast_nullable_to_non_nullable
              as List<Rental>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String,
      rentalYield: null == rentalYield
          ? _value.rentalYield
          : rentalYield // ignore: cast_nullable_to_non_nullable
              as double,
      availabilityStatus: freezed == availabilityStatus
          ? _value.availabilityStatus
          : availabilityStatus // ignore: cast_nullable_to_non_nullable
              as AvailabilityStatus?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class _$PropertyImpl implements _Property {
  const _$PropertyImpl(
      {@JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'property_code') this.propertyCode = '',
      @JsonKey(name: 'property_name') this.propertyName = '',
      @JsonKey(name: 'property_type') this.propertyType = '',
      @JsonKey(name: 'address') this.address,
      @JsonKey(name: 'bedrooms') this.bedrooms = 0,
      @JsonKey(name: 'bathrooms') this.bathrooms = 0,
      @JsonKey(name: 'size') this.size = '0',
      @JsonKey(name: 'formatted_size') this.formattedSize,
      @JsonKey(name: 'description') this.description,
      @JsonKey(name: 'rental_amount') this.rentalAmount = '0',
      @JsonKey(name: 'formatted_rental_amount') this.formattedRentalAmount,
      @JsonKey(name: 'rental_frequency') this.rentalFrequency = 'monthly',
      @JsonKey(name: 'monthly_rent') this.monthlyRent = 0,
      @JsonKey(name: 'annual_rent') this.annualRent = 0,
      @JsonKey(name: 'amenities') final List<String> amenities = const [],
      @JsonKey(name: 'images') final List<dynamic> images = const [],
      @JsonKey(name: 'status') this.status = '',
      @JsonKey(name: 'status_badge') this.statusBadge = '',
      @JsonKey(name: 'is_furnished') this.isFurnished = false,
      @JsonKey(name: 'max_occupants') this.maxOccupants = 0,
      @JsonKey(name: 'is_available') this.isAvailable = false,
      @JsonKey(name: 'is_occupied') this.isOccupied = false,
      @JsonKey(name: 'in_maintenance') this.inMaintenance = false,
      @JsonKey(name: 'is_reserved') this.isReserved = false,
      @JsonKey(name: 'has_active_rental') this.hasActiveRental = false,
      @JsonKey(name: 'estate') this.estate,
      @JsonKey(name: 'current_tenant') this.currentTenant,
      @JsonKey(name: 'active_rentals')
      final List<Rental> activeRentals = const [],
      @JsonKey(name: 'created_at') this.createdAt = '',
      @JsonKey(name: 'updated_at') this.updatedAt = '',
      @JsonKey(name: 'rental_yield') this.rentalYield = 0,
      @JsonKey(name: 'availability_status') this.availabilityStatus})
      : _amenities = amenities,
        _images = images,
        _activeRentals = activeRentals;

  factory _$PropertyImpl.fromJson(Map<String, dynamic> json) =>
      _$$PropertyImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'property_code')
  final String propertyCode;
  @override
  @JsonKey(name: 'property_name')
  final String propertyName;
  @override
  @JsonKey(name: 'property_type')
  final String propertyType;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'bedrooms')
  final int bedrooms;
  @override
  @JsonKey(name: 'bathrooms')
  final int bathrooms;
  @override
  @JsonKey(name: 'size')
  final String size;
  @override
  @JsonKey(name: 'formatted_size')
  final String? formattedSize;
  @override
  @JsonKey(name: 'description')
  final String? description;
  @override
  @JsonKey(name: 'rental_amount')
  final String rentalAmount;
  @override
  @JsonKey(name: 'formatted_rental_amount')
  final String? formattedRentalAmount;
  @override
  @JsonKey(name: 'rental_frequency')
  final String rentalFrequency;
  @override
  @JsonKey(name: 'monthly_rent')
  final double monthlyRent;
  @override
  @JsonKey(name: 'annual_rent')
  final double annualRent;
  final List<String> _amenities;
  @override
  @JsonKey(name: 'amenities')
  List<String> get amenities {
    if (_amenities is EqualUnmodifiableListView) return _amenities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_amenities);
  }

  final List<dynamic> _images;
  @override
  @JsonKey(name: 'images')
  List<dynamic> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'status_badge')
  final String statusBadge;
  @override
  @JsonKey(name: 'is_furnished')
  final bool isFurnished;
  @override
  @JsonKey(name: 'max_occupants')
  final int maxOccupants;
  @override
  @JsonKey(name: 'is_available')
  final bool isAvailable;
  @override
  @JsonKey(name: 'is_occupied')
  final bool isOccupied;
  @override
  @JsonKey(name: 'in_maintenance')
  final bool inMaintenance;
  @override
  @JsonKey(name: 'is_reserved')
  final bool isReserved;
  @override
  @JsonKey(name: 'has_active_rental')
  final bool hasActiveRental;
  @override
  @JsonKey(name: 'estate')
  final Estate? estate;
  @override
  @JsonKey(name: 'current_tenant')
  final dynamic currentTenant;
  final List<Rental> _activeRentals;
  @override
  @JsonKey(name: 'active_rentals')
  List<Rental> get activeRentals {
    if (_activeRentals is EqualUnmodifiableListView) return _activeRentals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activeRentals);
  }

  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @override
  @JsonKey(name: 'rental_yield')
  final double rentalYield;
  @override
  @JsonKey(name: 'availability_status')
  final AvailabilityStatus? availabilityStatus;

  @override
  String toString() {
    return 'Property(id: $id, propertyCode: $propertyCode, propertyName: $propertyName, propertyType: $propertyType, address: $address, bedrooms: $bedrooms, bathrooms: $bathrooms, size: $size, formattedSize: $formattedSize, description: $description, rentalAmount: $rentalAmount, formattedRentalAmount: $formattedRentalAmount, rentalFrequency: $rentalFrequency, monthlyRent: $monthlyRent, annualRent: $annualRent, amenities: $amenities, images: $images, status: $status, statusBadge: $statusBadge, isFurnished: $isFurnished, maxOccupants: $maxOccupants, isAvailable: $isAvailable, isOccupied: $isOccupied, inMaintenance: $inMaintenance, isReserved: $isReserved, hasActiveRental: $hasActiveRental, estate: $estate, currentTenant: $currentTenant, activeRentals: $activeRentals, createdAt: $createdAt, updatedAt: $updatedAt, rentalYield: $rentalYield, availabilityStatus: $availabilityStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PropertyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.propertyCode, propertyCode) ||
                other.propertyCode == propertyCode) &&
            (identical(other.propertyName, propertyName) ||
                other.propertyName == propertyName) &&
            (identical(other.propertyType, propertyType) ||
                other.propertyType == propertyType) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.bedrooms, bedrooms) ||
                other.bedrooms == bedrooms) &&
            (identical(other.bathrooms, bathrooms) ||
                other.bathrooms == bathrooms) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.formattedSize, formattedSize) ||
                other.formattedSize == formattedSize) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.rentalAmount, rentalAmount) ||
                other.rentalAmount == rentalAmount) &&
            (identical(other.formattedRentalAmount, formattedRentalAmount) ||
                other.formattedRentalAmount == formattedRentalAmount) &&
            (identical(other.rentalFrequency, rentalFrequency) ||
                other.rentalFrequency == rentalFrequency) &&
            (identical(other.monthlyRent, monthlyRent) ||
                other.monthlyRent == monthlyRent) &&
            (identical(other.annualRent, annualRent) ||
                other.annualRent == annualRent) &&
            const DeepCollectionEquality()
                .equals(other._amenities, _amenities) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.statusBadge, statusBadge) ||
                other.statusBadge == statusBadge) &&
            (identical(other.isFurnished, isFurnished) ||
                other.isFurnished == isFurnished) &&
            (identical(other.maxOccupants, maxOccupants) ||
                other.maxOccupants == maxOccupants) &&
            (identical(other.isAvailable, isAvailable) ||
                other.isAvailable == isAvailable) &&
            (identical(other.isOccupied, isOccupied) ||
                other.isOccupied == isOccupied) &&
            (identical(other.inMaintenance, inMaintenance) ||
                other.inMaintenance == inMaintenance) &&
            (identical(other.isReserved, isReserved) ||
                other.isReserved == isReserved) &&
            (identical(other.hasActiveRental, hasActiveRental) ||
                other.hasActiveRental == hasActiveRental) &&
            (identical(other.estate, estate) || other.estate == estate) &&
            const DeepCollectionEquality()
                .equals(other.currentTenant, currentTenant) &&
            const DeepCollectionEquality()
                .equals(other._activeRentals, _activeRentals) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.rentalYield, rentalYield) ||
                other.rentalYield == rentalYield) &&
            (identical(other.availabilityStatus, availabilityStatus) ||
                other.availabilityStatus == availabilityStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        propertyCode,
        propertyName,
        propertyType,
        address,
        bedrooms,
        bathrooms,
        size,
        formattedSize,
        description,
        rentalAmount,
        formattedRentalAmount,
        rentalFrequency,
        monthlyRent,
        annualRent,
        const DeepCollectionEquality().hash(_amenities),
        const DeepCollectionEquality().hash(_images),
        status,
        statusBadge,
        isFurnished,
        maxOccupants,
        isAvailable,
        isOccupied,
        inMaintenance,
        isReserved,
        hasActiveRental,
        estate,
        const DeepCollectionEquality().hash(currentTenant),
        const DeepCollectionEquality().hash(_activeRentals),
        createdAt,
        updatedAt,
        rentalYield,
        availabilityStatus
      ]);

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PropertyImplCopyWith<_$PropertyImpl> get copyWith =>
      __$$PropertyImplCopyWithImpl<_$PropertyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PropertyImplToJson(
      this,
    );
  }
}

abstract class _Property implements Property {
  const factory _Property(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'property_code') final String propertyCode,
      @JsonKey(name: 'property_name') final String propertyName,
      @JsonKey(name: 'property_type') final String propertyType,
      @JsonKey(name: 'address') final String? address,
      @JsonKey(name: 'bedrooms') final int bedrooms,
      @JsonKey(name: 'bathrooms') final int bathrooms,
      @JsonKey(name: 'size') final String size,
      @JsonKey(name: 'formatted_size') final String? formattedSize,
      @JsonKey(name: 'description') final String? description,
      @JsonKey(name: 'rental_amount') final String rentalAmount,
      @JsonKey(name: 'formatted_rental_amount')
      final String? formattedRentalAmount,
      @JsonKey(name: 'rental_frequency') final String rentalFrequency,
      @JsonKey(name: 'monthly_rent') final double monthlyRent,
      @JsonKey(name: 'annual_rent') final double annualRent,
      @JsonKey(name: 'amenities') final List<String> amenities,
      @JsonKey(name: 'images') final List<dynamic> images,
      @JsonKey(name: 'status') final String status,
      @JsonKey(name: 'status_badge') final String statusBadge,
      @JsonKey(name: 'is_furnished') final bool isFurnished,
      @JsonKey(name: 'max_occupants') final int maxOccupants,
      @JsonKey(name: 'is_available') final bool isAvailable,
      @JsonKey(name: 'is_occupied') final bool isOccupied,
      @JsonKey(name: 'in_maintenance') final bool inMaintenance,
      @JsonKey(name: 'is_reserved') final bool isReserved,
      @JsonKey(name: 'has_active_rental') final bool hasActiveRental,
      @JsonKey(name: 'estate') final Estate? estate,
      @JsonKey(name: 'current_tenant') final dynamic currentTenant,
      @JsonKey(name: 'active_rentals') final List<Rental> activeRentals,
      @JsonKey(name: 'created_at') final String createdAt,
      @JsonKey(name: 'updated_at') final String updatedAt,
      @JsonKey(name: 'rental_yield') final double rentalYield,
      @JsonKey(name: 'availability_status')
      final AvailabilityStatus? availabilityStatus}) = _$PropertyImpl;

  factory _Property.fromJson(Map<String, dynamic> json) =
      _$PropertyImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'property_code')
  String get propertyCode;
  @override
  @JsonKey(name: 'property_name')
  String get propertyName;
  @override
  @JsonKey(name: 'property_type')
  String get propertyType;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'bedrooms')
  int get bedrooms;
  @override
  @JsonKey(name: 'bathrooms')
  int get bathrooms;
  @override
  @JsonKey(name: 'size')
  String get size;
  @override
  @JsonKey(name: 'formatted_size')
  String? get formattedSize;
  @override
  @JsonKey(name: 'description')
  String? get description;
  @override
  @JsonKey(name: 'rental_amount')
  String get rentalAmount;
  @override
  @JsonKey(name: 'formatted_rental_amount')
  String? get formattedRentalAmount;
  @override
  @JsonKey(name: 'rental_frequency')
  String get rentalFrequency;
  @override
  @JsonKey(name: 'monthly_rent')
  double get monthlyRent;
  @override
  @JsonKey(name: 'annual_rent')
  double get annualRent;
  @override
  @JsonKey(name: 'amenities')
  List<String> get amenities;
  @override
  @JsonKey(name: 'images')
  List<dynamic> get images;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'status_badge')
  String get statusBadge;
  @override
  @JsonKey(name: 'is_furnished')
  bool get isFurnished;
  @override
  @JsonKey(name: 'max_occupants')
  int get maxOccupants;
  @override
  @JsonKey(name: 'is_available')
  bool get isAvailable;
  @override
  @JsonKey(name: 'is_occupied')
  bool get isOccupied;
  @override
  @JsonKey(name: 'in_maintenance')
  bool get inMaintenance;
  @override
  @JsonKey(name: 'is_reserved')
  bool get isReserved;
  @override
  @JsonKey(name: 'has_active_rental')
  bool get hasActiveRental;
  @override
  @JsonKey(name: 'estate')
  Estate? get estate;
  @override
  @JsonKey(name: 'current_tenant')
  dynamic get currentTenant;
  @override
  @JsonKey(name: 'active_rentals')
  List<Rental> get activeRentals;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  String get updatedAt;
  @override
  @JsonKey(name: 'rental_yield')
  double get rentalYield;
  @override
  @JsonKey(name: 'availability_status')
  AvailabilityStatus? get availabilityStatus;

  /// Create a copy of Property
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PropertyImplCopyWith<_$PropertyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
