// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clearance_permit_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClearancePermitDataImpl _$$ClearancePermitDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ClearancePermitDataImpl(
      permits: (json['permits'] as List<dynamic>?)
          ?.map((e) => Permit.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ClearancePermitDataImplToJson(
        _$ClearancePermitDataImpl instance) =>
    <String, dynamic>{
      'permits': instance.permits?.map((e) => e.toJson()).toList(),
    };
