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
    if (json == null || json is! Map) return Attachment();

    return Attachment(
      id: NullSafetyHelper.safeInt(json['id']),
      fileName: NullSafetyHelper.safeString(json['file_name']),
      fileUrl: NullSafetyHelper.safeString(json['file_url']),
      fileType: NullSafetyHelper.safeString(json['file_type']),
      mimeType: NullSafetyHelper.safeString(json['mime_type']),
      fileSize: NullSafetyHelper.safeInt(json['file_size']),
      fileSizeReadable: NullSafetyHelper.safeString(json['file_size_readable']),
      thumbnailUrl: NullSafetyHelper.safeString(json['thumbnail_url']),
      isImage: NullSafetyHelper.safeBool(json['is_image']),
      isDocument: NullSafetyHelper.safeBool(json['is_document']),
      isVideo: NullSafetyHelper.safeBool(json['is_video']),
      localPath: null, // API never sends local path
    );
  }
}
