import 'dart:developer';
import 'dart:io';

import 'package:curnectgate/features/%20operations/violation/model/report_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

final currentEditingIndexProvider = StateProvider<int?>((ref) => null);
final reportProvider = StateNotifierProvider<ReportNotifier, ReportState>((
  ref,
) {
  return ReportNotifier();
});

class ReportNotifier extends StateNotifier<ReportState> {
  ReportNotifier() : super(ReportState(report: Report(), isLoading: false));

  void setCategory(String category, String categoryID) {
    state = state.copyWith(
      report: state.report.copyWith(category: category, categoryID: categoryID),
    );
  }

  void setReportFilter(String filter) {
    state = state.copyWith(report: state.report.copyWith(reportfilter: filter));
  }

  void setDescription(String description) {
    state = state.copyWith(
      report: state.report.copyWith(description: description),
    );
  }

  void setId(int id) {
    state = state.copyWith(report: state.report.copyWith(id: id));
  }

  void setcomment(String comment) {
    state = state.copyWith(report: state.report.copyWith(comment: comment));
  }

  void setCommentInternal(bool val) {
    state = state.copyWith(
      report: state.report.copyWith(isCommentInternal: val),
    );
  }

  void updateErrorShow(bool value) {
    state = state.copyWith(
      report: state.report.copyWith(isErrorBodyShow: value),
    );
  }

  void addImage(String? imagePath, int index) {
    try {
      // 1. Validate imagePath is not null
      if (imagePath == null) {
        throw Exception('Image path cannot be null');
      }

      // 2. Validate file exists
      final file = File(imagePath);
      if (!file.existsSync()) {
        throw Exception('File does not exist at path: $imagePath');
      }

      // 3. Create new maps (immutable update pattern)
      final newImagePaths = Map<int, String>.from(state.report.imagePaths);
      final newFiles = Map<int, String>.from(state.report.files);

      // 4. Update the maps
      newImagePaths[index] = imagePath; // Now guaranteed non-null
      newFiles.remove(index);

      // 5. Update state
      state = state.copyWith(
        report: state.report.copyWith(
          imagePaths: newImagePaths,
          files: newFiles,
        ),
      );

      log('Successfully added image at index $index: $imagePath');
    } catch (e, stackTrace) {
      log('Error adding image: $e');
      log('Stack trace: $stackTrace');
      state = state.copyWith(error: 'Failed to add image: ${e.toString()}');
    }
  }

  void setEstateAddressID(String id, String address) {
    state = state.copyWith(
      report: state.report.copyWith(addressId: id, address: address),
    );
  }

  void resetState() {
    state = state.copyWith(
      report: state.report.copyWith(
        imagePaths: null,
        category: "",
        description: '',
        isAnonymous: false,
        addressId: '',
        files: null,
        comment: "",
        categoryID: '',
        address: "",
        isCommentInternal: false,
        id: 0,
      ),
    );
    removeImageOrFile(1);
    removeImageOrFile(0);
  }

  Future<void> addFile(int index) async {
    state = state.copyWith(fileOperationStatus: FileOperationStatus.loading);

    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        final pickedFile = result.files.single;
        final originalPath = pickedFile.path!;

        // 1. Create permanent storage directory
        final appDir = await getApplicationDocumentsDirectory();
        final permanentDir = Directory('${appDir.path}/user_files');
        if (!await permanentDir.exists()) {
          await permanentDir.create(recursive: true);
        }

        // 2. Generate unique filename
        final extension = p.extension(originalPath).toLowerCase();
        final newFileName =
            '${DateTime.now().millisecondsSinceEpoch}$extension';
        final newPath = '${permanentDir.path}/$newFileName';

        // 3. Copy file to permanent location
        final originalFile = File(originalPath);
        final newFile = await originalFile.copy(newPath);

        // 4. Store the permanent path
        final newFiles = Map<int, String>.from(state.report.files);
        newFiles[index] = newFile.path;

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
    } catch (e, stackTrace) {
      log('File picker error: $e\n$stackTrace');
      state = state.copyWith(
        error: 'Failed to add file: ${e.toString()}',
        fileOperationStatus: FileOperationStatus.error,
      );
    }
  }

  void removeImageOrFile(int index) {
    final newImagePaths = Map<int, String>.from(state.report.imagePaths);
    final newFiles = Map<int, String>.from(state.report.files);

    newImagePaths.remove(index);
    newFiles.remove(index);

    state = state.copyWith(
      report: state.report.copyWith(imagePaths: newImagePaths, files: newFiles),
    );
  }

  void toggleAnonymous() {
    state = state.copyWith(
      report: state.report.copyWith(isAnonymous: !state.report.isAnonymous),
    );
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  Future<void> submitReport() async {
    setLoading(true);
    try {
      // Convert Map<int, ReportFile> to list of file maps

      // Prepare the complete report data

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
