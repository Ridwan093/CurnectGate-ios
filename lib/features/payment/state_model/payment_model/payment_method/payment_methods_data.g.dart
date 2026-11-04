// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_methods_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentMethodsDataImpl _$$PaymentMethodsDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentMethodsDataImpl(
      paymentMethods: (json['payment_methods'] as List<dynamic>?)
          ?.map((e) => PaymentMethodItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
      estateId: (json['estate_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PaymentMethodsDataImplToJson(
        _$PaymentMethodsDataImpl instance) =>
    <String, dynamic>{
      'payment_methods':
          instance.paymentMethods?.map((e) => e.toJson()).toList(),
      'total': instance.total,
      'estate_id': instance.estateId,
    };
