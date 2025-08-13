// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'violation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViolationImpl _$$ViolationImplFromJson(Map<String, dynamic> json) =>
    _$ViolationImpl(
      id: (json['id'] as num).toInt(),
      referenceCode: json['reference_code'] as String,
      violationCode: json['violation_code'] as String,
      category: Category.fromJson(json['category'] as Map<String, dynamic>),
      estate: Estate.fromJson(json['estate'] as Map<String, dynamic>),
      reporter: User.fromJson(json['reporter'] as Map<String, dynamic>),
      reportedUser: json['reported_user'] == null
          ? null
          : User.fromJson(json['reported_user'] as Map<String, dynamic>),
      assignedTo: json['assigned_to'] == null
          ? null
          : User.fromJson(json['assigned_to'] as Map<String, dynamic>),
      propertyOwner:
          User.fromJson(json['property_owner'] as Map<String, dynamic>),
      locationDetails: LocationDetails.fromJson(
          json['location_details'] as Map<String, dynamic>),
      description: json['description'] as String,
      evidence: Evidence.fromJson(json['evidence'] as Map<String, dynamic>),
      status: json['status'] as String,
      statusBadge: json['status_badge'] as String,
      priority: json['priority'] as String,
      priorityBadge: json['priority_badge'] as String,
      isAnonymous: json['is_anonymous'] as bool,
      isOpen: json['is_open'] as bool,
      isClosed: json['is_closed'] as bool,
      commentsSummary: CommentSummary.fromJson(
          json['comments_summary'] as Map<String, dynamic>),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
    );

Map<String, dynamic> _$$ViolationImplToJson(_$ViolationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'reference_code': instance.referenceCode,
      'violation_code': instance.violationCode,
      'category': instance.category.toJson(),
      'estate': instance.estate.toJson(),
      'reporter': instance.reporter.toJson(),
      'reported_user': instance.reportedUser?.toJson(),
      'assigned_to': instance.assignedTo?.toJson(),
      'property_owner': instance.propertyOwner.toJson(),
      'location_details': instance.locationDetails.toJson(),
      'description': instance.description,
      'evidence': instance.evidence.toJson(),
      'status': instance.status,
      'status_badge': instance.statusBadge,
      'priority': instance.priority,
      'priority_badge': instance.priorityBadge,
      'is_anonymous': instance.isAnonymous,
      'is_open': instance.isOpen,
      'is_closed': instance.isClosed,
      'comments_summary': instance.commentsSummary.toJson(),
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
