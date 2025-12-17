// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'candidates_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CandidatesResponseImpl _$$CandidatesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CandidatesResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : CandidatesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CandidatesResponseImplToJson(
        _$CandidatesResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
