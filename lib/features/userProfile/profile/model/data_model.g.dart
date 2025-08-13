// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DataImpl _$$DataImplFromJson(Map<String, dynamic> json) => _$DataImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      firstname: json['firstname'] as String? ?? '',
      lastname: json['lastname'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      memberCode: json['member_code'] as String? ?? '',
      estateCode: json['estate_code'] as String? ?? '',
      estateName: json['estate_name'] as String? ?? '',
      gender: json['gender'] as String?,
      role: json['role'] as String? ?? '',
      status: json['status'] as bool? ?? false,
      mediaUrl: json['media_url'] as String? ?? '',
      preferredNotification: json['preferred_notification'] as String? ?? '',
      emailVerifiedAt: json['email_verified_at'] == null
          ? null
          : DateTime.parse(json['email_verified_at'] as String),
      lastLoginAt: json['last_login_at'] == null
          ? null
          : DateTime.parse(json['last_login_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$DataImplToJson(_$DataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'full_name': instance.fullName,
      'email': instance.email,
      'phone': instance.phone,
      'member_code': instance.memberCode,
      'estate_code': instance.estateCode,
      'estate_name': instance.estateName,
      'gender': instance.gender,
      'role': instance.role,
      'status': instance.status,
      'media_url': instance.mediaUrl,
      'preferred_notification': instance.preferredNotification,
      'email_verified_at': instance.emailVerifiedAt?.toIso8601String(),
      'last_login_at': instance.lastLoginAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
