// image_upload_provider.dart
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final workImagesProvider =
    StateNotifierProvider<WorkImagesNotifier, List<File>>((ref) {
  return WorkImagesNotifier();
});

class WorkImagesNotifier extends StateNotifier<List<File>> {
  WorkImagesNotifier() : super([]);

  void addImage(File file) {
    if (state.length >= 2) return; // max 2
    state = [...state, file];
  }

  void removeImage(int index) {
    state = [...state]..removeAt(index);
  }

  void clear() {
    state = [];
  }
}
