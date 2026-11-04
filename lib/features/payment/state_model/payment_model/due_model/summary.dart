import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'summary.freezed.dart';
part 'summary.g.dart';

@freezed
class Summary with _$Summary {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory Summary({
    int? totalOutstanding,
    int? totalOverdue,
    int? count,
    int? overdueCount,
    String? minimumPayableAmount,
  }) = _Summary;

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);

  factory Summary.safeFromJson(Map<String, dynamic>? json) {
    return Summary(
      totalOutstanding: NullSafetyHelper.safeInt(json?['total_outstanding']),
      totalOverdue: NullSafetyHelper.safeInt(json?['total_overdue']),
      count: NullSafetyHelper.safeInt(json?['count']),
      overdueCount: NullSafetyHelper.safeInt(json?['overdue_count']),
      minimumPayableAmount: NullSafetyHelper.safeString(json?['total_minimum_payable']),
    );
  }

  factory Summary.empty() => const Summary(
        totalOutstanding: 0,
        totalOverdue: 0,
        count: 0,
        overdueCount: 0,
        minimumPayableAmount: '0.00',
      );
}
