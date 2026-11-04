


class StatusHistoryResponse {
  final bool? status;
  final String? message;
  final int? code;
  final HistoryData? data;

  StatusHistoryResponse({
    this.status,
    this.message,
    this.code,
    this.data,
  });

  factory StatusHistoryResponse.fromJson(Map<String, dynamic> json) {
    return StatusHistoryResponse(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] != null ? HistoryData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'code': code,
      'data': data?.toJson(),
    };
  }
}

class HistoryData {
  final List<HistoryItem>? history;
  final int? total;

  HistoryData({
    this.history,
    this.total,
  });

  factory HistoryData.fromJson(Map<String, dynamic> json) {
    return HistoryData(
      history: json['history'] != null
          ? (json['history'] as List)
              .map((item) => HistoryItem.fromJson(item))
              .toList()
          : null,
      total: json['total'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'history': history?.map((item) => item.toJson()).toList(),
      'total': total,
    };
  }
}

class HistoryItem {
  final int? id;
  final String? status;
  final ChangedBy? changedBy;
  final String? notes;
  final DateTime? changedAt;
  final String? timeAgo;

  HistoryItem({
    this.id,
    this.status,
    this.changedBy,
    this.notes,
    this.changedAt,
    this.timeAgo,
  });

  factory HistoryItem.fromJson(Map<String, dynamic> json) {
    return HistoryItem(
      id: json['id'] as int?,
      status: json['status'] as String?,
      changedBy: json['changed_by'] != null ? ChangedBy.fromJson(json['changed_by']) : null,
      notes: json['notes'] as String?,
      changedAt: json['changed_at'] != null ? DateTime.tryParse(json['changed_at']) : null,
      timeAgo: json['time_ago'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'changed_by': changedBy?.toJson(),
      'notes': notes,
      'changed_at': changedAt?.toIso8601String(),
      'time_ago': timeAgo,
    };
  }
}

class ChangedBy {
  final int? id;
  final String? name;
  final String? role;

  ChangedBy({
    this.id,
    this.name,
    this.role,
  });

  factory ChangedBy.fromJson(Map<String, dynamic> json) {
    return ChangedBy(
      id: json['id'] as int?,
      name: json['name'] as String?,
      role: json['role'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'role': role,
    };
  }
}
