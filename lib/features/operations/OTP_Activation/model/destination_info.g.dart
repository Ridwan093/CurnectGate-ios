// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'destination_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DestinationInfoImpl _$$DestinationInfoImplFromJson(
        Map<String, dynamic> json) =>
    _$DestinationInfoImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      type: json['type'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      address: json['address'] as String? ?? '',
    );

Map<String, dynamic> _$$DestinationInfoImplToJson(
        _$DestinationInfoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'phone': instance.phone,
      'email': instance.email,
      'address': instance.address,
    };
