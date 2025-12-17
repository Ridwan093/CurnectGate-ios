import 'dart:developer';
import 'dart:io';

import 'package:curnectgate/core/local_store/share_prefrence.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

final profilePicProvider = StateNotifierProvider<ProfilePicNotifier, File?>(
  (ref) => ProfilePicNotifier(ref),
);

class ProfilePicNotifier extends StateNotifier<File?> {
  final Ref ref;

  ProfilePicNotifier(this.ref) : super(null) {
    loadProfilePic();
  }
  Future<void> clearAllProfilePics() async {
  final dir = await getApplicationDocumentsDirectory();
  final files = dir.listSync();

  for (var file in files) {
    if (file.path.contains("profile_") && file is File) {
      await file.delete();
    }
  }

  state = null;
}


  Future<void> loadProfilePic() async {
    final url = await SharedPrefsService().getMedialUrl();
    final user = await SharedPrefsService().getAuthData(); // YOUR METHOD

    final userId = user?["id"] ?? 0;

    if (url == null || userId == null) return;

    final dir = await getApplicationDocumentsDirectory();
    final filePath = '${dir.path}/profile_$userId.jpg';
    final file = File(filePath);
    log(file.path.toString());
    // If file exists, use it
    if (await file.exists()) {
      state = file;
      return;
    }

    // Otherwise download fresh
    try {
      final response = await Dio().get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );

      final newFile = await file.writeAsBytes(response.data!);
      state = newFile;
    } catch (e) {
      print("Failed to download profile pic: $e");
    }
  }

  Future<void> refreshProfilePic() async {
    final url = await SharedPrefsService().getMedialUrl();
    final user = await SharedPrefsService().getAuthData(); // YOUR METHOD

    final userId = user?["id"] ?? 0;

    log("Here is the refrefrProfile $userId");

    if (url == null || userId == null) return;

    final dir = await getApplicationDocumentsDirectory();
    final filePath = '${dir.path}/profile_$userId.jpg';
    final file = File(filePath);

    if (await file.exists()) {
      await file.delete();
    }

    try {
      final response = await Dio().get<List<int>>(
        url,
        options: Options(responseType: ResponseType.bytes),
      );
      final newFile = await file.writeAsBytes(response.data!);
      state = newFile;
    } catch (e) {
      print("Failed to refresh profile pic: $e");
    }
  }
}
