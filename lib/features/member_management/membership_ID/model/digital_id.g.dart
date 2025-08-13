// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DigitalIdImpl _$$DigitalIdImplFromJson(Map<String, dynamic> json) =>
    _$DigitalIdImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      estateId: (json['estate_id'] as num?)?.toInt(),
      digitalIdCode: json['digital_id_code'] as String?,
      qrCodeUrl: json['qr_code_url'] as String?,
      qrCodePublicId: json['qr_code_public_id'] as String?,
      qrCodeData: json['qr_code_data'] as String?,
      status: json['status'] as String?,
      accessPermissions: json['access_permissions'] == null
          ? null
          : AccessPermissions.fromJson(
              json['access_permissions'] as Map<String, dynamic>),
      restrictions: json['restrictions'],
      deactivationReason: json['deactivation_reason'],
      deactivatedBy: (json['deactivated_by'] as num?)?.toInt(),
      createdBy: (json['created_by'] as num?)?.toInt(),
      activatedAt: json['activated_at'] as String?,
      deactivatedAt: json['deactivated_at'],
      lastUsedAt: json['last_used_at'] as String?,
      usageCount: (json['usage_count'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$DigitalIdImplToJson(_$DigitalIdImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'estate_id': instance.estateId,
      'digital_id_code': instance.digitalIdCode,
      'qr_code_url': instance.qrCodeUrl,
      'qr_code_public_id': instance.qrCodePublicId,
      'qr_code_data': instance.qrCodeData,
      'status': instance.status,
      'access_permissions': instance.accessPermissions?.toJson(),
      'restrictions': instance.restrictions,
      'deactivation_reason': instance.deactivationReason,
      'deactivated_by': instance.deactivatedBy,
      'created_by': instance.createdBy,
      'activated_at': instance.activatedAt,
      'deactivated_at': instance.deactivatedAt,
      'last_used_at': instance.lastUsedAt,
      'usage_count': instance.usageCount,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
