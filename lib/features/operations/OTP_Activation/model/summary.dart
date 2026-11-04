import 'package:freezed_annotation/freezed_annotation.dart';

part 'summary.freezed.dart';
part 'summary.g.dart';

@freezed
class Summary with _$Summary {
  const factory Summary({
    @Default(0) int totalGenerated,
    @Default(0) int scheduled,
    @Default(0) int active,
    @Default(0) int used,
    @Default(0) int expired,
    @Default(0) int revoked,
    @Default(0) int pendingValidation,
    @Default(0) int thisMonth,
    @Default(0) int thisWeek,
  }) = _Summary;

  factory Summary.empty() => const Summary();

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);
}