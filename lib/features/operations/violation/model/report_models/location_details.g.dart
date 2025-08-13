// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationDetailsImpl _$$LocationDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationDetailsImpl(
      estateAddress: EstateAddress.fromJson(
          json['estate_address'] as Map<String, dynamic>),
      additionalLocation: json['additional_location'] as String,
      formattedAddress: json['formatted_address'] as String,
    );

Map<String, dynamic> _$$LocationDetailsImplToJson(
        _$LocationDetailsImpl instance) =>
    <String, dynamic>{
      'estate_address': instance.estateAddress.toJson(),
      'additional_location': instance.additionalLocation,
      'formatted_address': instance.formattedAddress,
    };
