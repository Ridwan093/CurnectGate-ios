// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curfew_member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurfewMemberImpl _$$CurfewMemberImplFromJson(Map<String, dynamic> json) =>
    _$CurfewMemberImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$$CurfewMemberImplToJson(_$CurfewMemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
    };
