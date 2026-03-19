import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

class ShowFile extends StatefulWidget {
  final String path; // can be local OR url
  const ShowFile(this.path, {super.key});

  @override
  State<ShowFile> createState() => _ShowFileState();
}

class _ShowFileState extends State<ShowFile> {
  bool downloading = false;
  String? localPath;
  String size = "";

  @override
  void initState() {
    super.initState();
    _prepare();
  }

  bool get isUrl => widget.path.startsWith("http");

  String getFileName(String path) {
    return path.split('/').last;
  }

  Future<void> _prepare() async {
    if (!isUrl) {
      localPath = widget.path;
      size = await _getFileSize(widget.path);
      setState(() {});
    }
  }

  Future<String> _getFileSize(String path) async {
    final file = File(path);
    if (!file.existsSync()) return "";
    final bytes = await file.length();

    if (bytes < 1024) return "$bytes B";
    if (bytes < 1024 * 1024) {
      return "${(bytes / 1024).toStringAsFixed(1)} KB";
    }
    return "${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB";
  }

  Future<void> _download() async {
    setState(() => downloading = true);

    try {
      final dir = await getApplicationDocumentsDirectory();

      final filePath = "${dir.path}/${getFileName(widget.path)}";

      final response = await Dio().download(widget.path, filePath);

      localPath = filePath;
      size = await _getFileSize(filePath);

      setState(() {});
    } catch (e) {
      debugPrint("Download failed $e");
    }

    setState(() => downloading = false);
  }

  void _open() {
    if (localPath != null) {
      OpenFilex.open(localPath!);
    } else if (isUrl) {
      _download();
    }
  }

  @override
  Widget build(BuildContext context) {
    final fileName = getFileName(widget.path);

    return GestureDetector(
      onTap: _open,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.all(12),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .7,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
        ),
        child: Row(
          children: [
            Icon(Icons.picture_as_pdf, color: Colors.red),
            const SizedBox(width: 10),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fileName, maxLines: 1, overflow: TextOverflow.ellipsis),

                  const SizedBox(height: 4),

                  Text(
                    localPath != null
                        ? size
                        : downloading
                        ? "Downloading..."
                        : "Tap to download",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),

            if (downloading)
              const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            else
              Icon(
                localPath != null ? Icons.open_in_new : Icons.download,
                size: 18,
              ),
          ],
        ),
      ),
    );
  }
}
