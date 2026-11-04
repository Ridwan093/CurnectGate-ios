// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'M_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageEnumAdapter extends TypeAdapter<MessageEnum> {
  @override
  final int typeId = 0;

  @override
  MessageEnum read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return MessageEnum.text;
      case 1:
        return MessageEnum.image;
      case 2:
        return MessageEnum.audio;
      case 3:
        return MessageEnum.video;
      case 4:
        return MessageEnum.gif;
      default:
        return MessageEnum.text;
    }
  }

  @override
  void write(BinaryWriter writer, MessageEnum obj) {
    switch (obj) {
      case MessageEnum.text:
        writer.writeByte(0);
        break;
      case MessageEnum.image:
        writer.writeByte(1);
        break;
      case MessageEnum.audio:
        writer.writeByte(2);
        break;
      case MessageEnum.video:
        writer.writeByte(3);
        break;
      case MessageEnum.gif:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageEnumAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
