// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkOrderImpl _$$WorkOrderImplFromJson(Map<String, dynamic> json) =>
    _$WorkOrderImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      estateId: (json['estate_id'] as num?)?.toInt(),
      propertyId: (json['property_id'] as num?)?.toInt(),
      workorderCategoryId: (json['workorder_category_id'] as num?)?.toInt(),
      estateAddressId: (json['estate_address_id'] as num?)?.toInt(),
      vendorName: json['vendor_name'] as String?,
      vendorEmail: json['vendor_email'] as String?,
      vendorPhone: json['vendor_phone'] as String?,
      address: json['address'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      dailyTimeWindow: json['daily_time_window'] as String?,
      description: json['description'] as String?,
      numberOfWorkers: (json['number_of_workers'] as num?)?.toInt(),
      vendorAccessCode: json['vendor_access_code'] as String?,
      allowedEntry: json['allowed_entry'] as bool?,
      beforePhotos: (json['before_photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      afterPhotos: (json['after_photos'] as List<dynamic>?)
          ?.map((e) => Photo.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as String?,
      assignedBy: (json['assigned_by'] as num?)?.toInt(),
      validatedBy: (json['validated_by'] as num?)?.toInt(),
      validatedAt: json['validated_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      property: json['property'] == null
          ? null
          : Property.fromJson(json['property'] as Map<String, dynamic>),
      estateAddress: json['estate_address'] == null
          ? null
          : EstateAddress.fromJson(
              json['estate_address'] as Map<String, dynamic>),
      workers: (json['workers'] as List<dynamic>?)
          ?.map((e) => Worker.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WorkOrderImplToJson(_$WorkOrderImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'estate_id': instance.estateId,
      'property_id': instance.propertyId,
      'workorder_category_id': instance.workorderCategoryId,
      'estate_address_id': instance.estateAddressId,
      'vendor_name': instance.vendorName,
      'vendor_email': instance.vendorEmail,
      'vendor_phone': instance.vendorPhone,
      'address': instance.address,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'daily_time_window': instance.dailyTimeWindow,
      'description': instance.description,
      'number_of_workers': instance.numberOfWorkers,
      'vendor_access_code': instance.vendorAccessCode,
      'allowed_entry': instance.allowedEntry,
      'before_photos': instance.beforePhotos?.map((e) => e.toJson()).toList(),
      'after_photos': instance.afterPhotos?.map((e) => e.toJson()).toList(),
      'status': instance.status,
      'assigned_by': instance.assignedBy,
      'validated_by': instance.validatedBy,
      'validated_at': instance.validatedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'category': instance.category?.toJson(),
      'property': instance.property?.toJson(),
      'estate_address': instance.estateAddress?.toJson(),
      'workers': instance.workers?.map((e) => e.toJson()).toList(),
    };
