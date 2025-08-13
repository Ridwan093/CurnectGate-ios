// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissions_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermissionsResponseImpl _$$PermissionsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PermissionsResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : PermissionsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PermissionsResponseImplToJson(
        _$PermissionsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
