// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reminder_household_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReminderHouseholdMemberImpl _$$ReminderHouseholdMemberImplFromJson(
        Map<String, dynamic> json) =>
    _$ReminderHouseholdMemberImpl(
      id: (json['id'] as num?)?.toInt(),
      firstname: json['firstname'] as String?,
      lastname: json['lastname'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      role: json['role'] as String?,
      avatar: json['avatar'],
    );

Map<String, dynamic> _$$ReminderHouseholdMemberImplToJson(
        _$ReminderHouseholdMemberImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'email': instance.email,
      'phone': instance.phone,
      'role': instance.role,
      'avatar': instance.avatar,
    };
