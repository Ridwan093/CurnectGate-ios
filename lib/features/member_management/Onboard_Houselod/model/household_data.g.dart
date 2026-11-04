// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'household_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HouseholdDataImpl _$$HouseholdDataImplFromJson(Map<String, dynamic> json) =>
    _$HouseholdDataImpl(
      householdMembers: (json['household'] as List<dynamic>?)
          ?.map((e) => HouseholdMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$HouseholdDataImplToJson(_$HouseholdDataImpl instance) =>
    <String, dynamic>{
      'household': instance.householdMembers?.map((e) => e.toJson()).toList(),
    };
