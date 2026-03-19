// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restriction_status_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RestrictionStatusDataImpl _$$RestrictionStatusDataImplFromJson(
        Map<String, dynamic> json) =>
    _$RestrictionStatusDataImpl(
      memberId: (json['member_id'] as num?)?.toInt(),
      isRestricted: json['is_restricted'] as bool?,
      hasDigitalId: json['has_digital_id'] as bool?,
      digitalIdStatus: json['digital_id_status'] as String?,
      restrictions: json['restrictions'],
    );

Map<String, dynamic> _$$RestrictionStatusDataImplToJson(
        _$RestrictionStatusDataImpl instance) =>
    <String, dynamic>{
      'member_id': instance.memberId,
      'is_restricted': instance.isRestricted,
      'has_digital_id': instance.hasDigitalId,
      'digital_id_status': instance.digitalIdStatus,
      'restrictions': instance.restrictions,
    };
