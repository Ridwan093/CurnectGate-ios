// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compliance_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ComplianceResponseImpl _$$ComplianceResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ComplianceResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : ComplianceData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ComplianceResponseImplToJson(
        _$ComplianceResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
