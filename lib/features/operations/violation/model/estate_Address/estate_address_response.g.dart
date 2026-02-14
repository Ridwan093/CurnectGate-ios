// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate_address_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstateAddressResponseImpl _$$EstateAddressResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EstateAddressResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : AddressData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EstateAddressResponseImplToJson(
        _$EstateAddressResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
