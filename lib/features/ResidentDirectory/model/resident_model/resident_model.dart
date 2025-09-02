// resident_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'committee_member_model.dart';
import 'board_position_model.dart';
import 'leadership_role_model.dart';

part 'resident_model.freezed.dart';
part 'resident_model.g.dart';

@freezed
class Resident with _$Resident {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Resident({
    @Default(0) int id,
    @Default('') String firstname,
    @Default('') String lastname,
    @Default('') String fullName,
    @Default('') String memberCode,
    String? profilePhoto,
    @Default([]) List<CommitteeMember> committees,
    @Default([]) List<BoardPosition> boardPositions,
    @Default(false) bool isCommitteeMember,
    @Default(false) bool isBoardMember,
    @Default([]) List<LeadershipRole> leadershipRoles,
    required DateTime joinedDate,
    String? email,
    String? phone,
    String? address,
  }) = _Resident;

  factory Resident.fromJson(Map<String, dynamic> json) =>
      _$ResidentFromJson(json);

  factory Resident.fromSafeJson(Map<String, dynamic> json) {
    return Resident(
      id: NullSafetyHelper.safeInt(json['id']) ?? 0,
      firstname: NullSafetyHelper.safeString(json['firstname']) ?? '',
      lastname: NullSafetyHelper.safeString(json['lastname']) ?? '',
      fullName: NullSafetyHelper.safeString(json['full_name']) ?? '',
      memberCode: NullSafetyHelper.safeString(json['member_code']) ?? '',
      profilePhoto: NullSafetyHelper.safeString(json['profile_photo']),
      committees: _committeesFromJson(json['committees']),
      boardPositions: _boardPositionsFromJson(json['board_positions']),
      isCommitteeMember: NullSafetyHelper.safeBool(json['is_committee_member']) ?? false,
      isBoardMember: NullSafetyHelper.safeBool(json['is_board_member']) ?? false,
      leadershipRoles: _leadershipRolesFromJson(json['leadership_roles']),
      joinedDate: NullSafetyHelper.safeDateTime(json['joined_date']) ?? DateTime.now(),
      email: NullSafetyHelper.safeString(json['email']),
      phone: NullSafetyHelper.safeString(json['phone']),
      address: NullSafetyHelper.safeString(json['address']),
    );
  }

  static List<CommitteeMember> _committeesFromJson(dynamic value) {
    if (value == null) return [];
    if (value is! List) return [];

    return value
        .map((item) => NullSafetyHelper.safeModel(
              item,
              CommitteeMember.fromSafeJson,
              CommitteeMember.empty(),
            ))
        .whereType<CommitteeMember>()
        .toList();
  }

  static List<BoardPosition> _boardPositionsFromJson(dynamic value) {
    if (value == null) return [];
    if (value is! List) return [];

    return value
        .map((item) => NullSafetyHelper.safeModel(
              item,
              BoardPosition.fromSafeJson,
              BoardPosition.empty(),
            ))
        .whereType<BoardPosition>()
        .toList();
  }

  static List<LeadershipRole> _leadershipRolesFromJson(dynamic value) {
    if (value == null) return [];
    if (value is! List) return [];

    return value
        .map((item) => NullSafetyHelper.safeModel(
              item,
              LeadershipRole.fromSafeJson,
              LeadershipRole.empty(),
            ))
        .whereType<LeadershipRole>()
        .toList();
  }

  factory Resident.empty() => Resident(
        id: 0,
        firstname: '',
        lastname: '',
        fullName: '',
        memberCode: '',
        profilePhoto: null,
        committees: [],
        boardPositions: [],
        isCommitteeMember: false,
        isBoardMember: false,
        leadershipRoles: [],
        joinedDate: DateTime.now(),
        email: null,
        phone: null,
        address: null,
      );
}