// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminders_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemindersResponseModelImpl _$$RemindersResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RemindersResponseModelImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : RemindersData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RemindersResponseModelImplToJson(
        _$RemindersResponseModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
