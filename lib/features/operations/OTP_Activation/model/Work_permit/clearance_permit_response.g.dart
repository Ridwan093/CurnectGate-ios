// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clearance_permit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClearancePermitResponseImpl _$$ClearancePermitResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ClearancePermitResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : ClearancePermitData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ClearancePermitResponseImplToJson(
        _$ClearancePermitResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
