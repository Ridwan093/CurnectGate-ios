import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'poll_item.dart';

part 'poll_details_data.freezed.dart';
part 'poll_details_data.g.dart';

@freezed
class PollDetailsData with _$PollDetailsData {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PollDetailsData({PollItem? poll}) = _PollDetailsData;

  factory PollDetailsData.fromJson(Map<String, dynamic> json) =>
      _$PollDetailsDataFromJson(json);

  factory PollDetailsData.safeFromJson(Map<String, dynamic>? json) {
    return PollDetailsData(
      poll: PollItem.safeFromJson(NullSafetyHelper.safeMap(json?['poll'])),
    );
  }

  factory PollDetailsData.empty() => const PollDetailsData(poll: null);
}
