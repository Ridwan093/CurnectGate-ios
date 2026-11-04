// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pivot.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PivotImpl _$$PivotImplFromJson(Map<String, dynamic> json) => _$PivotImpl(
      userId: (json['user_id'] as num?)?.toInt(),
      estateId: (json['estate_id'] as num?)?.toInt(),
      roleId: (json['role_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$$PivotImplToJson(_$PivotImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'estate_id': instance.estateId,
      'role_id': instance.roleId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
