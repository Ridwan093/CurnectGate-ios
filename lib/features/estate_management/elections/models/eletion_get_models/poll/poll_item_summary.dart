import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/poll_deteils/poll_statistics.dart';
import 'package:curnectgate/features/estate_management/elections/models/eletion_get_models/poll_deteils/user_status.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'poll_item_summary.freezed.dart';
part 'poll_item_summary.g.dart';

@freezed
class PollItemSummary with _$PollItemSummary {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PollItemSummary({
    int? id,
    String? title,
    String? description,
    String? type,
    String? status,
    String? opensAt,
    String? closesAt,
    bool? isAnonymous,
    bool? showResultsBeforeClose,
    int? positionsCount,
    UserStatus? userStatus,
    PollStatistics? statistics,
  }) = _PollItemSummary;

  factory PollItemSummary.fromJson(Map<String, dynamic> json) =>
      _$PollItemSummaryFromJson(json);

  factory PollItemSummary.safeFromJson(Map<String, dynamic>? json) {
    return PollItemSummary(
      id: NullSafetyHelper.safeInt(json?['id']),
      title: NullSafetyHelper.safeString(json?['title']),
      description: NullSafetyHelper.safeString(json?['description']),
      type: NullSafetyHelper.safeString(json?['type']),
      status: NullSafetyHelper.safeString(json?['status']),
      opensAt: NullSafetyHelper.safeString(json?['opens_at']),
      closesAt: NullSafetyHelper.safeString(json?['closes_at']),
      isAnonymous: NullSafetyHelper.safeBool(json?['is_anonymous']),
      showResultsBeforeClose: NullSafetyHelper.safeBool(
        json?['show_results_before_close'],
      ),
      positionsCount: NullSafetyHelper.safeInt(json?['positions_count']),
      userStatus: UserStatus.safeFromJson(
        NullSafetyHelper.safeMap(json?['user_status']),
      ),
      statistics: PollStatistics.safeFromJson(
        NullSafetyHelper.safeMap(json?['statistics']),
      ),
    );
  }

  factory PollItemSummary.empty() => const PollItemSummary(
    id: 0,
    title: '',
    description: '',
    type: '',
    status: '',
    opensAt: '',
    closesAt: '',
    isAnonymous: false,
    showResultsBeforeClose: false,
    positionsCount: 0,
    userStatus: null,
    statistics: null,
  );
}
