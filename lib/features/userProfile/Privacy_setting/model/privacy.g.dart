// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'privacy.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PrivacyImpl _$$PrivacyImplFromJson(Map<String, dynamic> json) =>
    _$PrivacyImpl(
      showEmail: json['show_email'] == null
          ? null
          : ProfileVisibility.fromJson(
              json['show_email'] as Map<String, dynamic>),
      showPhone: json['show_phone'] == null
          ? null
          : ProfileVisibility.fromJson(
              json['show_phone'] as Map<String, dynamic>),
      profileVisibility: json['profile_visibility'] == null
          ? null
          : ProfileVisibility.fromJson(
              json['profile_visibility'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PrivacyImplToJson(_$PrivacyImpl instance) =>
    <String, dynamic>{
      'show_email': instance.showEmail?.toJson(),
      'show_phone': instance.showPhone?.toJson(),
      'profile_visibility': instance.profileVisibility?.toJson(),
    };
