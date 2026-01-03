import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_filex/open_filex.dart';

class ShowFile extends ConsumerWidget {
  final message;
  const ShowFile(this.message, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4), // Space between chat bubbles
      child: GestureDetector(
        onTap: () => OpenFilex.open(message.file!),
        child: Material(
          elevation: 1, // More subtle shadow for chat
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth:
                  MediaQuery.of(context).size.width * 0.7, // Responsive width
              minWidth: 150,
              maxHeight: 80,
            ),
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Row(
                children: [
                  // File icon container
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: _getFileColor(message.selectedFileName),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getFileIcon(message.selectedFileName),
                      color: Colors.white,
                      size: 24,
                    ),
                  ),

                  SizedBox(width: 12),

                  // File info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // File name
                        Text(
                          message.selectedFileName ?? 'Untitled',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                          ),
                          maxLines: 1,
                        ),

                        SizedBox(height: 4),

                        // File size and type
                        Text(
                          '${_formatFileSize(message.selectedFileSize)} • ${_getFileType(message.selectedFileName)}',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Download/Open indicator
                  Icon(
                    Icons.arrow_outward,
                    size: 18,
                    color: Colors.grey.shade500,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper methods
  String _formatFileSize(int? sizeInBytes) {
    if (sizeInBytes == null) return '0 B';
    if (sizeInBytes < 1024) return '$sizeInBytes B';
    if (sizeInBytes < 1024 * 1024) {
      return '${(sizeInBytes / 1024).toStringAsFixed(1)} KB';
    }
    return '${(sizeInBytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  String _getFileType(String? fileName) {
    if (fileName == null) return 'File';
    final ext = fileName.split('.').last.toLowerCase();
    return ext.toUpperCase(); // Returns "PDF", "DOCX", etc.
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
      case 'xls':
      case 'xlsx':
        return Icons.table_chart;
      case 'ppt':
      case 'pptx':
        return Icons.slideshow;
      case 'txt':
        return Icons.notes;
      case 'zip':
      case 'rar':
        return Icons.archive;
      default:
        return Icons.insert_drive_file;
    }
  }

  Color _getFileColor(String? fileName) {
    if (fileName == null) return Colors.blueAccent;
    final ext = fileName.split('.').last.toLowerCase();
    switch (ext) {
      case 'pdf':
        return Colors.redAccent;
      case 'doc':
      case 'docx':
        return Colors.blueAccent;
      case 'xls':
      case 'xlsx':
        return Colors.greenAccent;
      case 'ppt':
      case 'pptx':
        return Colors.orangeAccent;
      default:
        return Colors.blueGrey;
    }
  }
}
