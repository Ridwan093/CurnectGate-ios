import 'package:curnectgate/features/operations/OTP_Activation/model/nullSafty_model.dart';
import 'package:hive/hive.dart';

part 'attachment.g.dart';

@HiveType(typeId: 1)
class Attachment extends HiveObject {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? fileName;

  @HiveField(2)
  String? fileUrl; // Server URL after upload

  @HiveField(3)
  final String? fileType;

  @HiveField(4)
  final String? mimeType;

  @HiveField(5)
  final int? fileSize;

  @HiveField(6)
  final String? fileSizeReadable;

  @HiveField(7)
  final String? thumbnailUrl;

  @HiveField(8)
  final bool? isImage;

  @HiveField(9)
  final bool? isDocument;

  @HiveField(10)
  final bool? isVideo;

  // NEW: Keep original local path for sender
  @HiveField(11)
  String? localPath;

  Attachment({
    this.id,
    this.fileName,
    this.fileUrl,
    this.fileType,
    this.mimeType,
    this.fileSize,
    this.fileSizeReadable,
    this.thumbnailUrl,
    this.isImage,
    this.isDocument,
    this.isVideo,
    this.localPath,
  });

  factory Attachment.safeFromJson(dynamic json) {
    if (json == null) return Attachment();

    // Handle case where attachment is just a URL string (common in some WebSocket payloads)
    if (json is String) {
      final fileName = json.split('/').last.split('?').first;
      final ext = fileName.split('.').last.toLowerCase();
      
      final isImage = ['jpg', 'jpeg', 'png', 'webp', 'gif'].contains(ext);
      final isDocument = ['pdf', 'doc', 'docx', 'txt', 'xls', 'xlsx'].contains(ext);
      final isVideo = ['mp4', 'mov', 'avi', 'mkv'].contains(ext);

      return Attachment(
        fileUrl: json,
        fileName: fileName,
        fileType: ext,
        isImage: isImage,
        isDocument: isDocument,
        isVideo: isVideo,
      );
    }

    if (json is! Map) return Attachment();

    final fileUrl = NullSafetyHelper.safeString(json['file_url'] ?? json['url']);
    final fileName = NullSafetyHelper.safeString(json['file_name'] ?? json['name']);
    final fileType = NullSafetyHelper.safeString(json['file_type']).toLowerCase();
    final mimeType = NullSafetyHelper.safeString(json['mime_type']).toLowerCase();
    
    // Helper to check extension from URL or filename
    String? getExtension() {
      final source = fileUrl.isNotEmpty ? fileUrl : fileName;
      if (source.isEmpty) return null;
      try {
        final path = source.split('?').first;
        final parts = path.split('.');
        if (parts.length > 1) return parts.last.toLowerCase();
      } catch (_) {}
      return null;
    }

    final ext = getExtension();
    
    // Derive booleans from multiple sources (common in WebSocket payloads)
    final isImage = NullSafetyHelper.safeBool(json['is_image']) || 
                    fileType.contains('image') || 
                    mimeType.contains('image') ||
                    ['jpg', 'jpeg', 'png', 'webp', 'gif', 'heic'].contains(fileType) ||
                    ['jpg', 'jpeg', 'png', 'webp', 'gif', 'heic'].contains(ext);
                    
    final isDocument = NullSafetyHelper.safeBool(json['is_document']) || 
                       fileType.contains('document') || 
                       mimeType.contains('pdf') ||
                       mimeType.contains('msword') ||
                       mimeType.contains('vnd.openxmlformats-officedocument') ||
                       ['pdf', 'doc', 'docx', 'txt', 'xls', 'xlsx'].contains(fileType) ||
                       ['pdf', 'doc', 'docx', 'txt', 'xls', 'xlsx'].contains(ext);
                       
    final isVideo = NullSafetyHelper.safeBool(json['is_video']) || 
                     fileType.contains('video') || 
                     mimeType.contains('video') ||
                     ['mp4', 'mov', 'avi', 'mkv'].contains(fileType) ||
                     ['mp4', 'mov', 'avi', 'mkv'].contains(ext);

    return Attachment(
      id: NullSafetyHelper.safeInt(json['id']),
      fileName: fileName.isNotEmpty ? fileName : (ext != null ? "file.$ext" : "file"),
      fileUrl: fileUrl,
      fileType: fileType.isNotEmpty ? fileType : (ext ?? ""),
      mimeType: mimeType,
      fileSize: NullSafetyHelper.safeInt(json['file_size']),
      fileSizeReadable: NullSafetyHelper.safeString(json['file_size_readable']),
      thumbnailUrl: NullSafetyHelper.safeString(json['thumbnail_url']),
      isImage: isImage,
      isDocument: isDocument,
      isVideo: isVideo,
      localPath: null, // API never sends local path
    );
  }
}
