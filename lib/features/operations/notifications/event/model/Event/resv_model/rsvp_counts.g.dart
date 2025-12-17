// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rsvp_counts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RsvpCountsImpl _$$RsvpCountsImplFromJson(Map<String, dynamic> json) =>
    _$RsvpCountsImpl(
      going: (json['going'] as num?)?.toInt(),
      notGoing: (json['not_going'] as num?)?.toInt(),
      maybe: (json['maybe'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$RsvpCountsImplToJson(_$RsvpCountsImpl instance) =>
    <String, dynamic>{
      'going': instance.going,
      'not_going': instance.notGoing,
      'maybe': instance.maybe,
      'total': instance.total,
    };
