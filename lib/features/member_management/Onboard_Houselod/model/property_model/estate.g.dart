// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EstateImpl _$$EstateImplFromJson(Map<String, dynamic> json) => _$EstateImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      name: json['name'] as String? ?? '',
      estateCode: json['estate_code'] as String? ?? '',
    );

Map<String, dynamic> _$$EstateImplToJson(_$EstateImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'estate_code': instance.estateCode,
    };
