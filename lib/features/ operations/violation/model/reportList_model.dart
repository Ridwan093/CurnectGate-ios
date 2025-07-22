class ViolationResponse {
  final bool status;
  final String message;
  final int code;
  final ViolationData data;

  ViolationResponse({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  factory ViolationResponse.fromJson(Map<String, dynamic> json) =>
      ViolationResponse(
        status: json['status'],
        message: json['message'],
        code: json['code'],
        data: ViolationData.fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'message': message,
    'code': code,
    'data': data.toJson(),
  };
}

class ViolationData {
  final List<Violation> violations;
  final Pagination pagination;
  final Summary summary;

  ViolationData({
    required this.violations,
    required this.pagination,
    required this.summary,
  });

  factory ViolationData.fromJson(Map<String, dynamic> json) => ViolationData(
    violations:
        (json['violations'] as List).map((e) => Violation.fromJson(e)).toList(),
    pagination: Pagination.fromJson(json['pagination']),
    summary: Summary.fromJson(json['summary']),
  );

  Map<String, dynamic> toJson() => {
    'violations': violations.map((e) => e.toJson()).toList(),
    'pagination': pagination.toJson(),
    'summary': summary.toJson(),
  };
}

class Violation {
  final int id;
  final String referenceCode;
  final String violationCode;
  final Category category;
  final Estate estate;
  final User reporter;
  final User? reportedUser;
  final User? assignedTo;
  final User propertyOwner;
  final LocationDetails locationDetails;
  final String description;
  final Evidence evidence;
  final String status;
  final String statusBadge;
  final String priority;
  final String priorityBadge;
  final bool isAnonymous;
  final bool isOpen;
  final bool isClosed;
  final CommentSummary commentsSummary;
  final Permissions permissions;
  final String createdAt;
  final String updatedAt;

  Violation({
    required this.id,
    required this.referenceCode,
    required this.violationCode,
    required this.category,
    required this.estate,
    required this.reporter,
    this.reportedUser,
    this.assignedTo,
    required this.propertyOwner,
    required this.locationDetails,
    required this.description,
    required this.evidence,
    required this.status,
    required this.statusBadge,
    required this.priority,
    required this.priorityBadge,
    required this.isAnonymous,
    required this.isOpen,
    required this.isClosed,
    required this.commentsSummary,
    required this.permissions,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Violation.fromJson(Map<String, dynamic> json) => Violation(
    id: json['id'],
    referenceCode: json['reference_code'],
    violationCode: json['violation_code'],
    category: Category.fromJson(json['category']),
    estate: Estate.fromJson(json['estate']),
    reporter: User.fromJson(json['reporter']),
    reportedUser:
        json['reported_user'] != null
            ? User.fromJson(json['reported_user'])
            : null,
    assignedTo:
        json['assigned_to'] != null ? User.fromJson(json['assigned_to']) : null,
    propertyOwner: User.fromJson(json['property_owner']),
    locationDetails: LocationDetails.fromJson(json['location_details']),
    description: json['description'],
    evidence: Evidence.fromJson(json['evidence']),
    status: json['status'],
    statusBadge: json['status_badge'],
    priority: json['priority'],
    priorityBadge: json['priority_badge'],
    isAnonymous: json['is_anonymous'],
    isOpen: json['is_open'],
    isClosed: json['is_closed'],
    commentsSummary: CommentSummary.fromJson(json['comments_summary']),
    permissions: Permissions.fromJson(json['permissions']),
    createdAt: json['created_at'],
    updatedAt: json['updated_at'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'reference_code': referenceCode,
    'violation_code': violationCode,
    'category': category.toJson(),
    'estate': estate.toJson(),
    'reporter': reporter.toJson(),
    'reported_user': reportedUser?.toJson(),
    'assigned_to': assignedTo?.toJson(),
    'property_owner': propertyOwner.toJson(),
    'location_details': locationDetails.toJson(),
    'description': description,
    'evidence': evidence.toJson(),
    'status': status,
    'status_badge': statusBadge,
    'priority': priority,
    'priority_badge': priorityBadge,
    'is_anonymous': isAnonymous,
    'is_open': isOpen,
    'is_closed': isClosed,
    'comments_summary': commentsSummary.toJson(),
    'permissions': permissions.toJson(),
    'created_at': createdAt,
    'updated_at': updatedAt,
  };
}

class Category {
  final int id;
  final String name;
  final String type;

  Category({required this.id, required this.name, required this.type});

  factory Category.fromJson(Map<String, dynamic> json) =>
      Category(id: json['id'], name: json['name'], type: json['type']);

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'type': type};
}

class Estate {
  final int id;
  final String name;
  final String code;

  Estate({required this.id, required this.name, required this.code});

  factory Estate.fromJson(Map<String, dynamic> json) =>
      Estate(id: json['id'], name: json['name'], code: json['code']);

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'code': code};
}

class User {
  final int id;
  final String name;
  final String? memberCode;
  final String role;
  final bool isSelf;
  final bool? isCurrentUser;

  User({
    required this.id,
    required this.name,
    this.memberCode,
    required this.role,
    required this.isSelf,
    this.isCurrentUser,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    memberCode: json['member_code'],
    role: json['role'],
    isSelf: json['is_self'] ?? false,
    isCurrentUser: json['is_current_user'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'member_code': memberCode,
    'role': role,
    'is_self': isSelf,
    'is_current_user': isCurrentUser,
  };
}

class LocationDetails {
  final EstateAddress estateAddress;
  final String additionalLocation;
  final String formattedAddress;

  LocationDetails({
    required this.estateAddress,
    required this.additionalLocation,
    required this.formattedAddress,
  });

  factory LocationDetails.fromJson(Map<String, dynamic> json) =>
      LocationDetails(
        estateAddress: EstateAddress.fromJson(json['estate_address']),
        additionalLocation: json['additional_location'],
        formattedAddress: json['formatted_address'],
      );

  Map<String, dynamic> toJson() => {
    'estate_address': estateAddress.toJson(),
    'additional_location': additionalLocation,
    'formatted_address': formattedAddress,
  };
}

class EstateAddress {
  final int id;
  final String fullAddress;
  final String streetName;
  final String streetNumber;
  final String blockNumber;
  final String flatNumber;
  final String buildingName;
  final Coordinates coordinates;

  EstateAddress({
    required this.id,
    required this.fullAddress,
    required this.streetName,
    required this.streetNumber,
    required this.blockNumber,
    required this.flatNumber,
    required this.buildingName,
    required this.coordinates,
  });

  factory EstateAddress.fromJson(Map<String, dynamic> json) => EstateAddress(
    id: json['id'],
    fullAddress: json['full_address'],
    streetName: json['street_name'],
    streetNumber: json['street_number'],
    blockNumber: json['block_number'],
    flatNumber: json['flat_number'],
    buildingName: json['building_name'],
    coordinates: Coordinates.fromJson(json['coordinates']),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'full_address': fullAddress,
    'street_name': streetName,
    'street_number': streetNumber,
    'block_number': blockNumber,
    'flat_number': flatNumber,
    'building_name': buildingName,
    'coordinates': coordinates.toJson(),
  };
}

class Coordinates {
  final double lat;
  final double lng;

  Coordinates({required this.lat, required this.lng});

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      Coordinates(lat: json['lat'], lng: json['lng']);

  Map<String, dynamic> toJson() => {'lat': lat, 'lng': lng};
}

class Evidence {
  final List<String> mediaUrls;
  final int mediaCount;
  final bool hasEvidence;

  Evidence({
    required this.mediaUrls,
    required this.mediaCount,
    required this.hasEvidence,
  });

  factory Evidence.fromJson(Map<String, dynamic> json) => Evidence(
    mediaUrls: List<String>.from(json['media_urls']),
    mediaCount: json['media_count'],
    hasEvidence: json['has_evidence'],
  );

  Map<String, dynamic> toJson() => {
    'media_urls': mediaUrls,
    'media_count': mediaCount,
    'has_evidence': hasEvidence,
  };
}

class CommentSummary {
  final int totalComments;
  final int publicComments;
  final int internalComments;
  final LatestComment? latestComment;

  CommentSummary({
    required this.totalComments,
    required this.publicComments,
    required this.internalComments,
    this.latestComment,
  });

  factory CommentSummary.fromJson(Map<String, dynamic> json) => CommentSummary(
    totalComments: json['total_comments'],
    publicComments: json['public_comments'],
    internalComments: json['internal_comments'],
    latestComment:
        json['latest_comment'] != null
            ? LatestComment.fromJson(json['latest_comment'])
            : null,
  );

  Map<String, dynamic> toJson() => {
    'total_comments': totalComments,
    'public_comments': publicComments,
    'internal_comments': internalComments,
    'latest_comment': latestComment?.toJson(),
  };
}

class LatestComment {
  final String comment;
  final String user;
  final DateTime createdAt;

  LatestComment({
    required this.comment,
    required this.user,
    required this.createdAt,
  });

  factory LatestComment.fromJson(Map<String, dynamic> json) => LatestComment(
    comment: json['comment'],
    user: json['user'],
    createdAt: DateTime.parse(json['created_at']),
  );

  Map<String, dynamic> toJson() => {
    'comment': comment,
    'user': user,
    'created_at': createdAt.toIso8601String(),
  };
}

class Permissions {
  final bool canEdit;
  final bool canViewReporter;
  final bool canAssign;
  final bool canResolve;
  final bool canComment;
  final bool isPropertyOwner;

  Permissions({
    required this.canEdit,
    required this.canViewReporter,
    required this.canAssign,
    required this.canResolve,
    required this.canComment,
    required this.isPropertyOwner,
  });

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
    canEdit: json['can_edit'],
    canViewReporter: json['can_view_reporter'],
    canAssign: json['can_assign'],
    canResolve: json['can_resolve'],
    canComment: json['can_comment'],
    isPropertyOwner: json['is_property_owner'],
  );

  Map<String, dynamic> toJson() => {
    'can_edit': canEdit,
    'can_view_reporter': canViewReporter,
    'can_assign': canAssign,
    'can_resolve': canResolve,
    'can_comment': canComment,
    'is_property_owner': isPropertyOwner,
  };
}

class Pagination {
  final int currentPage;
  final int lastPage;
  final int perPage;
  final int total;
  final int from;
  final int to;

  Pagination({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
    required this.total,
    required this.from,
    required this.to,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
    currentPage: json['current_page'],
    lastPage: json['last_page'],
    perPage: json['per_page'],
    total: json['total'],
    from: json['from'],
    to: json['to'],
  );

  Map<String, dynamic> toJson() => {
    'current_page': currentPage,
    'last_page': lastPage,
    'per_page': perPage,
    'total': total,
    'from': from,
    'to': to,
  };
}

class Summary {
  final int total;
  final Map<String, int> byStatus;
  final Map<String, int> byPriority;
  final int anonymousReports;
  final dynamic avgResolutionTime;
  final int recentReports;
  final int overdueViolations;

  Summary({
    required this.total,
    required this.byStatus,
    required this.byPriority,
    required this.anonymousReports,
    required this.avgResolutionTime,
    required this.recentReports,
    required this.overdueViolations,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
    total: json['total'],
    byStatus: Map<String, int>.from(json['by_status']),
    byPriority: Map<String, int>.from(json['by_priority']),
    anonymousReports: json['anonymous_reports'],
    avgResolutionTime: json['avg_resolution_time'],
    recentReports: json['recent_reports'],
    overdueViolations: json['overdue_violations'],
  );

  Map<String, dynamic> toJson() => {
    'total': total,
    'by_status': byStatus,
    'by_priority': byPriority,
    'anonymous_reports': anonymousReports,
    'avg_resolution_time': avgResolutionTime,
    'recent_reports': recentReports,
    'overdue_violations': overdueViolations,
  };
}
