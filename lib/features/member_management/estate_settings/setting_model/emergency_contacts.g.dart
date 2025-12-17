// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'emergency_contacts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EmergencyContactsImpl _$$EmergencyContactsImplFromJson(
        Map<String, dynamic> json) =>
    _$EmergencyContactsImpl(
      police:
          (json['police'] as List<dynamic>?)?.map((e) => e as String).toList(),
      estateManagement: (json['estate_management'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      fireAlarm: (json['fire_alarm'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      ambulance: (json['ambulance'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$EmergencyContactsImplToJson(
        _$EmergencyContactsImpl instance) =>
    <String, dynamic>{
      'police': instance.police,
      'estate_management': instance.estateManagement,
      'fire_alarm': instance.fireAlarm,
      'ambulance': instance.ambulance,
    };
