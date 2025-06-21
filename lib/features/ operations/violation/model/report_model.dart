class Report {
  final String category;
  final String description;
  final List<String> imagePaths;
  final bool isAnonymous;

  const Report({
    this.category = '',
    this.description = '',
    this.imagePaths = const [],
    this.isAnonymous = false,
  });

  Report copyWith({
    String? category,
    String? description,
    List<String>? imagePaths,
    bool? isAnonymous,
  }) {
    return Report(
      category: category ?? this.category,
      description: description ?? this.description,
      imagePaths: imagePaths ?? this.imagePaths,
      isAnonymous: isAnonymous ?? this.isAnonymous,
    );
  }
}

class ReportState {
  final Report report;
  final bool isLoading;

  const ReportState({
    required this.report,
    this.isLoading = false,
  });

  ReportState copyWith({
    Report? report,
    bool? isLoading,
  }) {
    return ReportState(
      report: report ?? this.report,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
List<Report> report = [];
