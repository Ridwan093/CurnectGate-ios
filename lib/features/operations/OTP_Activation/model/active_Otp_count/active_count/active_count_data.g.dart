// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'active_count_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActiveCountDataImpl _$$ActiveCountDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ActiveCountDataImpl(
      count: (json['count'] as num?)?.toInt(),
      timestamp: json['timestamp'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ActiveCountDataImplToJson(
        _$ActiveCountDataImpl instance) =>
    <String, dynamic>{
      'count': instance.count,
      'timestamp': instance.timestamp,
      'userId': instance.userId,
    };
