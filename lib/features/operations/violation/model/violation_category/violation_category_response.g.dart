// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViolationCategoryResponseImpl _$$ViolationCategoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ViolationCategoryResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : CategoryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ViolationCategoryResponseImplToJson(
        _$ViolationCategoryResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
