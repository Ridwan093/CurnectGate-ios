// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUserProfileImpl _$$GetUserProfileImplFromJson(Map<String, dynamic> json) =>
    _$GetUserProfileImpl(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      code: (json['code'] as num?)?.toInt() ?? 0,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$GetUserProfileImplToJson(
        _$GetUserProfileImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data.toJson(),
    };
