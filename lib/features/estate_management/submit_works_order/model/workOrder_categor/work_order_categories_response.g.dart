// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order_categories_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkOrderCategoriesResponseImpl _$$WorkOrderCategoriesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkOrderCategoriesResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : WorkOrderCategoryData.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WorkOrderCategoriesResponseImplToJson(
        _$WorkOrderCategoriesResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
