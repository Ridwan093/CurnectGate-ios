// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      id: json['id'] == null ? 0 : NullSafetyHelper.safeInt(json['id']),
      name:
          json['name'] == null ? '' : NullSafetyHelper.safeString(json['name']),
      memberCode: NullSafetyHelper.safeString(json['member_code']),
      role:
          json['role'] == null ? '' : NullSafetyHelper.safeString(json['role']),
      isSelf: json['is_self'] == null
          ? false
          : NullSafetyHelper.safeBool(json['is_self']),
      isCurrentUser: NullSafetyHelper.safeBool(json['is_current_user']),
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'member_code': instance.memberCode,
      'role': instance.role,
      'is_self': instance.isSelf,
      'is_current_user': instance.isCurrentUser,
    };
