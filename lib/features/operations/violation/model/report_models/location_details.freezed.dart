// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'location_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocationDetails _$LocationDetailsFromJson(Map<String, dynamic> json) {
  return _LocationDetails.fromJson(json);
}

/// @nodoc
mixin _$LocationDetails {
  @JsonKey(name: 'estate_address')
  EstateAddress get estateAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_location')
  String get additionalLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted_address')
  String get formattedAddress => throw _privateConstructorUsedError;

  /// Serializes this LocationDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocationDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocationDetailsCopyWith<LocationDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDetailsCopyWith<$Res> {
  factory $LocationDetailsCopyWith(
          LocationDetails value, $Res Function(LocationDetails) then) =
      _$LocationDetailsCopyWithImpl<$Res, LocationDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'estate_address') EstateAddress estateAddress,
      @JsonKey(name: 'additional_location') String additionalLocation,
      @JsonKey(name: 'formatted_address') String formattedAddress});

  $EstateAddressCopyWith<$Res> get estateAddress;
}

/// @nodoc
class _$LocationDetailsCopyWithImpl<$Res, $Val extends LocationDetails>
    implements $LocationDetailsCopyWith<$Res> {
  _$LocationDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocationDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? estateAddress = null,
    Object? additionalLocation = null,
    Object? formattedAddress = null,
  }) {
    return _then(_value.copyWith(
      estateAddress: null == estateAddress
          ? _value.estateAddress
          : estateAddress // ignore: cast_nullable_to_non_nullable
              as EstateAddress,
      additionalLocation: null == additionalLocation
          ? _value.additionalLocation
          : additionalLocation // ignore: cast_nullable_to_non_nullable
              as String,
      formattedAddress: null == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of LocationDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $EstateAddressCopyWith<$Res> get estateAddress {
    return $EstateAddressCopyWith<$Res>(_value.estateAddress, (value) {
      return _then(_value.copyWith(estateAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LocationDetailsImplCopyWith<$Res>
    implements $LocationDetailsCopyWith<$Res> {
  factory _$$LocationDetailsImplCopyWith(_$LocationDetailsImpl value,
          $Res Function(_$LocationDetailsImpl) then) =
      __$$LocationDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'estate_address') EstateAddress estateAddress,
      @JsonKey(name: 'additional_location') String additionalLocation,
      @JsonKey(name: 'formatted_address') String formattedAddress});

  @override
  $EstateAddressCopyWith<$Res> get estateAddress;
}

/// @nodoc
class __$$LocationDetailsImplCopyWithImpl<$Res>
    extends _$LocationDetailsCopyWithImpl<$Res, _$LocationDetailsImpl>
    implements _$$LocationDetailsImplCopyWith<$Res> {
  __$$LocationDetailsImplCopyWithImpl(
      _$LocationDetailsImpl _value, $Res Function(_$LocationDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocationDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? estateAddress = null,
    Object? additionalLocation = null,
    Object? formattedAddress = null,
  }) {
    return _then(_$LocationDetailsImpl(
      estateAddress: null == estateAddress
          ? _value.estateAddress
          : estateAddress // ignore: cast_nullable_to_non_nullable
              as EstateAddress,
      additionalLocation: null == additionalLocation
          ? _value.additionalLocation
          : additionalLocation // ignore: cast_nullable_to_non_nullable
              as String,
      formattedAddress: null == formattedAddress
          ? _value.formattedAddress
          : formattedAddress // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$LocationDetailsImpl implements _LocationDetails {
  const _$LocationDetailsImpl(
      {@JsonKey(name: 'estate_address') required this.estateAddress,
      @JsonKey(name: 'additional_location') required this.additionalLocation,
      @JsonKey(name: 'formatted_address') required this.formattedAddress});

  factory _$LocationDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationDetailsImplFromJson(json);

  @override
  @JsonKey(name: 'estate_address')
  final EstateAddress estateAddress;
  @override
  @JsonKey(name: 'additional_location')
  final String additionalLocation;
  @override
  @JsonKey(name: 'formatted_address')
  final String formattedAddress;

  @override
  String toString() {
    return 'LocationDetails(estateAddress: $estateAddress, additionalLocation: $additionalLocation, formattedAddress: $formattedAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationDetailsImpl &&
            (identical(other.estateAddress, estateAddress) ||
                other.estateAddress == estateAddress) &&
            (identical(other.additionalLocation, additionalLocation) ||
                other.additionalLocation == additionalLocation) &&
            (identical(other.formattedAddress, formattedAddress) ||
                other.formattedAddress == formattedAddress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, estateAddress, additionalLocation, formattedAddress);

  /// Create a copy of LocationDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationDetailsImplCopyWith<_$LocationDetailsImpl> get copyWith =>
      __$$LocationDetailsImplCopyWithImpl<_$LocationDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationDetailsImplToJson(
      this,
    );
  }
}

abstract class _LocationDetails implements LocationDetails {
  const factory _LocationDetails(
      {@JsonKey(name: 'estate_address')
      required final EstateAddress estateAddress,
      @JsonKey(name: 'additional_location')
      required final String additionalLocation,
      @JsonKey(name: 'formatted_address')
      required final String formattedAddress}) = _$LocationDetailsImpl;

  factory _LocationDetails.fromJson(Map<String, dynamic> json) =
      _$LocationDetailsImpl.fromJson;

  @override
  @JsonKey(name: 'estate_address')
  EstateAddress get estateAddress;
  @override
  @JsonKey(name: 'additional_location')
  String get additionalLocation;
  @override
  @JsonKey(name: 'formatted_address')
  String get formattedAddress;

  /// Create a copy of LocationDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocationDetailsImplCopyWith<_$LocationDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
