class CommentResponse {
  final bool status;
  final String message;
  final int code;
  final CommentData data;

  CommentResponse({
    required this.status,
    required this.message,
    required this.code,
    required this.data,
  });

  factory CommentResponse.fromJson(Map<String, dynamic> json) {
    return CommentResponse(
      status: json['status'],
      message: json['message'],
      code: json['code'],
      data: CommentData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'code': code,
        'data': data.toJson(),
      };
}

class CommentData {
  final List<Comment> comments;
  final int total;

  CommentData({
    required this.comments,
    required this.total,
  });

  factory CommentData.fromJson(Map<String, dynamic> json) {
    return CommentData(
      comments: (json['comments'] as List)
          .map((e) => Comment.fromJson(e))
          .toList(),
      total: json['total'],
    );
  }

  Map<String, dynamic> toJson() => {
        'comments': comments.map((e) => e.toJson()).toList(),
        'total': total,
      };
}

class Comment {
  final int id;
  final int violationId;
  final CommentUser user;
  final String comment;
  final bool isInternal;
  final bool hasMedia;
  final String? mediaUrl;
  final String createdAt;
  final String updatedAt;
  final bool canEdit;
  final bool canDelete;

  Comment({
    required this.id,
    required this.violationId,
    required this.user,
    required this.comment,
    required this.isInternal,
    required this.hasMedia,
    this.mediaUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.canEdit,
    required this.canDelete,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      violationId: json['violation_id'],
      user: CommentUser.fromJson(json['user']),
      comment: json['comment'],
      isInternal: json['is_internal'],
      hasMedia: json['has_media'],
      mediaUrl: json['media_url'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      canEdit: json['can_edit'],
      canDelete: json['can_delete'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'violation_id': violationId,
        'user': user.toJson(),
        'comment': comment,
        'is_internal': isInternal,
        'has_media': hasMedia,
        'media_url': mediaUrl,
        'created_at': createdAt,
        'updated_at': updatedAt,
        'can_edit': canEdit,
        'can_delete': canDelete,
      };
}

class CommentUser {
  final int id;
  final String name;
  final String role;
  final String? avatar;

  CommentUser({
    required this.id,
    required this.name,
    required this.role,
    this.avatar,
  });

  factory CommentUser.fromJson(Map<String, dynamic> json) {
    return CommentUser(
      id: json['id'],
      name: json['name'],
      role: json['role'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'role': role,
        'avatar': avatar,
      };
}
