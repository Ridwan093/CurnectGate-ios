import 'package:freezed_annotation/freezed_annotation.dart';
import 'comment_data.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'comment_response.freezed.dart';
part 'comment_response.g.dart';

@freezed
class CommentResponse with _$CommentResponse {
  const factory CommentResponse({
    bool? status,
    String? message,
    int? code,
    CommentData? data,
  }) = _CommentResponse;

  factory CommentResponse.safeFromJson(Map<String, dynamic>? json) {
    return CommentResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: json?['data'] == null
          ? null
          : CommentData.safeFromJson(json?['data']),
    );
  }

  factory CommentResponse.fromJson(Map<String, dynamic> json) =>
      _$CommentResponseFromJson(json);
}
