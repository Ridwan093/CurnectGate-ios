// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_message.dart';

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
      id: fields[0] as int?,
      conversationId: fields[1] as int?,
      senderId: fields[2] as int?,
      messageText: fields[3] as String?,
      status: fields[4] as String?,
      isRead: fields[5] as bool?,
      isSender: fields[6] as bool?,
      timeAgo: fields[7] as String?,
      attachments: (fields[8] as List?)?.cast<Attachment>(),
      senderName: fields[9] as String?,
      senderAvatar: fields[10] as String?,
      createdAt: fields[11] as String?,
      updatedAt: fields[12] as String?,
      isSending: fields[13] as bool?,
      isFailed: fields[14] as bool?,
      hiveKey: fields[19] as int?,
      localId: fields[15] as String?,
      serverId: fields[16] as int?,
      createdLocalAt: fields[17] as DateTime?,
      syncStatus: fields[18] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Message obj) {
    writer
      ..writeByte(20)
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
      ..write(obj.timeAgo)
      ..writeByte(8)
      ..write(obj.attachments)
      ..writeByte(9)
      ..write(obj.senderName)
      ..writeByte(10)
      ..write(obj.senderAvatar)
      ..writeByte(11)
      ..write(obj.createdAt)
      ..writeByte(12)
      ..write(obj.updatedAt)
      ..writeByte(13)
      ..write(obj.isSending)
      ..writeByte(14)
      ..write(obj.isFailed)
      ..writeByte(15)
      ..write(obj.localId)
      ..writeByte(16)
      ..write(obj.serverId)
      ..writeByte(17)
      ..write(obj.createdLocalAt)
      ..writeByte(18)
      ..write(obj.syncStatus)
      ..writeByte(19)
      ..write(obj.hiveKey);
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
