// latest_comment.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'latest_comment.freezed.dart';
part 'latest_comment.g.dart';

@freezed
class LatestComment with _$LatestComment {
  const factory LatestComment({
    @Default('') String comment,
    @Default('') String user,
    required DateTime createdAt,
  }) = _LatestComment;

  factory LatestComment.fromJson(Map<String, dynamic> json) =>
      _$LatestCommentFromJson(json);

  factory LatestComment.safeFromJson(Map<String, dynamic>? json) => LatestComment(
        comment: NullSafetyHelper.safeString(json?['comment']),
        user: NullSafetyHelper.safeString(json?['user']),
        createdAt: NullSafetyHelper.safeDateTime(json?['created_at']) ,
      );
}
