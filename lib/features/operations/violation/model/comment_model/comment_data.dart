import 'package:freezed_annotation/freezed_annotation.dart';
import 'comment.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'comment_data.freezed.dart';
part 'comment_data.g.dart';

@freezed
class CommentData with _$CommentData {
  const factory CommentData({
    List<Comment>? comments,
    int? total,
  }) = _CommentData;

  factory CommentData.safeFromJson(Map<String, dynamic>? json) {
    return CommentData(
      comments: NullSafetyHelper.safeList(json?['comments'])
          .map((e) => Comment.fromJson(e))
          .toList(),
      total: NullSafetyHelper.safeInt(json?['total']),
    );
  }

  factory CommentData.fromJson(Map<String, dynamic> json) =>
      _$CommentDataFromJson(json);
}
