// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_requester_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EventRequesterImpl _$$EventRequesterImplFromJson(Map<String, dynamic> json) =>
    _$EventRequesterImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$$EventRequesterImplToJson(
        _$EventRequesterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
    };
