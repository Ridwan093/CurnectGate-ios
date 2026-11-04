// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstateImpl _$$EstateImplFromJson(Map<String, dynamic> json) => _$EstateImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      onboardedBy: (json['onboarded_by'] as num?)?.toInt(),
      address: json['address'] as String?,
      estateCode: json['estate_code'] as String?,
      stateId: (json['state_id'] as num?)?.toInt(),
      city: json['city'] as String?,
      postalCode: json['postal_code'] as String?,
      contactEmail: json['contact_email'] as String?,
      contactPhone: json['contact_phone'] as String?,
      settings: json['settings'] == null
          ? null
          : EstateSettings.fromJson(json['settings'] as Map<String, dynamic>),
      status: json['status'] as String?,
      mediaUrl: json['media_url'] as String?,
      mediaKey: json['media_key'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$EstateImplToJson(_$EstateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'onboarded_by': instance.onboardedBy,
      'address': instance.address,
      'estate_code': instance.estateCode,
      'state_id': instance.stateId,
      'city': instance.city,
      'postal_code': instance.postalCode,
      'contact_email': instance.contactEmail,
      'contact_phone': instance.contactPhone,
      'settings': instance.settings?.toJson(),
      'status': instance.status,
      'media_url': instance.mediaUrl,
      'media_key': instance.mediaKey,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
