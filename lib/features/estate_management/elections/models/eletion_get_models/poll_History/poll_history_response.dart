import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'poll_history_data.dart';


part 'poll_history_response.freezed.dart';
part 'poll_history_response.g.dart';

@freezed
class PollHistoryResponse with _$PollHistoryResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PollHistoryResponse({
    bool? status,
    String? message,
    int? code,
    PollHistoryData? data,
  }) = _PollHistoryResponse;

  factory PollHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$PollHistoryResponseFromJson(json);

  factory PollHistoryResponse.safeFromJson(Map<String, dynamic>? json) {
    return PollHistoryResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: PollHistoryData.safeFromJson(json?['data']),
    );
  }

  factory PollHistoryResponse.empty() => const PollHistoryResponse(
        status: false,
        message: '',
        code: 0,
        data: PollHistoryData(),
      );
}
