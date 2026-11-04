// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate_admins_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstateAdminsResponseImpl _$$EstateAdminsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EstateAdminsResponseImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : EstateAdminsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EstateAdminsResponseImplToJson(
        _$EstateAdminsResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };
