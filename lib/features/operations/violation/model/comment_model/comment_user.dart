import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'comment_user.freezed.dart';
part 'comment_user.g.dart';

@freezed
class CommentUser with _$CommentUser {
  const factory CommentUser({
    int? id,
    String? name,
    String? role,
    String? avatar,
  }) = _CommentUser;

  factory CommentUser.safeFromJson(Map<String, dynamic>? json) {
    return CommentUser(
      id: NullSafetyHelper.safeInt(json?['id']),
      name: NullSafetyHelper.safeString(json?['name']),
      role: NullSafetyHelper.safeString(json?['role']),
      avatar: NullSafetyHelper.safeString(json?['avatar']),
    );
  }

  factory CommentUser.fromJson(Map<String, dynamic> json) =>
      _$CommentUserFromJson(json);
}
