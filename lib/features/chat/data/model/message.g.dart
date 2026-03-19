// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessageAdapter extends TypeAdapter<Message> {
  @override
  final int typeId = 0;

  @override
  Message read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Message(
      id: fields[0] as int,
      conversationId: fields[1] as int,
      senderId: fields[2] as int,
      messageText: fields[3] as String,
      status: fields[4] as String,
      isRead: fields[5] as bool,
      isSender: fields[6] as bool,
      createdAt: fields[7] as String,
      attachments: (fields[8] as List).cast<String>(),
      senderName: fields[9] as String?,
      senderAvatar: fields[10] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Message obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.conversationId)
      ..writeByte(2)
      ..write(obj.senderId)
      ..writeByte(3)
      ..write(obj.messageText)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.isRead)
      ..writeByte(6)
      ..write(obj.isSender)
      ..writeByte(7)
      ..write(obj.createdAt)
      ..writeByte(8)
      ..write(obj.attachments)
      ..writeByte(9)
      ..write(obj.senderName)
      ..writeByte(10)
      ..write(obj.senderAvatar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
