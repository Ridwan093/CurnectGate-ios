import 'dart:developer';

import 'package:curnectgate/features/%20operations/violation/model/report_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final currentEditingIndexProvider = StateProvider<int?>((ref) => null);
final reportProvider = StateNotifierProvider<ReportNotifier, ReportState>((ref) {
  return ReportNotifier();
});

class ReportNotifier extends StateNotifier<ReportState> {
  ReportNotifier()
      : super(ReportState(
          report: Report(),
          isLoading: false,
        ));

  void setCategory(String category) {
    state = state.copyWith(
      report: state.report.copyWith(category: category),
    );
  }

  void setDescription(String description) {
    state = state.copyWith(
      report: state.report.copyWith(description: description),
    );
  }

  void addImage(String imagePath, int index) {
    final newImagePaths = Map<int, String>.from(state.report.imagePaths);
    newImagePaths[index] = imagePath;
    
    // Remove any file that might be at this index
    final newFiles = Map<int, ReportFile>.from(state.report.files);
    newFiles.remove(index);

    state = state.copyWith(
      report: state.report.copyWith(
        imagePaths: newImagePaths,
        files: newFiles,
      ),
    );
  }

  Future<void> addFile(int index) async {
    state = state.copyWith(fileOperationStatus: FileOperationStatus.loading);
    
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx', 'txt'],
      );

      if (result != null && result.files.single.path != null) {
        final file = result.files.single;
        final extension = file.extension?.toLowerCase() ?? 'file';
        
        final reportFile = ReportFile(
          path: file.path!,
          name: file.name,
          size: file.size,
          type: extension,
        );

        final newFiles = Map<int, ReportFile>.from(state.report.files);
        newFiles[index] = reportFile;
        
        // Remove any image that might be at this index
        final newImagePaths = Map<int, String>.from(state.report.imagePaths);
        newImagePaths.remove(index);

        state = state.copyWith(
          report: state.report.copyWith(
            files: newFiles,
            imagePaths: newImagePaths,
          ),
          fileOperationStatus: FileOperationStatus.success,
        );
      }
    } catch (e) {
      state = state.copyWith(
        error: 'Failed to add file: ${e.toString()}',
        fileOperationStatus: FileOperationStatus.error,
      );
    }
  }

  void removeImageOrFile(int index) {
    final newImagePaths = Map<int, String>.from(state.report.imagePaths);
    final newFiles = Map<int, ReportFile>.from(state.report.files);
    
    newImagePaths.remove(index);
    newFiles.remove(index);

    state = state.copyWith(
      report: state.report.copyWith(
        imagePaths: newImagePaths,
        files: newFiles,
      ),
    );
  }


  void toggleAnonymous() {
    state = state.copyWith(
      report: state.report.copyWith(
        isAnonymous: !state.report.isAnonymous,
      ),
    );
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  Future<void> submitReport() async {
  setLoading(true);
  try {
    final currentReport = state.report;
    
    // Convert Map<int, ReportFile> to list of file maps
    final fileList = currentReport.files.entries.map((entry) {
      final file = entry.value; // This is the ReportFile
      return <String, dynamic>{
        'id': entry.key, // Include the original index if needed
        'path': file.path,
        'name': file.name,
        'size': file.size,
        'type': file.type,
      };
    }).toList();

    // Prepare the complete report data
    final reportData = <String, dynamic>{
      'category': currentReport.category,
      'description': currentReport.description,
      'isAnonymous': currentReport.isAnonymous,
      'images': currentReport.imagePaths.values.toList(), // Convert Map values to list
      'files': fileList,
    };

    log('Submitting report: $reportData');
    
    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));
    
    // Reset after submission
    state = ReportState(report: Report());
  } catch (e) {
    state = state.copyWith(error: 'Failed to submit report: ${e.toString()}');
    rethrow;
  } finally {
    setLoading(false);
  }
}
}
