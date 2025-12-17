// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_dashboard_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PaymentDashboardResponseImpl _$$PaymentDashboardResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentDashboardResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : PaymentDashboardData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PaymentDashboardResponseImplToJson(
        _$PaymentDashboardResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
