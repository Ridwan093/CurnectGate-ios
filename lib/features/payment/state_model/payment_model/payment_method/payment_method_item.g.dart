// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentMethodItemImpl _$$PaymentMethodItemImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentMethodItemImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      type: json['type'] as String?,
      description: json['description'] as String?,
      publicKey: json['public_key'] as String?,
      secretKey: json['secret_key'] as String?,
      currency: json['currency'] as String?,
      environment: json['environment'] as String?,
      chargePercentage: json['charge_percentage'] as String?,
      chargeFlat: json['charge_flat'] as String?,
    );

Map<String, dynamic> _$$PaymentMethodItemImplToJson(
        _$PaymentMethodItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'public_key': instance.publicKey,
      'secret_key': instance.secretKey,
      'currency': instance.currency,
      'environment': instance.environment,
      'charge_percentage': instance.chargePercentage,
      'charge_flat': instance.chargeFlat,
    };
