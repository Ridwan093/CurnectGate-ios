// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstateSettingsImpl _$$EstateSettingsImplFromJson(Map<String, dynamic> json) =>
    _$EstateSettingsImpl(
      autoApproveUsers: json['auto_approve_users'] as bool?,
      requireDeedSignature: json['require_deed_signature'] as bool?,
      visitorApprovalRequired: json['visitor_approval_required'] as bool?,
      emergencyContacts: json['emergency_contacts'] as List<dynamic>?,
      imageUrl: json['image_url'] as String?,
      imageKey: json['image_key'] as String?,
      operatingHours: json['operating_hours'] == null
          ? null
          : OperatingHours.fromJson(
              json['operating_hours'] as Map<String, dynamic>),
      imageKeyAlt: json['image_Key'] as String?,
    );

Map<String, dynamic> _$$EstateSettingsImplToJson(
        _$EstateSettingsImpl instance) =>
    <String, dynamic>{
      'auto_approve_users': instance.autoApproveUsers,
      'require_deed_signature': instance.requireDeedSignature,
      'visitor_approval_required': instance.visitorApprovalRequired,
      'emergency_contacts': instance.emergencyContacts,
      'image_url': instance.imageUrl,
      'image_key': instance.imageKey,
      'operating_hours': instance.operatingHours?.toJson(),
      'image_Key': instance.imageKeyAlt,
    };
