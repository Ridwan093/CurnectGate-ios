import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'poll_statistics.dart';
import 'position_item_details.dart';
import 'user_status.dart';

part 'poll_item.freezed.dart';
part 'poll_item.g.dart';

@freezed
class PollItem with _$PollItem {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PollItem({
    int? id,
    String? title,
    String? description,
    String? type,
    String? status,
    String? opensAt,
    String? closesAt,
    bool? isAnonymous,
    String? rulesAndRegulations,
    List<PositionItemDetails>? positions,
    UserStatus? userStatus,
    PollStatistics? statistics,
  }) = _PollItem;

  factory PollItem.fromJson(Map<String, dynamic> json) =>
      _$PollItemFromJson(json);

  factory PollItem.safeFromJson(Map<String, dynamic>? json) {
    return PollItem(
      id: NullSafetyHelper.safeInt(json?['id']),
      title: NullSafetyHelper.safeString(json?['title']),
      description: NullSafetyHelper.safeString(json?['description']),
      type: NullSafetyHelper.safeString(json?['type']),
      status: NullSafetyHelper.safeString(json?['status']),
      opensAt: NullSafetyHelper.safeString(json?['opens_at']),
      closesAt: NullSafetyHelper.safeString(json?['closes_at']),
      isAnonymous: NullSafetyHelper.safeBool(json?['is_anonymous']),
      rulesAndRegulations: NullSafetyHelper.safeString(
        json?['rules_and_regulations'],
      ),
      positions:
          (NullSafetyHelper.safeList(json?['positions']) )
              .map((e) => PositionItemDetails.safeFromJson(e))
              .toList(),
      userStatus: UserStatus.safeFromJson(
        NullSafetyHelper.safeMap(json?['user_status']),
      ),
      statistics: PollStatistics.safeFromJson(
        NullSafetyHelper.safeMap(json?['statistics']),
      ),
    );
  }

  factory PollItem.empty() => const PollItem(
    id: 0,
    title: '',
    description: '',
    type: '',
    status: '',
    opensAt: '',
    closesAt: '',
    isAnonymous: false,
    rulesAndRegulations: '',
    positions: [],
    userStatus: null,
    statistics: null,
  );
}
