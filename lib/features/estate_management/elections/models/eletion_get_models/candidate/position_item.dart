import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'candidate_item.dart';

part 'position_item.freezed.dart';
part 'position_item.g.dart';

@freezed
class PositionItem with _$PositionItem {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory PositionItem({
    int? positionId,
    String? positionTitle,
    String? color,
    List<CandidateItem>? candidates,
  }) = _PositionItem;

  factory PositionItem.fromJson(Map<String, dynamic> json) =>
      _$PositionItemFromJson(json);

  factory PositionItem.safeFromJson(Map<String, dynamic>? json) {
    return PositionItem(
      positionId: NullSafetyHelper.safeInt(json?['position_id']),
      positionTitle: NullSafetyHelper.safeString(json?['position_title']),
      color: NullSafetyHelper.safeString(json?['color']),
      candidates:
          (NullSafetyHelper.safeList(
            json?['candidates'],
          )).map((e) => CandidateItem.safeFromJson(e)).toList(),
    );
  }

  factory PositionItem.empty() => const PositionItem(
    positionId: 0,
    positionTitle: '',
    color: '',
    candidates: [],
  );
}
