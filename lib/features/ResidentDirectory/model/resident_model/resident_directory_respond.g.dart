// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resident_directory_respond.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResidentDirectoryResponseImpl _$$ResidentDirectoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ResidentDirectoryResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : ResidentDirectoryData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ResidentDirectoryResponseImplToJson(
        _$ResidentDirectoryResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
