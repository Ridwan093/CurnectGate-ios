import 'package:freezed_annotation/freezed_annotation.dart';
import 'history_item.dart';
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';

part 'history_data.freezed.dart';
part 'history_data.g.dart';

@freezed
class HistoryData with _$HistoryData {
  const factory HistoryData({
    List<HistoryItem>? history,
    int? total,
  }) = _HistoryData;

  factory HistoryData.safeFromJson(Map<String, dynamic>? json) {
    return HistoryData(
      history: NullSafetyHelper.safeList(json?['history'])
          .map((e) => HistoryItem.fromJson(e))
          .toList(),
      total: NullSafetyHelper.safeInt(json?['total']),
    );
  }

  factory HistoryData.fromJson(Map<String, dynamic> json) =>
      _$HistoryDataFromJson(json);
}
