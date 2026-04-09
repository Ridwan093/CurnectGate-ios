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
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Violation({
    @Default(0) int id,
    @JsonKey(name: 'reference_code') @Default('') String referenceCode,
    @JsonKey(name: 'violation_code') @Default('') String violationCode,
    Category? category,
    Estate? estate,
    User? reporter,
    @JsonKey(name: 'reported_user') User? reportedUser,
    @JsonKey(name: 'assigned_to') User? assignedTo,
    @JsonKey(name: 'property_owner') User? propertyOwner,
    @JsonKey(name: 'location_details') LocationDetails? locationDetails,
    @Default('') String description,
    Evidence? evidence,
    @Default('') String status,
    @JsonKey(name: 'status_badge') @Default('') String statusBadge,
    @Default('') String priority,
    @JsonKey(name: 'priority_badge') @Default('') String priorityBadge,
    @JsonKey(name: 'is_anonymous') @Default(false) bool isAnonymous,
    @JsonKey(name: 'is_open') @Default(false) bool isOpen,
    @JsonKey(name: 'is_closed') @Default(false) bool isClosed,
    @JsonKey(name: 'comments_summary') CommentSummary? commentsSummary,
    @JsonKey(name: 'created_at') @Default('') String createdAt,
    @JsonKey(name: 'updated_at') @Default('') String updatedAt,
  }) = _Violation;

  factory Violation.fromJson(Map<String, dynamic> json) => _$ViolationFromJson(json);

  factory Violation.safeFromJson(Map<String, dynamic>? json) {
    return Violation(
      id: NullSafetyHelper.safeInt(json?['id']),
      referenceCode: NullSafetyHelper.safeString(json?['reference_code']),
      violationCode: NullSafetyHelper.safeString(json?['violation_code']),
      category: json?['category'] != null ? Category.safeFromJson(json?['category']) : null,
      estate: json?['estate'] != null ? Estate.fromSafeJson(json?['estate']) : null,
      reporter: json?['reporter'] != null ? User.safeFromJson(json?['reporter']) : null,
      reportedUser: json?['reported_user'] != null ? User.safeFromJson(json?['reported_user']) : null,
      assignedTo: json?['assigned_to'] != null ? User.safeFromJson(json?['assigned_to']) : null,
      propertyOwner: json?['property_owner'] != null ? User.safeFromJson(json?['property_owner']) : null,
      locationDetails: json?['location_details'] != null ? LocationDetails.safeFromJson(json?['location_details']) : null,
      description: NullSafetyHelper.safeString(json?['description']),
      evidence: json?['evidence'] != null ? Evidence.safeFromJson(json?['evidence']) : null,
      status: NullSafetyHelper.safeString(json?['status']),
      statusBadge: NullSafetyHelper.safeString(json?['status_badge']),
      priority: NullSafetyHelper.safeString(json?['priority']),
      priorityBadge: NullSafetyHelper.safeString(json?['priority_badge']),
      isAnonymous: NullSafetyHelper.safeBool(json?['is_anonymous']),
      isOpen: NullSafetyHelper.safeBool(json?['is_open']),
      isClosed: NullSafetyHelper.safeBool(json?['is_closed']),
      commentsSummary: json?['comments_summary'] != null ? CommentSummary.safeFromJson(json?['comments_summary']) : null,
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
    );
  }
}
