import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'comment_user.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Comment({
    int? id,
    int? violationId,
    CommentUser? user,
    String? comment,
    bool? isInternal,
    bool? hasMedia,
    String? mediaUrl,
    String? createdAt,
    String? updatedAt,
    bool? canEdit,
    bool? canDelete,
  }) = _Comment;

  factory Comment.safeFromJson(Map<String, dynamic>? json) {
    return Comment(
      id: NullSafetyHelper.safeInt(json?['id']),
      violationId: NullSafetyHelper.safeInt(json?['violation_id']),
      user:
          json?['user'] == null
              ? null
              : CommentUser.safeFromJson(json?['user']),
      comment: NullSafetyHelper.safeString(json?['comment']),
      isInternal: NullSafetyHelper.safeBool(json?['is_internal']),
      hasMedia: NullSafetyHelper.safeBool(json?['has_media']),
      mediaUrl: NullSafetyHelper.safeString(json?['media_url']),
      createdAt: NullSafetyHelper.safeString(json?['created_at']),
      updatedAt: NullSafetyHelper.safeString(json?['updated_at']),
      canEdit: NullSafetyHelper.safeBool(json?['can_edit']),
      canDelete: NullSafetyHelper.safeBool(json?['can_delete']),
    );
  }

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
