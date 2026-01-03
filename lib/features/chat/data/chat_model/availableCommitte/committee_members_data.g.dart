// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'committee_members_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommitteeMembersDataImpl _$$CommitteeMembersDataImplFromJson(
        Map<String, dynamic> json) =>
    _$CommitteeMembersDataImpl(
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => CommitteeMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      committeeCount: (json['committee_count'] as num?)?.toInt(),
      boardCount: (json['board_count'] as num?)?.toInt(),
      totalCount: (json['total_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CommitteeMembersDataImplToJson(
        _$CommitteeMembersDataImpl instance) =>
    <String, dynamic>{
      'members': instance.members?.map((e) => e.toJson()).toList(),
      'committee_count': instance.committeeCount,
      'board_count': instance.boardCount,
      'total_count': instance.totalCount,
    };
