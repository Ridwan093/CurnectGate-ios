// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PollDataImpl _$$PollDataImplFromJson(Map<String, dynamic> json) =>
    _$PollDataImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      description: json['description'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      opensAt: json['opensAt'] as String?,
      closesAt: json['closesAt'] as String?,
      isAnonymous: json['isAnonymous'] as bool?,
    );

Map<String, dynamic> _$$PollDataImplToJson(_$PollDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'type': instance.type,
      'status': instance.status,
      'opensAt': instance.opensAt,
      'closesAt': instance.closesAt,
      'isAnonymous': instance.isAnonymous,
    };
