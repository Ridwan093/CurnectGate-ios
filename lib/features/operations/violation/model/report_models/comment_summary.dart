import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'latest_comment.dart';

part 'comment_summary.freezed.dart';
part 'comment_summary.g.dart';

@freezed
class CommentSummary with _$CommentSummary {
  @JsonSerializable(explicitToJson: true)
  const factory CommentSummary({
    @Default(0) int totalComments,
    @Default(0) int publicComments,
    @Default(0) int internalComments,
    LatestComment? latestComment,
  }) = _CommentSummary;

  factory CommentSummary.fromJson(Map<String, dynamic> json) =>
      _$CommentSummaryFromJson(json);

  factory CommentSummary.safeFromJson(Map<String, dynamic>? json) =>
      CommentSummary(
        totalComments: NullSafetyHelper.safeInt(json?['total_comments']),
        publicComments: NullSafetyHelper.safeInt(json?['public_comments']),
        internalComments: NullSafetyHelper.safeInt(json?['internal_comments']),
        latestComment: NullSafetyHelper.safeModel<LatestComment>(
          json?['latest_comment'],
          LatestComment.fromJson,
          null,
        ),
      );
}
