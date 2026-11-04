// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressDataImpl _$$AddressDataImplFromJson(Map<String, dynamic> json) =>
    _$AddressDataImpl(
      addresses: (json['addresses'] as List<dynamic>?)
          ?.map((e) => EstateAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AddressDataImplToJson(_$AddressDataImpl instance) =>
    <String, dynamic>{
      'addresses': instance.addresses,
      'total': instance.total,
    };
