// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AvailabilityStatusImpl _$$AvailabilityStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$AvailabilityStatusImpl(
      isAvailable: json['is_available'] as bool? ?? false,
      reason: json['reason'] as String?,
      availableFrom: json['available_from'] as String?,
    );

Map<String, dynamic> _$$AvailabilityStatusImplToJson(
        _$AvailabilityStatusImpl instance) =>
    <String, dynamic>{
      'is_available': instance.isAvailable,
      'reason': instance.reason,
      'available_from': instance.availableFrom,
    };
