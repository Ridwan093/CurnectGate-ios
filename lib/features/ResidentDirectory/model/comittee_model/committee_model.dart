// committee_model.dart
import 'package:freezed_annotation/freezed_annotation.dart';
import 'committee_category_model.dart';
import 'meeting_schedule_model.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'committee_model.freezed.dart';
part 'committee_model.g.dart';

@freezed
class Committee with _$Committee {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Committee({
    int? id,
    String? name,
    String? description,
    CommitteeCategory? category,
    String? status,
    int? memberCount,
    String? chairperson,
    String? secretary,
    DateTime? nextMeeting,
    DateTime? establishedDate,
    MeetingSchedule? meetingSchedule,
    String? meetingLocation,
    List<String>? objectives,
    List<String>? achievements,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _Committee;

  factory Committee.fromJson(Map<String, dynamic> json) =>
      _$CommitteeFromJson(json);

  factory Committee.fromSafeJson(Map<String, dynamic> json) {
    return Committee(
      id: NullSafetyHelper.safeInt(json['id']),
      name: NullSafetyHelper.safeString(json['name']),
      description: NullSafetyHelper.safeString(json['description']),
      category: NullSafetyHelper.safeModel(
        json['category'],
        CommitteeCategory.fromSafeJson,
        CommitteeCategory.empty(),
      ),
      status: NullSafetyHelper.safeString(json['status']),
      memberCount: NullSafetyHelper.safeInt(json['member_count']),
      chairperson: NullSafetyHelper.safeString(json['chairperson']),
      secretary: NullSafetyHelper.safeString(json['secretary']),
      nextMeeting: NullSafetyHelper.safeDateTime(json['next_meeting']),
      establishedDate: NullSafetyHelper.safeDateTime(json['established_date']),
      meetingSchedule: NullSafetyHelper.safeModel(
        json['meeting_schedule'],
        MeetingSchedule.fromSafeJson,
        MeetingSchedule.empty(),
      ),
      meetingLocation: NullSafetyHelper.safeString(json['meeting_location']),
      objectives: NullSafetyHelper.safeStringList(json['objectives']),
      achievements: NullSafetyHelper.safeStringList(json['achievements']),
      createdAt: NullSafetyHelper.safeDateTime(json['created_at']),
      updatedAt: NullSafetyHelper.safeDateTime(json['updated_at']),
    );
  }

  factory Committee.empty() => const Committee(
        id: null,
        name: null,
        description: null,
        category: null,
        status: null,
        memberCount: null,
        chairperson: null,
        secretary: null,
        nextMeeting: null,
        establishedDate: null,
        meetingSchedule: null,
        meetingLocation: null,
        objectives: null,
        achievements: null,
        createdAt: null,
        updatedAt: null,
      );
}