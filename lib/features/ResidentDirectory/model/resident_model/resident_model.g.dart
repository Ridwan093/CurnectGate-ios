// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resident_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResidentImpl _$$ResidentImplFromJson(Map<String, dynamic> json) =>
    _$ResidentImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      firstname: json['firstname'] as String? ?? '',
      lastname: json['lastname'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      memberCode: json['member_code'] as String? ?? '',
      profilePhoto: json['profile_photo'] as String?,
      committees: (json['committees'] as List<dynamic>?)
              ?.map((e) => CommitteeMember.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      boardPositions: (json['board_positions'] as List<dynamic>?)
              ?.map((e) => BoardPosition.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      isCommitteeMember: json['is_committee_member'] as bool? ?? false,
      isBoardMember: json['is_board_member'] as bool? ?? false,
      leadershipRoles: (json['leadership_roles'] as List<dynamic>?)
              ?.map((e) => LeadershipRole.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      joinedDate: DateTime.parse(json['joined_date'] as String),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$ResidentImplToJson(_$ResidentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'full_name': instance.fullName,
      'member_code': instance.memberCode,
      'profile_photo': instance.profilePhoto,
      'committees': instance.committees.map((e) => e.toJson()).toList(),
      'board_positions':
          instance.boardPositions.map((e) => e.toJson()).toList(),
      'is_committee_member': instance.isCommitteeMember,
      'is_board_member': instance.isBoardMember,
      'leadership_roles':
          instance.leadershipRoles.map((e) => e.toJson()).toList(),
      'joined_date': instance.joinedDate.toIso8601String(),
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
    };
