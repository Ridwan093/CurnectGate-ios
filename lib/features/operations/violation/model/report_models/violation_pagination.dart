import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'violation_pagination.freezed.dart';
part 'violation_pagination.g.dart';

@freezed
class ViolationPagination with _$ViolationPagination {
  @JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
  const factory ViolationPagination({
    @Default(1) int currentPage,
    @Default(1) int lastPage,
    @Default(15) int perPage,
    @Default(0) int total,
    int? from,
    int? to,
  }) = _ViolationPagination;

  factory ViolationPagination.fromJson(Map<String, dynamic> json) =>
      _$ViolationPaginationFromJson(json);

  factory ViolationPagination.safeFromJson(Map<String, dynamic>? json) {
    return ViolationPagination(
      currentPage: NullSafetyHelper.safeInt(json?['current_page']),
      lastPage: NullSafetyHelper.safeInt(json?['last_page']),
      perPage: NullSafetyHelper.safeInt(json?['per_page']),
      total: NullSafetyHelper.safeInt(json?['total']),
      from: json?['from'] != null ? NullSafetyHelper.safeInt(json?['from']) : null,
      to: json?['to'] != null ? NullSafetyHelper.safeInt(json?['to']) : null,
    );
  }

  factory ViolationPagination.empty() => const ViolationPagination(
        currentPage: 1,
        lastPage: 1,
        perPage: 15,
        total: 0,
      );
}
