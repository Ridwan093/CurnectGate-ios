// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permit_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PermitItemImpl _$$PermitItemImplFromJson(Map<String, dynamic> json) =>
    _$PermitItemImpl(
      id: (json['id'] as num?)?.toInt(),
      clearancePermitId: (json['clearance_permit_id'] as num?)?.toInt(),
      itemName: json['item_name'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      description: json['description'] as String?,
      estimatedValue: json['estimated_value'],
      itemCategory: json['item_category'] as String?,
      verified: json['verified'] as bool?,
      verificationNotes: json['verification_notes'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$PermitItemImplToJson(_$PermitItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clearance_permit_id': instance.clearancePermitId,
      'item_name': instance.itemName,
      'quantity': instance.quantity,
      'description': instance.description,
      'estimated_value': instance.estimatedValue,
      'item_category': instance.itemCategory,
      'verified': instance.verified,
      'verification_notes': instance.verificationNotes,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
