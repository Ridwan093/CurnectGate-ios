import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../operations/OTP_Activation/model/Work_permit/property.dart';
import 'category.dart';

import 'estate_address.dart';
import 'worker.dart';
import 'photo.dart';

part 'work_order.freezed.dart';
part 'work_order.g.dart';

@freezed
class WorkOrder with _$WorkOrder {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory WorkOrder({
    int? id,
    int? userId,
    int? estateId,
    int? propertyId,
    int? workorderCategoryId,
    int? estateAddressId,
    String? vendorName,
    String? vendorEmail,
    String? vendorPhone,
    String? address,
    String? startDate,
    String? endDate,
    String? dailyTimeWindow,
    String? description,
    int? numberOfWorkers,
    String? vendorAccessCode,
    bool? allowedEntry,
    List<Photo>? beforePhotos,
    List<Photo>? afterPhotos,
    String? status,
    int? assignedBy,
    int? validatedBy,
    String? validatedAt,
    String? createdAt,
    String? updatedAt,
    Category? category,
    Property? property,
    EstateAddress? estateAddress,
    List<Worker>? workers,
  }) = _WorkOrder;

  factory WorkOrder.fromJson(Map<String, dynamic> json) =>
      _$WorkOrderFromJson(json);

  factory WorkOrder.safeFromJson(Map<String, dynamic>? json) {
    if (json == null) return WorkOrder.empty();
    return WorkOrder(
      id: NullSafetyHelper.safeInt(json['id']),
      userId: NullSafetyHelper.safeInt(json['user_id']),
      estateId: NullSafetyHelper.safeInt(json['estate_id']),
      propertyId: NullSafetyHelper.safeInt(json['property_id']),
      workorderCategoryId: NullSafetyHelper.safeInt(json['workorder_category_id']),
      estateAddressId: NullSafetyHelper.safeInt(json['estate_address_id']),
      vendorName: NullSafetyHelper.safeString(json['vendor_name']),
      vendorEmail: NullSafetyHelper.safeString(json['vendor_email']),
      vendorPhone: NullSafetyHelper.safeString(json['vendor_phone']),
      address: NullSafetyHelper.safeString(json['address']),
      startDate: NullSafetyHelper.safeString(json['start_date']),
      endDate: NullSafetyHelper.safeString(json['end_date']),
      dailyTimeWindow: NullSafetyHelper.safeString(json['daily_time_window']),
      description: NullSafetyHelper.safeString(json['description']),
      numberOfWorkers: NullSafetyHelper.safeInt(json['number_of_workers']),
      vendorAccessCode: NullSafetyHelper.safeString(json['vendor_access_code']),
      allowedEntry: NullSafetyHelper.safeBool(json['allowed_entry']),
      beforePhotos: _safePhotoList(json['before_photos']),
      afterPhotos: _safePhotoList(json['after_photos']),
      status: NullSafetyHelper.safeString(json['status']),
      assignedBy: NullSafetyHelper.safeInt(json['assigned_by']),
      validatedBy: NullSafetyHelper.safeInt(json['validated_by']),
      validatedAt: NullSafetyHelper.safeString(json['validated_at']),
      createdAt: NullSafetyHelper.safeString(json['created_at']),
      updatedAt: NullSafetyHelper.safeString(json['updated_at']),
      category: Category.safeFromJson(json['category']),
      property: Property.fromSafeJson(json['property']),
      estateAddress: EstateAddress.safeFromJson(json['estate_address']),
      workers: _safeWorkerList(json['workers']),
    );
  }

  static List<Photo> _safePhotoList(dynamic photos) {
    if (photos is List) {
      return photos
          .whereType<Map<String, dynamic>>()
          .map((e) => Photo.safeFromJson(e))
          .toList();
    }
    return [];
  }

  static List<Worker> _safeWorkerList(dynamic workers) {
    if (workers is List) {
      return workers
          .whereType<Map<String, dynamic>>()
          .map((e) => Worker.safeFromJson(e))
          .toList();
    }
    return [];
  }

  factory WorkOrder.empty() => const WorkOrder(
        id: null,
        userId: null,
        estateId: null,
        propertyId: null,
        workorderCategoryId: null,
        estateAddressId: null,
        vendorName: null,
        vendorEmail: null,
        vendorPhone: null,
        address: null,
        startDate: null,
        endDate: null,
        dailyTimeWindow: null,
        description: null,
        numberOfWorkers: null,
        vendorAccessCode: null,
        allowedEntry: null,
        beforePhotos: null,
        afterPhotos: null,
        status: null,
        assignedBy: null,
        validatedBy: null,
        validatedAt: null,
        createdAt: null,
        updatedAt: null,
        category: null,
        property: null,
        estateAddress: null,
        workers: null,
      );
}