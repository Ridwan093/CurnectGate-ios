// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outstanding_dues_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OutstandingDuesDataImpl _$$OutstandingDuesDataImplFromJson(
        Map<String, dynamic> json) =>
    _$OutstandingDuesDataImpl(
      dues: (json['dues'] as List<dynamic>?)
          ?.map((e) => OutstandingDue.fromJson(e as Map<String, dynamic>))
          .toList(),
      summary: json['summary'] == null
          ? null
          : Summary.fromJson(json['summary'] as Map<String, dynamic>),
      minimumPayableAmount: json['minimum_payable_amount'] as String?,
    );

Map<String, dynamic> _$$OutstandingDuesDataImplToJson(
        _$OutstandingDuesDataImpl instance) =>
    <String, dynamic>{
      'dues': instance.dues?.map((e) => e.toJson()).toList(),
      'summary': instance.summary?.toJson(),
      'minimum_payable_amount': instance.minimumPayableAmount,
    };
