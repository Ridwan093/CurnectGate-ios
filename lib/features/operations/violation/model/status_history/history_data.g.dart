// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryDataImpl _$$HistoryDataImplFromJson(Map<String, dynamic> json) =>
    _$HistoryDataImpl(
      history: (json['history'] as List<dynamic>?)
          ?.map((e) => HistoryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$HistoryDataImplToJson(_$HistoryDataImpl instance) =>
    <String, dynamic>{
      'history': instance.history,
      'total': instance.total,
    };
