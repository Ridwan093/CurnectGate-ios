// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate_settings_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstateSettingsResponseImpl _$$EstateSettingsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$EstateSettingsResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : EstateSettingsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$EstateSettingsResponseImplToJson(
        _$EstateSettingsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
