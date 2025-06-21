class Report {
  final String category;
  final String description;
  final Map<int, String> imagePaths; // Key is index, value is path
  final Map<int, ReportFile> files; // Key is index, value is file
  final bool isAnonymous;

  const Report({
    this.category = '',
    this.description = '',
    Map<int, String>? imagePaths,
    Map<int, ReportFile>? files,
    this.isAnonymous = false,
  }) : 
    imagePaths = imagePaths ?? const {},
    files = files ?? const {};

  Report copyWith({
    String? category,
    String? description,
    Map<int, String>? imagePaths,
    Map<int, ReportFile>? files,
    bool? isAnonymous,
  }) {
    return Report(
      category: category ?? this.category,
      description: description ?? this.description,
      imagePaths: imagePaths ?? this.imagePaths,
      files: files ?? this.files,
      isAnonymous: isAnonymous ?? this.isAnonymous,
    );
  }
}

class ReportFile {
  final String path;
  final String name;
  final int size;
  final String type; // 'image', 'pdf', 'doc', etc.

  const ReportFile({
    required this.path,
    required this.name,
    required this.size,
    required this.type,
  });
}

class ReportState {
  final Report report;
  final bool isLoading;
  final String? error;
  final FileOperationStatus fileOperationStatus;

  const ReportState({
    required this.report,
    this.isLoading = false,
    this.error,
    this.fileOperationStatus = FileOperationStatus.idle,
  });

  ReportState copyWith({
    Report? report,
    bool? isLoading,
    String? error,
    FileOperationStatus? fileOperationStatus,
  }) {
    return ReportState(
      report: report ?? this.report,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      fileOperationStatus: fileOperationStatus ?? this.fileOperationStatus,
    );
  }
}
enum FileOperationStatus { idle, loading, success, error }