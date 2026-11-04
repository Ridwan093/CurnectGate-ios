class PermissionResponse {
  final bool status;
  final String message;
  final int code;
  final PermissionData data;

  PermissionResponse({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  factory PermissionResponse.fromJson(Map<String, dynamic> json) {
    return PermissionResponse(
      status: json['status'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      code: json['code'] as int? ?? 0,
      data: PermissionData.fromJson(json['data'] as Map<String, dynamic>? ?? {}),
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

class PermissionData {
  final List<Permission> permissions;

  PermissionData({required this.permissions});

  factory PermissionData.fromJson(Map<String, dynamic> json) {
    return PermissionData(
      permissions: (json['permission'] as List? ?? [])
          .map((e) => Permission.fromJson(e as Map<String, dynamic>? ?? {}))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'permission': permissions.map((e) => e.toJson()).toList(),
    };
  }
}

class Permission {
  final String slug;
  final String name;

  Permission({required this.slug, required this.name});

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      slug: json['slug'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'slug': slug,
      'name': name,
    };
  }
}