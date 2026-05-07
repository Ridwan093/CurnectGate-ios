// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outstanding_dues_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OutstandingDuesResponseImpl _$$OutstandingDuesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$OutstandingDuesResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : OutstandingDuesData.fromJson(json['data'] as Map<String, dynamic>),
      minimumPayableAmount: json['minimum_payable_amount'] as String?,
    );

Map<String, dynamic> _$$OutstandingDuesResponseImplToJson(
        _$OutstandingDuesResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
      'minimum_payable_amount': instance.minimumPayableAmount,
    };
