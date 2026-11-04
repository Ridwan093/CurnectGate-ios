import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'polls_data.dart';


part 'polls_response.freezed.dart';
part 'polls_response.g.dart';

@freezed
class PollsResponse with _$PollsResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PollsResponse({
    bool? status,
    String? message,
    int? code,
    PollsData? data,
  }) = _PollsResponse;

  factory PollsResponse.fromJson(Map<String, dynamic> json) =>
      _$PollsResponseFromJson(json);

  factory PollsResponse.safeFromJson(Map<String, dynamic>? json) {
    return PollsResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: PollsData.safeFromJson(json?['data']),
    );
  }

  factory PollsResponse.empty() =>
      PollsResponse(status: false, message: '', code: 0, data: PollsData.empty());
}
