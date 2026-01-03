
import 'package:flutter/material.dart';

class DisplayFilecard extends StatelessWidget {
  final  chatState;
  const DisplayFilecard({super.key, required this.chatState});

  @override
  Widget build(BuildContext context) {
    // final filePath = chatState.selectedFilePath;
    final fileName = chatState.selectedFileName;
    final fileSize = chatState.selectedFileSize;
    return Positioned(
      right: 10,
      bottom: 51,
      child: Material(
        elevation: 3, // Subtle shadow
        borderRadius: BorderRadius.circular(12),
        child: Container(
          constraints: BoxConstraints(maxWidth: 200), // Prevent too wide
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // File icon with background
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50, // Light blue background
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  _getFileIcon(fileName),
                  color: Colors.blueAccent,
                  size: 28,
                ),
              ),

              SizedBox(width: 12),

              // File info
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // File name (ellipsis if too long)
                    Text(
                      fileName ?? 'Untitled',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: 4),

                    // File size + type
                    Text(
                      '${_formatFileSize(fileSize)} • ${_getFileIcon(fileName)}',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),

              // Optional close button
            ],
          ),
        ),
      ),
    );
  }

  String _formatFileSize(int? sizeInBytes) {
    if (sizeInBytes == null) return '';
    if (sizeInBytes < 1024) return '$sizeInBytes B';
    if (sizeInBytes < 1024 * 1024)
      return '${(sizeInBytes / 1024).toStringAsFixed(1)} KB';
    return '${(sizeInBytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  IconData _getFileIcon(String? fileName) {
    if (fileName == null) return Icons.insert_drive_file;
    final ext = fileName.split('.').last.toLowerCase();
    switch (ext) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'txt':
        return Icons.notes;
      default:
        return Icons.insert_drive_file;
    }
  }
}
