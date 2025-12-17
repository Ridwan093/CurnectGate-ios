import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'candidate_details.dart';

part 'position_item_details.freezed.dart';
part 'position_item_details.g.dart';

@freezed
class PositionItemDetails with _$PositionItemDetails {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PositionItemDetails({
    int? id,
    String? title,
    String? description,
    int? positionOrder,
    int? minSelections,
    int? maxSelections,
    bool? isRequired,
    String? color,
    bool? userHasVoted,
    List<CandidateDetails>? candidates,
  }) = _PositionItemDetails;

  factory PositionItemDetails.fromJson(Map<String, dynamic> json) =>
      _$PositionItemDetailsFromJson(json);

  factory PositionItemDetails.safeFromJson(Map<String, dynamic>? json) {
    return PositionItemDetails(
      id: NullSafetyHelper.safeInt(json?['id']),
      title: NullSafetyHelper.safeString(json?['title']),
      description: NullSafetyHelper.safeString(json?['description']),
      positionOrder: NullSafetyHelper.safeInt(json?['position_order']),
      minSelections: NullSafetyHelper.safeInt(json?['min_selections']),
      maxSelections: NullSafetyHelper.safeInt(json?['max_selections']),
      isRequired: NullSafetyHelper.safeBool(json?['is_required']),
      color: NullSafetyHelper.safeString(json?['color']),
      userHasVoted: NullSafetyHelper.safeBool(json?['user_has_voted']),
      candidates:
          (NullSafetyHelper.safeList(json?['candidates']) )
              .map((e) => CandidateDetails.safeFromJson(e))
              .toList(),
    );
  }

  factory PositionItemDetails.empty() => const PositionItemDetails(
    id: 0,
    title: '',
    description: '',
    positionOrder: 0,
    minSelections: 0,
    maxSelections: 0,
    isRequired: false,
    color: '',
    userHasVoted: false,
    candidates: [],
  );
}
