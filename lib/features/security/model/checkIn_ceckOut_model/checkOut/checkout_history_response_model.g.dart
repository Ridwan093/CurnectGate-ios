// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_history_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CheckoutHistoryResponseModelImpl _$$CheckoutHistoryResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CheckoutHistoryResponseModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : CheckoutHistoryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CheckoutHistoryResponseModelImplToJson(
        _$CheckoutHistoryResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
