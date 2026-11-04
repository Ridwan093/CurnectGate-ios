// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DestinationInfoModelImpl _$$DestinationInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DestinationInfoModelImpl(
      propertyName: json['property_name'] as String?,
      propertyCode: json['property_code'] as String?,
      fullAddress: json['full_address'] as String?,
      directions: json['directions'] as String?,
      blockNumber: json['block_number'] as String?,
      buildingName: json['building_name'] as String?,
      streetName: json['street_name'] as String?,
      landmark: json['landmark'] as String?,
    );

Map<String, dynamic> _$$DestinationInfoModelImplToJson(
        _$DestinationInfoModelImpl instance) =>
    <String, dynamic>{
      'property_name': instance.propertyName,
      'property_code': instance.propertyCode,
      'full_address': instance.fullAddress,
      'directions': instance.directions,
      'block_number': instance.blockNumber,
      'building_name': instance.buildingName,
      'street_name': instance.streetName,
      'landmark': instance.landmark,
    };
