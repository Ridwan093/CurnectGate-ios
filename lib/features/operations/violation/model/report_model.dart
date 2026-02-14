import 'dart:io';

class Report {
  final String? category;
  final String description;
  final Map<int, String> imagePaths; // Key is index, value is path
  final Map<int, File?>? pickedFiles; // Key is index, value is file
  final bool isAnonymous;
  final String? addressId;
  final String? address;
  final String? categoryID;
  final bool isErrorBodyShow;
  final bool? isCommentInternal;
  final String? comment;
  final int? id;
  final String? reportfilter;
  const Report({
    this.reportfilter = "all",
    this.categoryID = "",
    this.category = "",
    this.description = '',
    this.addressId = "",
    this.address = "",
    this.id = 0,
    this.comment = "",
    this.isErrorBodyShow = false,
    this.isCommentInternal = false,
    Map<int, String>? imagePaths,
    Map<int, File?>? pickedFiles,
    this.isAnonymous = false,
  }) : imagePaths = imagePaths ?? const {},
       pickedFiles = pickedFiles ?? const {};

  Report copyWith({
    String? reportfilter,
    String? address,
    String? category,
    String? addressId,
    String? categoryID,
    String? description,
    Map<int, String>? imagePaths,
    Map<int, File?>? pickedFiles,
    bool? isAnonymous,
    bool? isErrorBodyShow,
    bool? isCommentInternal,
    String? comment,
    int? id,
  }) {
    return Report(
      reportfilter: reportfilter ?? this.reportfilter,
      id: id ?? this.id,
      categoryID: categoryID ?? this.categoryID,
      address: address ?? this.address,
      isCommentInternal: isCommentInternal ?? this.isCommentInternal,
      isErrorBodyShow: isErrorBodyShow ?? this.isErrorBodyShow,
      addressId: addressId ?? this.addressId,
      category: category ?? this.category,
      description: description ?? this.description,
      imagePaths: imagePaths ?? this.imagePaths,
      pickedFiles: pickedFiles ?? this.pickedFiles,
      isAnonymous: isAnonymous ?? this.isAnonymous,
      comment: comment ?? this.comment,
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

  bool get commentValid =>
      report.comment!.isNotEmpty && report.comment!.length > 5;

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
