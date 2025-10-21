// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order_category_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkOrderCategoryDataImpl _$$WorkOrderCategoryDataImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkOrderCategoryDataImpl(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => WorkOrderCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkOrderCategoryDataImplToJson(
        _$WorkOrderCategoryDataImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories?.map((e) => e.toJson()).toList(),
    };
