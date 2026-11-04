// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grant_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GrantDetailsImpl _$$GrantDetailsImplFromJson(Map<String, dynamic> json) =>
    _$GrantDetailsImpl(
      grantedBy: json['granted_by'] == null
          ? null
          : GrantedBy.fromJson(json['granted_by'] as Map<String, dynamic>),
      reason: json['reason'] as String?,
      conditions: json['conditions'] as Map<String, dynamic>?,
      expiresAt: json['expires_at'] as String?,
      grantedAt: json['granted_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$GrantDetailsImplToJson(_$GrantDetailsImpl instance) =>
    <String, dynamic>{
      'granted_by': instance.grantedBy,
      'reason': instance.reason,
      'conditions': instance.conditions,
      'expires_at': instance.expiresAt,
      'granted_at': instance.grantedAt,
      'updated_at': instance.updatedAt,
    };
