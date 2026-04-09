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
      id: NullSafetyHelper.safeInt(fields[0]),
      conversationId: NullSafetyHelper.safeInt(fields[1]),
      senderId: NullSafetyHelper.safeInt(fields[2]),
      messageText: NullSafetyHelper.safeString(fields[3]),
      status: NullSafetyHelper.safeString(fields[4]),
      isRead: NullSafetyHelper.safeBool(fields[5]),
      isSender: NullSafetyHelper.safeBool(fields[6]),
      timeAgo: NullSafetyHelper.safeString(fields[7]),

      attachments:
          fields[8] is List
              ? (fields[8] as List)
                  .map((e) => e is Attachment ? e : null)
                  .whereType<Attachment>()
                  .toList()
              : null,

      senderName: NullSafetyHelper.safeString(fields[9]),
      senderAvatar: NullSafetyHelper.safeString(fields[10]),
      createdAt: NullSafetyHelper.safeString(fields[11]),
      updatedAt: NullSafetyHelper.safeString(fields[12]),

      isSending: NullSafetyHelper.safeBool(fields[13]),
      isFailed: NullSafetyHelper.safeBool(fields[14]),
      localId: NullSafetyHelper.safeString(fields[15]),
      serverId: NullSafetyHelper.safeInt(fields[16]),

      createdLocalAt: fields[17] is DateTime ? fields[17] : DateTime.now(),

      syncStatus: NullSafetyHelper.safeString(fields[18]),
      hiveKey: NullSafetyHelper.safeInt(fields[19]),
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
