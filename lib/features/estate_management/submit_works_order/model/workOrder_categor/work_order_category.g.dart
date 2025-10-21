// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkOrderCategoryImpl _$$WorkOrderCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkOrderCategoryImpl(
      id: (json['id'] as num?)?.toInt(),
      estateId: (json['estate_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$WorkOrderCategoryImplToJson(
        _$WorkOrderCategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'estate_id': instance.estateId,
      'name': instance.name,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
