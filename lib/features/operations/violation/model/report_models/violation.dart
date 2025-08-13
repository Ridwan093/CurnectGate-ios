import 'package:curnectgate/features/operations/OTP_Activation/model/estate.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'category.dart';

import 'user.dart';
import 'location_details.dart';
import 'evidence.dart';
import 'comment_summary.dart';

part 'violation.freezed.dart';
part 'violation.g.dart';

@freezed
class Violation with _$Violation {
  @JsonSerializable(explicitToJson: true)
  const factory Violation({
    required int id,
    @JsonKey(name: 'reference_code') required String referenceCode,
    @JsonKey(name: 'violation_code') required String violationCode,
    required Category category,
    required Estate estate,
    required User reporter,
    @JsonKey(name: 'reported_user') User? reportedUser,
    @JsonKey(name: 'assigned_to') User? assignedTo,
    @JsonKey(name: 'property_owner') required User propertyOwner,
    @JsonKey(name: 'location_details') required LocationDetails locationDetails,
    required String description,
    required Evidence evidence,
    required String status,
    @JsonKey(name: 'status_badge') required String statusBadge,
    required String priority,
    @JsonKey(name: 'priority_badge') required String priorityBadge,
    @JsonKey(name: 'is_anonymous') required bool isAnonymous,
    @JsonKey(name: 'is_open') required bool isOpen,
    @JsonKey(name: 'is_closed') required bool isClosed,
    @JsonKey(name: 'comments_summary') required CommentSummary commentsSummary,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
  }) = _Violation;

  factory Violation.fromJson(Map<String, dynamic> json) => _$ViolationFromJson(json);

  factory Violation.safeFromJson(Map<String, dynamic>? json) {
    return Violation(
      id: NullSafetyHelper.safeInt(json?['id']),
      referenceCode: NullSafetyHelper.safeString(json?['reference_code']),
      violationCode: NullSafetyHelper.safeString(json?['violation_code']),
      category: Category.safeFromJson(json?['category']),
      estate: Estate.fromSafeJson(json?['estate']),
      reporter: User.safeFromJson(json?['reporter']),
      reportedUser: User.safeFromJson(json?['reported_user']),
      assignedTo: User.safeFromJson(json?['assigned_to']),
      propertyOwner: User.safeFromJson(json?['property_owner']),
      locationDetails: LocationDetails.safeFromJson(json?['location_details']),
      description: NullSafetyHelper.safeString(json?['description']),
      evidence: Evidence.safeFromJson(json?['evidence']),
      status: NullSafetyHelper.safeString(json?['status']),
      statusBadge: NullSafetyHelper.safeString(json?['status_badge']),
      priority: NullSafetyHelper.safeString(json?['priority']),
      priorityBadge: NullSafetyHelper.safeString(json?['priority_badge']),
      isAnonymous: NullSafetyHelper.safeBool(json?['is_anonymous']),
      isOpen: NullSafetyHelper.safeBool(json?['is_open']),
      isClosed: NullSafetyHelper.safeBool(json?['is_closed']),
      commentsSummary: CommentSummary.safeFromJson(json?['comments_summary']),
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
    );
  }
}
