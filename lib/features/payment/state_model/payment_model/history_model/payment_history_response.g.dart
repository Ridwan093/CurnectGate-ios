// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentHistoryResponseImpl _$$PaymentHistoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentHistoryResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : PaymentHistoryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaymentHistoryResponseImplToJson(
        _$PaymentHistoryResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
