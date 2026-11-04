// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstateAddressImpl _$$EstateAddressImplFromJson(Map<String, dynamic> json) =>
    _$EstateAddressImpl(
      id: (json['id'] as num?)?.toInt(),
      label: json['label'] as String?,
      type: json['type'] as String?,
      streetName: json['street_name'] as String?,
      streetNumber: json['street_number'] as String?,
      blockNumber: json['block_number'] as String?,
      flatNumber: json['flat_number'] as String?,
      buildingName: json['building_name'] as String?,
    );

Map<String, dynamic> _$$EstateAddressImplToJson(_$EstateAddressImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'type': instance.type,
      'street_name': instance.streetName,
      'street_number': instance.streetNumber,
      'block_number': instance.blockNumber,
      'flat_number': instance.flatNumber,
      'building_name': instance.buildingName,
    };
