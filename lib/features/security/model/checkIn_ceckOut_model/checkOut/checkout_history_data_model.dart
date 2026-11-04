// checkout_history_data_model.dart
import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:curnectgate/features/security/model/checkIn_ceckOut_model/visitor_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';



part 'checkout_history_data_model.freezed.dart';
part 'checkout_history_data_model.g.dart';
 // checkout_history_data_model.dart

@freezed
@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class CheckoutHistoryData with _$CheckoutHistoryData {
  const CheckoutHistoryData._(); // Add private constructor

  const factory CheckoutHistoryData({
    List<VisitorModel>? history,
    int? count,
    bool? showingMyVisitorsOnly,
  }) = _CheckoutHistoryData;

  factory CheckoutHistoryData.fromJson(Map<String, dynamic> json) =>
      _$CheckoutHistoryDataFromJson(json);

  factory CheckoutHistoryData.fromSafeJson(Map<String, dynamic> json) {
    return CheckoutHistoryData(
      history: _historyFromJson(json['history']),
      count: NullSafetyHelper.safeInt(json['count']),
      showingMyVisitorsOnly: NullSafetyHelper.safeBool(json['showing_my_visitors_only']),
    );
  }

  // Helper method to safely convert history list to List<VisitorModel>
  static List<VisitorModel>? _historyFromJson(dynamic value) {
    if (value == null) return null;
    if (value is! List) return <VisitorModel>[];

    return value
        .map((item) => NullSafetyHelper.safeModel(
              item,
              VisitorModel.fromSafeJson,
              VisitorModel.empty(),
            ))
        .whereType<VisitorModel>()
        .toList();
  }

  factory CheckoutHistoryData.empty() => const CheckoutHistoryData(
        history: null,
        count: null,
        showingMyVisitorsOnly: null,
      );
}