// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************


Map<String, dynamic> _$DataPayloadToJson(DataPayload instance) =>
    <String, dynamic>{
      'visitors': instance.visitors?.map((e) => e.toJson()).toList(),
      'count': instance.count,
      'estate_id': instance.estateId,
      'showing_my_visitors_only': instance.showingMyVisitorsOnly,
    };

_$DataPayloadImpl _$$DataPayloadImplFromJson(Map<String, dynamic> json) =>
    _$DataPayloadImpl(
      visitors: (json['visitors'] as List<dynamic>?)
          ?.map((e) => VisitorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      count: (json['count'] as num?)?.toInt(),
      estateId: (json['estateId'] as num?)?.toInt(),
      showingMyVisitorsOnly: json['showingMyVisitorsOnly'] as bool?,
    );

Map<String, dynamic> _$$DataPayloadImplToJson(_$DataPayloadImpl instance) =>
    <String, dynamic>{
      'visitors': instance.visitors,
      'count': instance.count,
      'estateId': instance.estateId,
      'showingMyVisitorsOnly': instance.showingMyVisitorsOnly,
    };
