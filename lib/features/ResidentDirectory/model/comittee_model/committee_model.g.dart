// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'committee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommitteeImpl _$$CommitteeImplFromJson(Map<String, dynamic> json) =>
    _$CommitteeImpl(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      category: json['category'] == null
          ? null
          : CommitteeCategory.fromJson(
              json['category'] as Map<String, dynamic>),
      status: json['status'] as String?,
      memberCount: (json['member_count'] as num?)?.toInt(),
      chairperson: json['chairperson'] == null
          ? null
          : Chairperson.fromJson(json['chairperson'] as Map<String, dynamic>),
      secretary: json['secretary'] as String?,
      nextMeeting: json['next_meeting'] == null
          ? null
          : DateTime.parse(json['next_meeting'] as String),
      establishedDate: json['established_date'] == null
          ? null
          : DateTime.parse(json['established_date'] as String),
      meetingSchedule: json['meeting_schedule'] == null
          ? null
          : MeetingSchedule.fromJson(
              json['meeting_schedule'] as Map<String, dynamic>),
      meetingLocation: json['meeting_location'] as String?,
      objectives: (json['objectives'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      achievements: (json['achievements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$CommitteeImplToJson(_$CommitteeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category?.toJson(),
      'status': instance.status,
      'member_count': instance.memberCount,
      'chairperson': instance.chairperson?.toJson(),
      'secretary': instance.secretary,
      'next_meeting': instance.nextMeeting?.toIso8601String(),
      'established_date': instance.establishedDate?.toIso8601String(),
      'meeting_schedule': instance.meetingSchedule?.toJson(),
      'meeting_location': instance.meetingLocation,
      'objectives': instance.objectives,
      'achievements': instance.achievements,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
