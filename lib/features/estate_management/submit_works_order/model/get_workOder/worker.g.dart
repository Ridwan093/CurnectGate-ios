// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkerImpl _$$WorkerImplFromJson(Map<String, dynamic> json) => _$WorkerImpl(
      id: (json['id'] as num?)?.toInt(),
      workorderId: (json['workorder_id'] as num?)?.toInt(),
      workerName: json['worker_name'] as String?,
      workerPhone: json['worker_phone'] as String?,
      accessCode: json['access_code'] as String?,
      isVendorLeader: json['is_vendor_leader'] as bool?,
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$WorkerImplToJson(_$WorkerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'workorder_id': instance.workorderId,
      'worker_name': instance.workerName,
      'worker_phone': instance.workerPhone,
      'access_code': instance.accessCode,
      'is_vendor_leader': instance.isVendorLeader,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
