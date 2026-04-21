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
      id: fields[0] as int?,
      fileName: fields[1] as String?,
      fileUrl: fields[2] as String?,
      fileType: fields[3] as String?,
      mimeType: fields[4] as String?,
      fileSize: fields[5] as int?,
      fileSizeReadable: fields[6] as String?,
      thumbnailUrl: fields[7] as String?,
      isImage: fields[8] as bool?,
      isDocument: fields[9] as bool?,
      isVideo: fields[10] as bool?,
      localPath: fields[11] as String?,
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
