import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';
part 'pagination.g.dart';

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    @Default(1) int currentPage,
    @Default(10) int perPage,
    @Default(0) int total,
    @Default(1) int totalPages,
    @Default(false) bool hasMore,
  }) = _Pagination;

  factory Pagination.empty() => const Pagination();

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}