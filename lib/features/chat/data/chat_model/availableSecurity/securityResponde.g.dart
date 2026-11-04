// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'securityResponde.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SecurityPersonnelResponseImpl _$$SecurityPersonnelResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SecurityPersonnelResponseImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : SecurityPersonnelData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SecurityPersonnelResponseImplToJson(
        _$SecurityPersonnelResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data?.toJson(),
    };
