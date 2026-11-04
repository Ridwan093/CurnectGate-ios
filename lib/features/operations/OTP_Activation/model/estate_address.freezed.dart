// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'estate_address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EstateAddress _$EstateAddressFromJson(Map<String, dynamic> json) {
  return _EstateAddress.fromJson(json);
}

/// @nodoc
mixin _$EstateAddress {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'address_type')
  String get addressType => throw _privateConstructorUsedError;
  @JsonKey(name: 'street_number')
  String get streetNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'street_name')
  String get streetName => throw _privateConstructorUsedError;
  @JsonKey(name: 'block_number')
  String get blockNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'flat_number')
  String get flatNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'building_name')
  String get buildingName => throw _privateConstructorUsedError;
  @JsonKey(name: 'estate_name')
  String get estateName => throw _privateConstructorUsedError;
  @JsonKey(name: 'city')
  String get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'state')
  String get state => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code')
  String? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'skip_duplicate_check')
  dynamic get skipDuplicateCheck => throw _privateConstructorUsedError;
  @JsonKey(name: 'duplicate_action')
  dynamic get duplicateAction => throw _privateConstructorUsedError;
  @JsonKey(name: 'country')
  String get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'latitude')
  String get latitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'longitude')
  String get longitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'landmark_description')
  String get landmarkDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'estate_id')
  int get estateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by')
  int get createdBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_info')
  List<dynamic> get additionalInfo => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this EstateAddress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EstateAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EstateAddressCopyWith<EstateAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EstateAddressCopyWith<$Res> {
  factory $EstateAddressCopyWith(
          EstateAddress value, $Res Function(EstateAddress) then) =
      _$EstateAddressCopyWithImpl<$Res, EstateAddress>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'address_type') String addressType,
      @JsonKey(name: 'street_number') String streetNumber,
      @JsonKey(name: 'street_name') String streetName,
      @JsonKey(name: 'block_number') String blockNumber,
      @JsonKey(name: 'flat_number') String flatNumber,
      @JsonKey(name: 'building_name') String buildingName,
      @JsonKey(name: 'estate_name') String estateName,
      @JsonKey(name: 'city') String city,
      @JsonKey(name: 'state') String state,
      @JsonKey(name: 'postal_code') String? postalCode,
      @JsonKey(name: 'skip_duplicate_check') dynamic skipDuplicateCheck,
      @JsonKey(name: 'duplicate_action') dynamic duplicateAction,
      @JsonKey(name: 'country') String country,
      @JsonKey(name: 'latitude') String latitude,
      @JsonKey(name: 'longitude') String longitude,
      @JsonKey(name: 'landmark_description') String landmarkDescription,
      @JsonKey(name: 'estate_id') int estateId,
      @JsonKey(name: 'created_by') int createdBy,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'additional_info') List<dynamic> additionalInfo,
      @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
      DateTime updatedAt});
}

/// @nodoc
class _$EstateAddressCopyWithImpl<$Res, $Val extends EstateAddress>
    implements $EstateAddressCopyWith<$Res> {
  _$EstateAddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EstateAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? addressType = null,
    Object? streetNumber = null,
    Object? streetName = null,
    Object? blockNumber = null,
    Object? flatNumber = null,
    Object? buildingName = null,
    Object? estateName = null,
    Object? city = null,
    Object? state = null,
    Object? postalCode = freezed,
    Object? skipDuplicateCheck = freezed,
    Object? duplicateAction = freezed,
    Object? country = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? landmarkDescription = null,
    Object? estateId = null,
    Object? createdBy = null,
    Object? isActive = null,
    Object? additionalInfo = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      addressType: null == addressType
          ? _value.addressType
          : addressType // ignore: cast_nullable_to_non_nullable
              as String,
      streetNumber: null == streetNumber
          ? _value.streetNumber
          : streetNumber // ignore: cast_nullable_to_non_nullable
              as String,
      streetName: null == streetName
          ? _value.streetName
          : streetName // ignore: cast_nullable_to_non_nullable
              as String,
      blockNumber: null == blockNumber
          ? _value.blockNumber
          : blockNumber // ignore: cast_nullable_to_non_nullable
              as String,
      flatNumber: null == flatNumber
          ? _value.flatNumber
          : flatNumber // ignore: cast_nullable_to_non_nullable
              as String,
      buildingName: null == buildingName
          ? _value.buildingName
          : buildingName // ignore: cast_nullable_to_non_nullable
              as String,
      estateName: null == estateName
          ? _value.estateName
          : estateName // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      skipDuplicateCheck: freezed == skipDuplicateCheck
          ? _value.skipDuplicateCheck
          : skipDuplicateCheck // ignore: cast_nullable_to_non_nullable
              as dynamic,
      duplicateAction: freezed == duplicateAction
          ? _value.duplicateAction
          : duplicateAction // ignore: cast_nullable_to_non_nullable
              as dynamic,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      landmarkDescription: null == landmarkDescription
          ? _value.landmarkDescription
          : landmarkDescription // ignore: cast_nullable_to_non_nullable
              as String,
      estateId: null == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      additionalInfo: null == additionalInfo
          ? _value.additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EstateAddressImplCopyWith<$Res>
    implements $EstateAddressCopyWith<$Res> {
  factory _$$EstateAddressImplCopyWith(
          _$EstateAddressImpl value, $Res Function(_$EstateAddressImpl) then) =
      __$$EstateAddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'address_type') String addressType,
      @JsonKey(name: 'street_number') String streetNumber,
      @JsonKey(name: 'street_name') String streetName,
      @JsonKey(name: 'block_number') String blockNumber,
      @JsonKey(name: 'flat_number') String flatNumber,
      @JsonKey(name: 'building_name') String buildingName,
      @JsonKey(name: 'estate_name') String estateName,
      @JsonKey(name: 'city') String city,
      @JsonKey(name: 'state') String state,
      @JsonKey(name: 'postal_code') String? postalCode,
      @JsonKey(name: 'skip_duplicate_check') dynamic skipDuplicateCheck,
      @JsonKey(name: 'duplicate_action') dynamic duplicateAction,
      @JsonKey(name: 'country') String country,
      @JsonKey(name: 'latitude') String latitude,
      @JsonKey(name: 'longitude') String longitude,
      @JsonKey(name: 'landmark_description') String landmarkDescription,
      @JsonKey(name: 'estate_id') int estateId,
      @JsonKey(name: 'created_by') int createdBy,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'additional_info') List<dynamic> additionalInfo,
      @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
      DateTime updatedAt});
}

/// @nodoc
class __$$EstateAddressImplCopyWithImpl<$Res>
    extends _$EstateAddressCopyWithImpl<$Res, _$EstateAddressImpl>
    implements _$$EstateAddressImplCopyWith<$Res> {
  __$$EstateAddressImplCopyWithImpl(
      _$EstateAddressImpl _value, $Res Function(_$EstateAddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of EstateAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? addressType = null,
    Object? streetNumber = null,
    Object? streetName = null,
    Object? blockNumber = null,
    Object? flatNumber = null,
    Object? buildingName = null,
    Object? estateName = null,
    Object? city = null,
    Object? state = null,
    Object? postalCode = freezed,
    Object? skipDuplicateCheck = freezed,
    Object? duplicateAction = freezed,
    Object? country = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? landmarkDescription = null,
    Object? estateId = null,
    Object? createdBy = null,
    Object? isActive = null,
    Object? additionalInfo = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$EstateAddressImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      addressType: null == addressType
          ? _value.addressType
          : addressType // ignore: cast_nullable_to_non_nullable
              as String,
      streetNumber: null == streetNumber
          ? _value.streetNumber
          : streetNumber // ignore: cast_nullable_to_non_nullable
              as String,
      streetName: null == streetName
          ? _value.streetName
          : streetName // ignore: cast_nullable_to_non_nullable
              as String,
      blockNumber: null == blockNumber
          ? _value.blockNumber
          : blockNumber // ignore: cast_nullable_to_non_nullable
              as String,
      flatNumber: null == flatNumber
          ? _value.flatNumber
          : flatNumber // ignore: cast_nullable_to_non_nullable
              as String,
      buildingName: null == buildingName
          ? _value.buildingName
          : buildingName // ignore: cast_nullable_to_non_nullable
              as String,
      estateName: null == estateName
          ? _value.estateName
          : estateName // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String?,
      skipDuplicateCheck: freezed == skipDuplicateCheck
          ? _value.skipDuplicateCheck
          : skipDuplicateCheck // ignore: cast_nullable_to_non_nullable
              as dynamic,
      duplicateAction: freezed == duplicateAction
          ? _value.duplicateAction
          : duplicateAction // ignore: cast_nullable_to_non_nullable
              as dynamic,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      landmarkDescription: null == landmarkDescription
          ? _value.landmarkDescription
          : landmarkDescription // ignore: cast_nullable_to_non_nullable
              as String,
      estateId: null == estateId
          ? _value.estateId
          : estateId // ignore: cast_nullable_to_non_nullable
              as int,
      createdBy: null == createdBy
          ? _value.createdBy
          : createdBy // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      additionalInfo: null == additionalInfo
          ? _value._additionalInfo
          : additionalInfo // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EstateAddressImpl implements _EstateAddress {
  const _$EstateAddressImpl(
      {@JsonKey(name: 'id') this.id = 0,
      @JsonKey(name: 'address_type') this.addressType = '',
      @JsonKey(name: 'street_number') this.streetNumber = '',
      @JsonKey(name: 'street_name') this.streetName = '',
      @JsonKey(name: 'block_number') this.blockNumber = '',
      @JsonKey(name: 'flat_number') this.flatNumber = '',
      @JsonKey(name: 'building_name') this.buildingName = '',
      @JsonKey(name: 'estate_name') this.estateName = '',
      @JsonKey(name: 'city') this.city = '',
      @JsonKey(name: 'state') this.state = '',
      @JsonKey(name: 'postal_code') this.postalCode,
      @JsonKey(name: 'skip_duplicate_check') this.skipDuplicateCheck,
      @JsonKey(name: 'duplicate_action') this.duplicateAction,
      @JsonKey(name: 'country') this.country = '',
      @JsonKey(name: 'latitude') this.latitude = '0',
      @JsonKey(name: 'longitude') this.longitude = '0',
      @JsonKey(name: 'landmark_description') this.landmarkDescription = '',
      @JsonKey(name: 'estate_id') this.estateId = 0,
      @JsonKey(name: 'created_by') this.createdBy = 0,
      @JsonKey(name: 'is_active') this.isActive = true,
      @JsonKey(name: 'additional_info')
      final List<dynamic> additionalInfo = const [],
      @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
      required this.updatedAt})
      : _additionalInfo = additionalInfo;

  factory _$EstateAddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$EstateAddressImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'address_type')
  final String addressType;
  @override
  @JsonKey(name: 'street_number')
  final String streetNumber;
  @override
  @JsonKey(name: 'street_name')
  final String streetName;
  @override
  @JsonKey(name: 'block_number')
  final String blockNumber;
  @override
  @JsonKey(name: 'flat_number')
  final String flatNumber;
  @override
  @JsonKey(name: 'building_name')
  final String buildingName;
  @override
  @JsonKey(name: 'estate_name')
  final String estateName;
  @override
  @JsonKey(name: 'city')
  final String city;
  @override
  @JsonKey(name: 'state')
  final String state;
  @override
  @JsonKey(name: 'postal_code')
  final String? postalCode;
  @override
  @JsonKey(name: 'skip_duplicate_check')
  final dynamic skipDuplicateCheck;
  @override
  @JsonKey(name: 'duplicate_action')
  final dynamic duplicateAction;
  @override
  @JsonKey(name: 'country')
  final String country;
  @override
  @JsonKey(name: 'latitude')
  final String latitude;
  @override
  @JsonKey(name: 'longitude')
  final String longitude;
  @override
  @JsonKey(name: 'landmark_description')
  final String landmarkDescription;
  @override
  @JsonKey(name: 'estate_id')
  final int estateId;
  @override
  @JsonKey(name: 'created_by')
  final int createdBy;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  final List<dynamic> _additionalInfo;
  @override
  @JsonKey(name: 'additional_info')
  List<dynamic> get additionalInfo {
    if (_additionalInfo is EqualUnmodifiableListView) return _additionalInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_additionalInfo);
  }

  @override
  @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'EstateAddress(id: $id, addressType: $addressType, streetNumber: $streetNumber, streetName: $streetName, blockNumber: $blockNumber, flatNumber: $flatNumber, buildingName: $buildingName, estateName: $estateName, city: $city, state: $state, postalCode: $postalCode, skipDuplicateCheck: $skipDuplicateCheck, duplicateAction: $duplicateAction, country: $country, latitude: $latitude, longitude: $longitude, landmarkDescription: $landmarkDescription, estateId: $estateId, createdBy: $createdBy, isActive: $isActive, additionalInfo: $additionalInfo, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EstateAddressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.addressType, addressType) ||
                other.addressType == addressType) &&
            (identical(other.streetNumber, streetNumber) ||
                other.streetNumber == streetNumber) &&
            (identical(other.streetName, streetName) ||
                other.streetName == streetName) &&
            (identical(other.blockNumber, blockNumber) ||
                other.blockNumber == blockNumber) &&
            (identical(other.flatNumber, flatNumber) ||
                other.flatNumber == flatNumber) &&
            (identical(other.buildingName, buildingName) ||
                other.buildingName == buildingName) &&
            (identical(other.estateName, estateName) ||
                other.estateName == estateName) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            const DeepCollectionEquality()
                .equals(other.skipDuplicateCheck, skipDuplicateCheck) &&
            const DeepCollectionEquality()
                .equals(other.duplicateAction, duplicateAction) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.landmarkDescription, landmarkDescription) ||
                other.landmarkDescription == landmarkDescription) &&
            (identical(other.estateId, estateId) ||
                other.estateId == estateId) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            const DeepCollectionEquality()
                .equals(other._additionalInfo, _additionalInfo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        addressType,
        streetNumber,
        streetName,
        blockNumber,
        flatNumber,
        buildingName,
        estateName,
        city,
        state,
        postalCode,
        const DeepCollectionEquality().hash(skipDuplicateCheck),
        const DeepCollectionEquality().hash(duplicateAction),
        country,
        latitude,
        longitude,
        landmarkDescription,
        estateId,
        createdBy,
        isActive,
        const DeepCollectionEquality().hash(_additionalInfo),
        createdAt,
        updatedAt
      ]);

  /// Create a copy of EstateAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EstateAddressImplCopyWith<_$EstateAddressImpl> get copyWith =>
      __$$EstateAddressImplCopyWithImpl<_$EstateAddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EstateAddressImplToJson(
      this,
    );
  }
}

abstract class _EstateAddress implements EstateAddress {
  const factory _EstateAddress(
      {@JsonKey(name: 'id') final int id,
      @JsonKey(name: 'address_type') final String addressType,
      @JsonKey(name: 'street_number') final String streetNumber,
      @JsonKey(name: 'street_name') final String streetName,
      @JsonKey(name: 'block_number') final String blockNumber,
      @JsonKey(name: 'flat_number') final String flatNumber,
      @JsonKey(name: 'building_name') final String buildingName,
      @JsonKey(name: 'estate_name') final String estateName,
      @JsonKey(name: 'city') final String city,
      @JsonKey(name: 'state') final String state,
      @JsonKey(name: 'postal_code') final String? postalCode,
      @JsonKey(name: 'skip_duplicate_check') final dynamic skipDuplicateCheck,
      @JsonKey(name: 'duplicate_action') final dynamic duplicateAction,
      @JsonKey(name: 'country') final String country,
      @JsonKey(name: 'latitude') final String latitude,
      @JsonKey(name: 'longitude') final String longitude,
      @JsonKey(name: 'landmark_description') final String landmarkDescription,
      @JsonKey(name: 'estate_id') final int estateId,
      @JsonKey(name: 'created_by') final int createdBy,
      @JsonKey(name: 'is_active') final bool isActive,
      @JsonKey(name: 'additional_info') final List<dynamic> additionalInfo,
      @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
      required final DateTime updatedAt}) = _$EstateAddressImpl;

  factory _EstateAddress.fromJson(Map<String, dynamic> json) =
      _$EstateAddressImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'address_type')
  String get addressType;
  @override
  @JsonKey(name: 'street_number')
  String get streetNumber;
  @override
  @JsonKey(name: 'street_name')
  String get streetName;
  @override
  @JsonKey(name: 'block_number')
  String get blockNumber;
  @override
  @JsonKey(name: 'flat_number')
  String get flatNumber;
  @override
  @JsonKey(name: 'building_name')
  String get buildingName;
  @override
  @JsonKey(name: 'estate_name')
  String get estateName;
  @override
  @JsonKey(name: 'city')
  String get city;
  @override
  @JsonKey(name: 'state')
  String get state;
  @override
  @JsonKey(name: 'postal_code')
  String? get postalCode;
  @override
  @JsonKey(name: 'skip_duplicate_check')
  dynamic get skipDuplicateCheck;
  @override
  @JsonKey(name: 'duplicate_action')
  dynamic get duplicateAction;
  @override
  @JsonKey(name: 'country')
  String get country;
  @override
  @JsonKey(name: 'latitude')
  String get latitude;
  @override
  @JsonKey(name: 'longitude')
  String get longitude;
  @override
  @JsonKey(name: 'landmark_description')
  String get landmarkDescription;
  @override
  @JsonKey(name: 'estate_id')
  int get estateId;
  @override
  @JsonKey(name: 'created_by')
  int get createdBy;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'additional_info')
  List<dynamic> get additionalInfo;
  @override
  @JsonKey(name: 'created_at', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: NullSafetyHelper.safeDateTime)
  DateTime get updatedAt;

  /// Create a copy of EstateAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EstateAddressImplCopyWith<_$EstateAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
