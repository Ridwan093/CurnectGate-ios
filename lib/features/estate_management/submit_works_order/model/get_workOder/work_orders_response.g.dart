// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkOrderResponseImpl _$$WorkOrderResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkOrderResponseImpl(
      status: json['status'] as bool,
      message: json['message'] as String,
      code: (json['code'] as num).toInt(),
      data: WorkOrderData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WorkOrderResponseImplToJson(
        _$WorkOrderResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data.toJson(),
    };
