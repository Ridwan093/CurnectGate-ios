// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkOrderDataImpl _$$WorkOrderDataImplFromJson(Map<String, dynamic> json) =>
    _$WorkOrderDataImpl(
      workorders:
          WorkOrderList.fromJson(json['workorders'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WorkOrderDataImplToJson(_$WorkOrderDataImpl instance) =>
    <String, dynamic>{
      'workorders': instance.workorders.toJson(),
    };
