


class StatusHistoryResponse {
  final bool status;
  final String message;
  final int code;
  final HistoryData data;

  StatusHistoryResponse({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  factory StatusHistoryResponse.fromJson(Map<String, dynamic> json) {
    return StatusHistoryResponse(
      status: json['status'],
      message: json['message'],
      code: json['code'],
      data: HistoryData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'code': code,
      'data': data.toJson(),
    };
  }
}

class HistoryData {
  final List<HistoryItem> history;
  final int total;

  HistoryData({
    required this.history,
    required this.total,
  });

  factory HistoryData.fromJson(Map<String, dynamic> json) {
    return HistoryData(
      history: (json['history'] as List)
          .map((item) => HistoryItem.fromJson(item))
          .toList(),
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'history': history.map((item) => item.toJson()).toList(),
      'total': total,
    };
  }
}

class HistoryItem {
  final int id;
  final String status;
  final ChangedBy changedBy;
  final String notes;
  final DateTime changedAt;
  final String timeAgo;

  HistoryItem({
    required this.id,
    required this.status,
    required this.changedBy,
    required this.notes,
    required this.changedAt,
    required this.timeAgo,
  });

  factory HistoryItem.fromJson(Map<String, dynamic> json) {
    return HistoryItem(
      id: json['id'],
      status: json['status'],
      changedBy: ChangedBy.fromJson(json['changed_by']),
      notes: json['notes'],
      changedAt: DateTime.parse(json['changed_at']),
      timeAgo: json['time_ago'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'status': status,
      'changed_by': changedBy.toJson(),
      'notes': notes,
      'changed_at': changedAt.toIso8601String(),
      'time_ago': timeAgo,
    };
  }
}

class ChangedBy {
  final int id;
  final String name;
  final String role;

  ChangedBy({
    required this.id,
    required this.name,
    required this.role,
  });

  factory ChangedBy.fromJson(Map<String, dynamic> json) {
    return ChangedBy(
      id: json['id'],
      name: json['name'],
      role: json['role'],
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
