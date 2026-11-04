// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_methods_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentMethodsResponseImpl _$$PaymentMethodsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentMethodsResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : PaymentMethodsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaymentMethodsResponseImplToJson(
        _$PaymentMethodsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
