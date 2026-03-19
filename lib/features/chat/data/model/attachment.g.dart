// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AttachmentAdapter extends TypeAdapter<Attachment> {
  @override
  final int typeId = 1;

  @override
  Attachment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Attachment(
      id: NullSafetyHelper.safeInt(fields[0]),
      fileName: NullSafetyHelper.safeString(fields[1]),
      fileUrl: NullSafetyHelper.safeString(fields[2]),
      fileType: NullSafetyHelper.safeString(fields[3]),
      mimeType: NullSafetyHelper.safeString(fields[4]),
      fileSize: NullSafetyHelper.safeInt(fields[5]),
      fileSizeReadable: NullSafetyHelper.safeString(fields[6]),
      thumbnailUrl: NullSafetyHelper.safeString(fields[7]),
      isImage: NullSafetyHelper.safeBool(fields[8]),
      isDocument: NullSafetyHelper.safeBool(fields[9]),
      isVideo: NullSafetyHelper.safeBool(fields[10]),
      localPath: NullSafetyHelper.safeString(fields[11]),
    );
  }

  @override
  void write(BinaryWriter writer, Attachment obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fileName)
      ..writeByte(2)
      ..write(obj.fileUrl)
      ..writeByte(3)
      ..write(obj.fileType)
      ..writeByte(4)
      ..write(obj.mimeType)
      ..writeByte(5)
      ..write(obj.fileSize)
      ..writeByte(6)
      ..write(obj.fileSizeReadable)
      ..writeByte(7)
      ..write(obj.thumbnailUrl)
      ..writeByte(8)
      ..write(obj.isImage)
      ..writeByte(9)
      ..write(obj.isDocument)
      ..writeByte(10)
      ..write(obj.isVideo)
      ..writeByte(11)
      ..write(obj.localPath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AttachmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
