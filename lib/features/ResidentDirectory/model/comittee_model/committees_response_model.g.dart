// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'committees_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommitteesResponseImpl _$$CommitteesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CommitteesResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : CommitteesData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommitteesResponseImplToJson(
        _$CommitteesResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };

_$CommitteesDataImpl _$$CommitteesDataImplFromJson(Map<String, dynamic> json) =>
    _$CommitteesDataImpl(
      committees: json['committees'] == null
          ? null
          : CommitteeList.fromJson(json['committees'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CommitteesDataImplToJson(
        _$CommitteesDataImpl instance) =>
    <String, dynamic>{
      'committees': instance.committees?.toJson(),
    };
