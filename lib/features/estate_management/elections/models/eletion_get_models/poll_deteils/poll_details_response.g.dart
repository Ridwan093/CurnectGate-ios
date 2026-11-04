// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PollDetailsResponseImpl _$$PollDetailsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PollDetailsResponseImpl(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
      data: json['data'] == null
          ? null
          : PollDetailsData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PollDetailsResponseImplToJson(
        _$PollDetailsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data?.toJson(),
    };
