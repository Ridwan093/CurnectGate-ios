// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agreements_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgreementsResponseImpl _$$AgreementsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AgreementsResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : AgreementsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AgreementsResponseImplToJson(
        _$AgreementsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
