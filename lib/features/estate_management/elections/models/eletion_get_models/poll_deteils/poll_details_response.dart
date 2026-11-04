import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'poll_details_data.dart';


part 'poll_details_response.freezed.dart';
part 'poll_details_response.g.dart';

@freezed
class PollDetailsResponse with _$PollDetailsResponse {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PollDetailsResponse({
    bool? status,
    String? message,
    int? code,
    PollDetailsData? data,
  }) = _PollDetailsResponse;

  factory PollDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$PollDetailsResponseFromJson(json);

  factory PollDetailsResponse.safeFromJson(Map<String, dynamic>? json) {
    return PollDetailsResponse(
      status: NullSafetyHelper.safeBool(json?['status']),
      message: NullSafetyHelper.safeString(json?['message']),
      code: NullSafetyHelper.safeInt(json?['code']),
      data: PollDetailsData.safeFromJson(json?['data']),
    );
  }

  factory PollDetailsResponse.empty() =>
      PollDetailsResponse(status: false, message: '', code: 0, data: PollDetailsData.empty());
}
