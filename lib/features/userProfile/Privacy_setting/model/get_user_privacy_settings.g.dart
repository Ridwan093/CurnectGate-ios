// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_privacy_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUserPrivacySettingsImpl _$$GetUserPrivacySettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$GetUserPrivacySettingsImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetUserPrivacySettingsImplToJson(
        _$GetUserPrivacySettingsImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
