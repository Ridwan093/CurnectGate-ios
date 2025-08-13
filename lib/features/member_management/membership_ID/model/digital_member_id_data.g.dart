// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'digital_member_id_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DigitalMemberIdDataImpl _$$DigitalMemberIdDataImplFromJson(
        Map<String, dynamic> json) =>
    _$DigitalMemberIdDataImpl(
      digitalId: json['digital_id'] == null
          ? null
          : DigitalId.fromJson(json['digital_id'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      estate: json['estate'] == null
          ? null
          : Estate.fromJson(json['estate'] as Map<String, dynamic>),
      qrCodeUrl: json['qr_code_url'] as String?,
      formattedId: json['formatted_id'] as String?,
      generatedAt: json['generated_at'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$$DigitalMemberIdDataImplToJson(
        _$DigitalMemberIdDataImpl instance) =>
    <String, dynamic>{
      'digital_id': instance.digitalId?.toJson(),
      'user': instance.user?.toJson(),
      'estate': instance.estate?.toJson(),
      'qr_code_url': instance.qrCodeUrl,
      'formatted_id': instance.formattedId,
      'generated_at': instance.generatedAt,
      'status': instance.status,
    };
