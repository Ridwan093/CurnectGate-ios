// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_codes_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventCodesDataImpl _$$EventCodesDataImplFromJson(Map<String, dynamic> json) =>
    _$EventCodesDataImpl(
      total: (json['total'] as num?)?.toInt(),
      active: (json['active'] as num?)?.toInt(),
      pending: (json['pending'] as num?)?.toInt(),
      expired: (json['expired'] as num?)?.toInt(),
      revoked: (json['revoked'] as num?)?.toInt(),
      eventCodes: (json['event_codes'] as List<dynamic>?)
          ?.map((e) => EventCode.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$EventCodesDataImplToJson(
        _$EventCodesDataImpl instance) =>
    <String, dynamic>{
      'total': instance.total,
      'active': instance.active,
      'pending': instance.pending,
      'expired': instance.expired,
      'revoked': instance.revoked,
      'event_codes': instance.eventCodes?.map((e) => e.toJson()).toList(),
    };
