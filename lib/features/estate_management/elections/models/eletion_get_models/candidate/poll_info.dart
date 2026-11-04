import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'poll_info.freezed.dart';
part 'poll_info.g.dart';

@freezed
class PollInfo with _$PollInfo {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PollInfo({
    int? id,
    String? title,
  }) = _PollInfo;

  factory PollInfo.fromJson(Map<String, dynamic> json) =>
      _$PollInfoFromJson(json);

  factory PollInfo.safeFromJson(Map<String, dynamic>? json) {
    return PollInfo(
      id: NullSafetyHelper.safeInt(json?['id']),
      title: NullSafetyHelper.safeString(json?['title']),
    );
  }

  factory PollInfo.empty() => const PollInfo(id: 0, title: '');
}
